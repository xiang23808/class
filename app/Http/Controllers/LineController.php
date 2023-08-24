<?php

namespace App\Http\Controllers;

use App\Models\LineUser;
use Laravel\Socialite\Facades\Socialite;

class LineController extends Controller
{
    public function login()
    {
        $user = Socialite::driver('line')->stateless()->user();

        $lineUser = LineUser::where('line_id',$user['user'])->first();
        if (!$lineUser){
            $lineUser = LineUser::create([
               'line_id' => $user['id'],
               'name' => $user['name'],
               'avatar' => $user['avatar'],
               'email' => $user['email'],
            ]);
        }

        return $this->message();
    }

    public function redirect()
    {
        return redirect()->to(Socialite::driver('line')->stateless()->redirect()->getTargetUrl());
    }

}
