<?php

namespace App\Admin\Actions\Post;

use App\Services\MessageService;
use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;

class TeacherMessage extends Action
{
    protected $selector = '.student_message';

    public function handle(Request $request)
    {
        app(MessageService::class)->pushMessage('teacher', $request->message);

        return $this->response()->success('已发送！')->refresh();
    }

    public function form()
    {
        $this->text('message', '消息')->rules('required');
    }

    public function html()
    {
        return "<a class='student_message btn btn-sm btn-info'><i class='fa fa-info-circle'></i>推送消息</a>";
    }


}