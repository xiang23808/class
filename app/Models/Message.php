<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $guarded = [];

    const TYPE_TALL = 1;
    const TYPE_PUSH = 2;

    static $typeList = [
        self::TYPE_TALL,
        self::TYPE_PUSH,
    ];

    static $typeNameList = [
        self::TYPE_TALL => '消息',
        self::TYPE_PUSH => '推送',
    ];

    const MESSAGE_TYPE_STT = 1;
    const MESSAGE_TYPE_TTS = 2;

    static $messageTypeList = [
        self::MESSAGE_TYPE_STT,
        self::MESSAGE_TYPE_TTS,
    ];

    static $messageTypeNameList = [
        self::MESSAGE_TYPE_STT => '学生->教师',
        self::MESSAGE_TYPE_TTS => '教师->学生',
    ];

}
