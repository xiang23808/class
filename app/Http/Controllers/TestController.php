<?php

namespace App\Http\Controllers;

use GatewayClient\Gateway;

class TestController extends Controller
{
    public function info()
    {
        $user = Gateway::getUidListByGroup('teacher');
        //$user = Gateway::getClientSessionsByGroup('teacher');
        dd($user);
        Gateway::sendToGroup('teacher', '4455');

        $message = json_encode([
            'from_id' => 0,
            'from_name' => 'admin',
            'message' => '系统推送',
            'type' => 'talk',
        ]);
        Gateway::sendToUid('teacher_1', $message);
        return $this->success('client_id绑定成功');
    }

}
