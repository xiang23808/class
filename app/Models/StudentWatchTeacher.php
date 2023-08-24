<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentWatchTeacher extends Model
{
    protected $guarded = [];

    protected function getTeacherNameAttribute()
    {
        return $this->teacher_id ? Teacher::find($this->teacher_id)->name : '-';
    }
    protected function getStudentNameAttribute()
    {
        return $this->student_id ? Student::find($this->student_id)->name : '-';
    }
}
