<?php

namespace App\Http\Controllers;

use App\Helpers\ResponseEnum;
use App\Http\Requests\Teacher\CreateRequest;
use App\Http\Requests\Teacher\CreateSchoolRequest;
use App\Http\Requests\Teacher\CreateStudentRequest;
use App\Http\Requests\Teacher\InviteRegisterRequest;
use App\Http\Requests\Teacher\InviteRequest;
use App\Http\Requests\Teacher\LoginRequest;
use App\Mail\InviteMail;
use App\Models\Message;
use App\Models\School;
use App\Models\SchoolStudent;
use App\Models\SchoolTeacher;
use App\Models\Student;
use App\Models\StudentWatchTeacher;
use App\Models\Teacher;
use App\Services\TeacherService;
use Carbon\Carbon;
use GatewayClient\Gateway;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    public function login(LoginRequest $request)
    {
        $user = Teacher::where('email', $request->email)->first();
        $this->checkPassword($user, $request);

        $token = $this->getToken($user);
        $user->role = $user->roles()->first();
        return $this->success(['user' => $user, 'token' => $token]);
    }

    public function info()
    {
        $user = \Auth::user();
        return $this->success(['user' => $user]);
    }

    public function create(CreateRequest $request)
    {
        $user = app(TeacherService::class)->create($request->name, $request->email, $request->password);
        return $this->success($user);
    }

    /**
     * 创建学校
     * @param CreateSchoolRequest $request
     * @return mixed
     */
    public function createSchool(CreateSchoolRequest $request)
    {
        $user = \Auth::user();
        $data = [
            'name' => $request->name,
            'apply_id' => $user->id,
            'own_id' => $user->id,
        ];
        $school = School::create($data);
        //app(TeacherService::class)->inviteRegister($school->id, $user);
        return $this->success($school);
    }

    /**
     * 邀请教师发送邮件
     * @return void
     */
    public function invite(InviteRequest $request)
    {
        $url = env('APP_URL') . '/api/teacher/invite_register?email=' . $request->email . '&school_id=' . $request->school_id;
        Mail::to($request->email)->send(new InviteMail($url));
        return $this->message();
    }

    /**
     * 点击邀请链接并注册
     * @param InviteRegisterRequest $request
     * @return mixed
     */
    public function inviteRegister(InviteRegisterRequest $request)
    {
        $name = explode("@", $request->email)[0];
        $email = $request->email;
        $schoolId = $request->school_id;

        $teacherService = app(TeacherService::class);
        $user = $teacherService->create($name, $email, '123456');
        $teacherService->inviteRegister($schoolId, $user);
        return $this->success('请打开链接登录，初始密码(123456)：' . env('WEB_URL'), ResponseEnum::INVITE_OK);
    }

    /**
     * 我的学校列表
     * @param Request $request
     * @return mixed
     */
    public function schoolList(Request $request)
    {
        $schools = School::where('apply_id', \Auth::user()->id)->with(['apply', 'own'])->paginate($request->page_size);

        /** @var Collection $schools */
        $schools->transform(function ($item, $key) {
            return $item->append(['status_name']);
        });
        $schools = $this->dataFormat($schools);
        return $this->success($schools);
    }

    /**
     * 创建学生账号
     * @param CreateStudentRequest $request
     * @return mixed
     * @throws \App\Exceptions\ApiException
     */
    public function createStudent(CreateStudentRequest $request)
    {
        if (!School::where(['own_id' => \Auth::user()->id, 'id' => $request->school_id])->count()) {
            $this->failed(ResponseEnum::NOT_SCHOOL_MANAGE);
        }

        $teacherService = app(TeacherService::class);
        $user = $teacherService->createStudent($request->name, $request->email, bcrypt($request->password));
        $teacherService->bindSchool($request->school_id, $user);

        return $this->success($user);
    }

    /**
     * 我的学生
     * @param Request $request
     * @return mixed
     */
    public function studentList(Request $request)
    {
        $schoolIds = SchoolTeacher::where('teacher_id', \Auth::user()->id)->pluck('school_id');
        $schoolIds = $schoolIds->merge(School::where('own_id', \Auth::user()->id)->pluck('id'));
        $students = SchoolStudent::whereIn('school_id', $schoolIds)->paginate($request->page_size);

        /** @var Collection $students */
        $students->transform(function ($item, $key) {
            return $item->append(['student_name']);
        });
        $students = $this->dataFormat($students);
        return $this->success($students);
    }

    /**
     * 关注我的学生
     * @return mixed
     */
    public function watchedStudent(Request $request)
    {
        $watchList = StudentWatchTeacher::where('teacher_id', \Auth::user()->id)->paginate($request->page_size);

        /** @var Collection $watchList */
        $watchList->transform(function ($item, $key) {
            return $item->append(['student_name']);
        });
        $watchList = $this->dataFormat($watchList);

        return $this->success($watchList);
    }

    /**
     * 学校教师列表
     * @return mixed
     */
    public function schoolTeacherList(Request $request)
    {
        $teachers = Teacher::whereIn('id', SchoolTeacher::where('school_id', $request->school_id)->pluck('teacher_id'))->paginate($request->page_size);

        $teachers = $this->dataFormat($teachers);

        return $this->success($teachers);
    }

    /**
     * 教师绑定ws
     * @param Request $request
     * @return mixed
     */
    public function wkBind(Request $request)
    {
        $userId = \Auth::user()->id;
        $clientId = $request->get('client_id');
        //Gateway::$registerAddress = '127.0.0.1:1236';
        Gateway::bindUid($clientId, 'teacher_' . $userId);
        Gateway::joinGroup($clientId, 'teacher');

        Gateway::sendToUid('teacher_' . $userId, '111');
        return $this->success('client_id绑定成功');
    }

    /**
     * 教师给学生发消息
     * @param Request $request
     * @return mixed
     */
    public function sendMegToStudent(Request $request)
    {
        $studentId = 'student_' . $request->get('user_id');
        if (!$request->get('user_id')){
            return $this->failed(ResponseEnum::NOT_ADMIN_MESSAGE);
        }
        $message = json_encode([
            'from_id' => \Auth::user()->id,
            'from_name' => \Auth::user()->name,
            'message' => $request->get('message'),
            'type' => 'talk',
        ]);

        $isOnline = Gateway::isUidOnline($studentId);
        if ($isOnline) {
            Gateway::sendToUid($studentId, $message);
        }

        //消息入库
        $data = [
            'from' => \Auth::user()->id,
            'to' => $request->get('user_id'),
            'type' => Message::TYPE_TALL,
            'message_type' => Message::MESSAGE_TYPE_TTS,
            'message' => $request->get('message')
        ];
        Message::create($data);
        return $this->success('发送成功');
    }

    /**
     * 获取历史消息
     * @param Request $request
     * @return mixed
     */
    public function getHistoryMessage(Request $request)
    {
        $studentId = $request->get('student_id');
        $myId = \Auth::user()->id;
        $messages = Message::where(['from' => $studentId, 'to' => $myId])->orWhere(function ($query) use ($myId, $studentId) {
            $query->where(['from' => $myId, 'to' => $studentId]);
        })->orderByDesc('id')->limit(10)->get();

        $student = Student::find($studentId);
        $messages = $messages->map(function ($field) use ($student) {
            return collect([
                'date' => Carbon::make($field->created_at)->toDateTimeString(),
                'text' => ['text' => $field->message],
                'mine' => !$field->type == Message::TYPE_PUSH && $field->message_type == Message::MESSAGE_TYPE_TTS,
                'name' => $field->type == Message::TYPE_PUSH ? 'admin' : $student->name,
            ]);
        });
        return $this->success($messages->reverse()->values());
    }

    /**
     * 获取消息用户
     * @return mixed
     */
    public function getMessageUser()
    {
        $schoolIds = SchoolTeacher::where('teacher_id', \Auth::user()->id)->pluck('school_id');
        $schoolIds = $schoolIds->merge(School::where('own_id', \Auth::user()->id)->pluck('id'));
        $students = SchoolStudent::whereIn('school_id', $schoolIds)->get()->each->setAppends(['student_name']);

        $students = $students->map(function ($field) {
            return collect([
                'id' => $field->student_id,
                'name' => $field->student_name,
            ]);
        });
        $admin = collect([
            'id' => 0,
            'name' => 'admin',
        ]);
        return $this->success($students->push($admin));
    }

    //todo 5.Line接入
}
