<?php

namespace App\Http\Requests\Student;

use Illuminate\Foundation\Http\FormRequest;

class SendMegToTeacherRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'user_id' => 'required|exists:teachers,id',
            'message' => 'required|max:200',
        ];
    }

    /**
     * 获取已定义验证规则的错误消息。
     *
     * @return array
     */
    public function messages()
    {
        return [
            'user_id.required' => 'user_id必须存在',
            'user_id.exists' => '用户不存在',
            'message.required' => 'message必须存在',
            'message.max' => 'message长度不能超过200',
        ];
    }
}
