<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    protected $guarded = [];

    const STATUS_APPLYING = 1;
    const STATUS_PASS = 2;
    const STATUS_REFUSE = 3;

    static $statusList = [
        self::STATUS_APPLYING,
        self::STATUS_PASS,
        self::STATUS_REFUSE,
    ];

    static $statusNameList = [
        self::STATUS_APPLYING => '申请中',
        self::STATUS_PASS => '通过',
        self::STATUS_REFUSE => '拒绝',
    ];

    protected function getStatusNameAttribute()
    {
        return self::$statusNameList[$this->status];
    }

    public function own()
    {
        return $this->belongsTo(Teacher::class);
    }

    public function apply()
    {
        return $this->belongsTo(Teacher::class);
    }
}
