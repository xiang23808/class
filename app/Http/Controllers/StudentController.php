<?php

namespace App\Http\Controllers;

use App\Helpers\ResponseEnum;
use App\Http\Requests\Student\GetHistoryMessageRequest;
use App\Http\Requests\Student\LoginRequest;
use App\Http\Requests\Student\SendMegToTeacherRequest;
use App\Http\Requests\Student\UnWatchRequest;
use App\Http\Requests\Student\WatchRequest;
use App\Http\Requests\Student\WkBindRequest;
use App\Models\Message;
use App\Models\SchoolStudent;
use App\Models\SchoolTeacher;
use App\Models\Student;
use App\Models\StudentWatchTeacher;
use App\Models\Teacher;
use Carbon\Carbon;
use GatewayClient\Gateway;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Log;

class StudentController extends Controller
{
    public function login(LoginRequest $request)
    {
        $user = Student::where('email', $request->email)->first();
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

    /**
     * 学校教师列表
     * @param Request $request
     * @return mixed
     */
    public function teacherList(Request $request)
    {
        $schoolStudent = SchoolStudent::where('student_id', \Auth::user()->id)->first();
        $teacherIds = SchoolTeacher::where('school_id', $schoolStudent->school_id)->pluck('teacher_id');
        $teachers = Teacher::whereIn('id', $teacherIds)->paginate($request->page_size);
        /** @var Collection $teachers */
        $teachers->transform(function ($item, $key) {
            $item->watched = StudentWatchTeacher::where(['student_id' => \Auth::user()->id, 'teacher_id' => $item->id])->count() ? true : false;
            return $item;
        });

        $teachers = $this->dataFormat($teachers);

        return $this->success($teachers);
    }

    /**
     * 关注教师
     * @param WatchRequest $request
     * @return mixed
     * @throws \App\Exceptions\ApiException
     */
    public function watchTeacher(WatchRequest $request)
    {
        $schoolStudent = SchoolStudent::where('student_id', \Auth::user()->id)->first();
        if (!SchoolTeacher::where(['school_id' => $schoolStudent->school_id, 'teacher_id' => $request->teacher_id])->count()) {
            $this->failed(ResponseEnum::NOT_SAME_SCHOOL);
        }

        $data = [
            'student_id' => \Auth::user()->id,
            'teacher_id' => $request->teacher_id,
        ];

        if (StudentWatchTeacher::where($data)->count()) {
            $this->failed(ResponseEnum::WATCHED);
        }
        StudentWatchTeacher::create($data);
        return $this->message();
    }

    /**
     * 取消关注教师
     * @param UnWatchRequest $request
     * @return mixed
     * @throws \App\Exceptions\ApiException
     */
    public function unWatchTeacher(UnWatchRequest $request)
    {
        $data = [
            'student_id' => \Auth::user()->id,
            'teacher_id' => $request->teacher_id,
        ];

        if (!StudentWatchTeacher::where($data)->count()) {
            $this->failed(ResponseEnum::UNWATCHED);
        }
        StudentWatchTeacher::where($data)->delete();
        return $this->message();
    }

    /**
     * 关注教师列表
     * @return mixed
     */
    public function watchTeacherList()
    {
        $watchList = StudentWatchTeacher::where('student_id', \Auth::user()->id)->paginate();

        /** @var Collection $watchList */
        $watchList->transform(function ($item, $key) {
            return $item->append(['teacher_name']);
        });
        $watchList = $this->dataFormat($watchList);

        return $this->success($watchList);
    }

    /**
     * 学生绑定ws
     * @param WkBindRequest $request
     * @return mixed
     */
    public function wkBind(WkBindRequest $request)
    {
        $userId = \Auth::user()->id;
        $clientId = $request->get('client_id');
        //Gateway::$registerAddress = '127.0.0.1:1236';
        Gateway::bindUid($clientId, 'student_' . $userId);
        Gateway::joinGroup($clientId, 'student');

        return $this->success('client_id绑定成功');
    }

    /**
     * 学生给教师发消息
     * @param SendMegToTeacherRequest $request
     * @return mixed
     */
    public function sendMegToTeacher(SendMegToTeacherRequest $request)
    {
        $teacherId = 'teacher_' . $request->get('user_id');
        $message = json_encode([
            'from_id' => \Auth::user()->id,
            'from_name' => \Auth::user()->name,
            'message' => $request->get('message'),
            'type' => 'talk',
        ]);

        $isOnline = Gateway::isUidOnline($teacherId);Log::info($isOnline);
        if ($isOnline) {
            Gateway::sendToUid($teacherId, $message);
        }
        //消息入库
        $data = [
            'from' => \Auth::user()->id,
            'to' => $request->get('user_id'),
            'type' => Message::TYPE_TALL,
            'message_type' => Message::MESSAGE_TYPE_STT,
            'message' => $request->get('message')
        ];
        Message::create($data);
        return $this->success('发送成功');
    }

    /**
     * 获取历史消息
     * @param GetHistoryMessageRequest $request
     * @return mixed
     */
    public function getHistoryMessage(GetHistoryMessageRequest $request)
    {
        $teacherId = $request->get('teacher_id');
        $myId = \Auth::user()->id;
        $messages = Message::where(['from' => $teacherId, 'to' => $myId])->orWhere(function ($query) use ($myId, $teacherId) {
            $query->where(['from' => $myId, 'to' => $teacherId]);
        })->orderByDesc('id')->limit(10)->get();

        $teacher = Teacher::find($teacherId);
        $messages = $messages->map(function ($field) use ($teacher) {
            return collect([
                'date' => Carbon::make($field->created_at)->toDateTimeString(),
                'text' => ['text' => $field->message],
                'mine' => !$field->type == Message::TYPE_PUSH && $field->message_type == Message::MESSAGE_TYPE_STT,
                'name' => $field->type == Message::TYPE_PUSH ? 'admin' : $teacher->name,
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
        $schoolStudent = SchoolStudent::where('student_id', \Auth::user()->id)->first();
        $teacherIds = SchoolTeacher::where('school_id', $schoolStudent->school_id)->pluck('teacher_id');
        $teachers = Teacher::whereIn('id', $teacherIds)->get();
        $teachers = $teachers->map(function ($field) {
            return collect([
                'id' => $field->id,
                'name' => $field->name,
            ]);
        });
        $admin = collect([
            'id' => 0,
            'name' => 'admin',
        ]);
        return $this->success($teachers->push($admin));
    }
}
