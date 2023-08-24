<?php

namespace App\Services;

use App\Helpers\ApiResponse;
use App\Helpers\ResponseEnum;
use App\Models\SchoolStudent;
use App\Models\SchoolTeacher;
use App\Models\Student;
use App\Models\Teacher;

class TeacherService
{
    use ApiResponse;

    public function inviteRegister($schoolId, $user)
    {
        if (SchoolTeacher::where(['school_id' => $schoolId, 'teacher_id' => $user->id])->count()) {
            $this->failed(ResponseEnum::TEACHER_INVITED);
        }
        $data = [
            'school_id' => $schoolId,
            'teacher_id' => $user->id,
        ];
        SchoolTeacher::create($data);
        return $this->message();
    }

    public function create($name, $email, $password)
    {
        $data = [
            'name' => $name,
            'password' => bcrypt($password),
            'email' => $email,
        ];
        $user = Teacher::create($data);
        return $user;
    }

    public function createStudent($name, $email, $password)
    {
        $data = [
            'name' => $name,
            'password' => bcrypt($password),
            'email' => $email,
        ];
        $user = Student::create($data);
        return $user;
    }

    public function bindSchool($schoolId, Student $user)
    {
        SchoolStudent::create(['school_id' => $schoolId, 'student_id' => $user->id]);
    }
}