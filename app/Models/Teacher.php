<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

class Teacher extends Authenticatable
{
    use HasApiTokens, Notifiable, HasRoles;

    protected $hidden = ['password'];

    protected $guarded = [];


}
