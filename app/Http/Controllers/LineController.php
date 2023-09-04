<?php

namespace App\Http\Controllers;

use App\Http\Requests\Line\BindStudentRequest;
use App\Http\Requests\Line\BindTeacherRequest;
use App\Http\Requests\Line\WkBindRequest;
use App\Models\LineBind;
use App\Models\LineUser;
use App\Models\Student;
use App\Models\Teacher;
use GatewayClient\Gateway;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;

class LineController extends Controller
{
    public function login()
    {
        $user = Socialite::driver('line')->stateless()->user();

        $lineUser = LineUser::where('line_id', $user['id'])->first();
        if (!$lineUser) {
            $lineUser = LineUser::create([
                'line_id' => $user['id'],
                'name' => $user['name'],
                'avatar' => $user['avatar'],
                'email' => $user['email'],
            ]);
            $lineUser->assignRole('line');
        }
        $token = $this->getToken($lineUser);
        $lineUser->role = $lineUser->roles()->first();
        return $this->success(['user' => $lineUser, 'token' => $token]);
    }

    public function redirect()
    {
        return redirect()->to(Socialite::driver('line')->stateless()->redirect()->getTargetUrl());
    }

    /**
     * 绑定学生
     * @param BindStudentRequest $request
     * @return mixed
     * @throws \App\Exceptions\ApiException
     */
    public function bindStudent(BindStudentRequest $request)
    {
        $data = [
            'line_id' => \Auth::user()->id,
            'bind_id' => $request->student_id,
            'type' => LineBind::TYPE_STUDENT,
        ];
        $count = LineBind::where($data)->count();
        if ($count) {
            return $this->failed(2008);
        }
        LineBind::create($data);
        return $this->message();
    }

    /**
     * 绑定教师
     * @param BindTeacherRequest $request
     * @return mixed
     * @throws \App\Exceptions\ApiException
     */
    public function bindTeacher(BindTeacherRequest $request)
    {
        $count = LineBind::where(['line_id' => \Auth::user()->id, 'type' => LineBind::TYPE_TEACHER])->count();
        if ($count) {
            return $this->failed(2008);
        }
        LineBind::create([
            'line_id' => \Auth::user()->id,
            'bind_id' => $request->teacher_id,
            'type' => LineBind::TYPE_TEACHER,
        ]);
        return $this->message();
    }

    /**
     * 学生列表
     * @param Request $request
     * @return mixed
     */
    public function studentList(Request $request)
    {
        $students = Student::latest()->paginate($request->page_size);
        $students = $this->dataFormat($students);
        return $this->success($students);
    }

    /**
     * 教师列表
     * @param Request $request
     * @return mixed
     */
    public function teacherList(Request $request)
    {
        $students = Teacher::latest()->paginate($request->page_size);
        $students = $this->dataFormat($students);
        return $this->success($students);
    }

    /**
     * 教师绑定ws
     * @param WkBindRequest $request
     * @return mixed
     */
    public function wkBind(WkBindRequest $request)
    {
        $userId = \Auth::user()->id;
        $clientId = $request->get('client_id');
        Gateway::bindUid($clientId, 'line_' . $userId);
        Gateway::joinGroup($clientId, 'line');

        return $this->success('client_id绑定成功');
    }
}
