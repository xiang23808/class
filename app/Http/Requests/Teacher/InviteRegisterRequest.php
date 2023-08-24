<?php

namespace App\Http\Requests\Teacher;

use Illuminate\Foundation\Http\FormRequest;

class InviteRegisterRequest extends FormRequest
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
            'email' => 'required|email|max:200|unique:teachers',
            'school_id' => 'required|exists:schools,id',
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
            'email.max' => 'email不能超过200字符',
            'email.unique' => '用户已存在',
            'school_id.required' => 'school_id必须存在',
            'school_id.exists' => '学校不存在',
        ];
    }
}
