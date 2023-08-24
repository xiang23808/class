<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LineBind extends Model
{
    protected $guarded = [];

    const TYPE_STUDENT = 1;
    const TYPE_TEACHER = 2;

    static $typeList = [
        self::TYPE_STUDENT,
        self::TYPE_TEACHER,
    ];

    static $typeNameList = [
        self::TYPE_STUDENT => '申请中',
        self::TYPE_TEACHER => '通过',
    ];

}
