<?php

namespace App\Http\Requests\Teacher;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
            'email' => 'required|email|exists:teachers',
            'password' => 'required|max:20',
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
            'email.required' => '邮箱必须存在',
            'email.email' => '邮箱必须为邮箱格式',
            'email.exists' => '用户不存在',
            'password.required' => '密码必须存在',
            'password.max' => '密码不能超过20字符',
        ];
    }
}
