<?php


namespace App\Models;


use Illuminate\Support\Facades\Log;

class Role extends \Spatie\Permission\Models\Role
{
    protected $guarded = [];

    protected function serializeDate(\DateTimeInterface $date): string
    {
        return $date->format('Y-m-d H:i:s');
    }

}
