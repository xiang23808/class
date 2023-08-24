<?php

namespace App\Http\Requests\Teacher;

use Illuminate\Foundation\Http\FormRequest;

class CreateStudentRequest extends FormRequest
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
            'name' => 'required|max:200',
            'email' => 'required|email|max:200|unique:students',
            'password' => 'required|max:20',
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
            'name.max' => 'name不能超过200字符',
            'name.required' => 'name必须存在',
            'email.required' => '邮箱必须存在',
            'email.email' => '邮箱必须为邮箱格式',
            'email.max' => 'email不能超过200字符',
            'email.unique' => '用户已存在',
            'password.required' => '密码必须存在',
            'password.max' => '密码不能超过20字符',
            'school_id.required' => 'school_id必须存在',
            'school_id.exists' => '学校不存在',
        ];
    }
}
