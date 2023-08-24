<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permission extends \Spatie\Permission\Models\Permission
{
    public function parent()
    {
        return $this->hasOne(get_class($this),$this->getKeyName(),'pid');
    }

    public function children()
    {
        return $this->hasMany(get_class($this),'pid',$this->getKeyName())->orderByDesc('weight');
    }

    protected function serializeDate(\DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }
}
