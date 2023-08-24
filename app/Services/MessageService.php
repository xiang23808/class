<?php

namespace App\Services;

use App\Helpers\ApiResponse;
use App\Helpers\ResponseEnum;
use App\Models\Message;
use App\Models\SchoolStudent;
use App\Models\SchoolTeacher;
use App\Models\Student;
use App\Models\Teacher;
use GatewayClient\Gateway;

class MessageService
{
    use ApiResponse;

    public function pushMessage($group, $message)
    {
        $pushMessage = json_encode([
            'from_id' => 0,
            'from_name' => 'admin',
            'message' => $message,
            'type' => 'talk',
        ]);
        Gateway::sendToGroup($group, $pushMessage);

        $this->pushMessageSave($group, $message);
    }

    //推送消息入库
    public function pushMessageSave($group, $message)
    {
        $users = Gateway::getUidListByGroup($group);
        foreach ($users as $use) {
            //消息入库
            $data = [
                'from' => 0,
                'to' => explode("_", $use)[1],
                'type' => Message::TYPE_PUSH,
                'message_type' => explode("_", $use)[0] == 'line' ? Message::MESSAGE_TYPE_ATL : Message::MESSAGE_TYPE_TTS,
                'message' => $message
            ];

            Message::create($data);
        }

    }
}