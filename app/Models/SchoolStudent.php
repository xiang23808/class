<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SchoolStudent extends Model
{
    protected $guarded = [];

    protected function getStudentNameAttribute()
    {
        return $this->student_id ? Student::find($this->student_id)->name : '-';
    }

}
