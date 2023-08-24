<?php

namespace App\Helpers;

class ResponseEnum
{
    // 001 ~ 099 表示系统状态；100 ~ 199 表示授权业务；200 ~ 299 表示用户业务

    /*-------------------------------------------------------------------------------------------*/
    // 200表示服务器成功地接受了客户端请求
    const HTTP_OK = [200, '操作成功'];

    const HTTP_ERROR = [1001, '操作失败'];
    const HTTP_ACTION_COUNT_ERROR = [1002, '操作频繁'];
    const USER_SERVICE_LOGIN_ERROR = [1003, '登录失败'];
    const USER_SERVICE_LOGOUT_ERROR = [1004, '退出登录失败'];
    const USER_SERVICE_REGISTER_ERROR = [1005, '注册失败'];
    const USER_ACCOUNT_REGISTERED = [1006, '账号已注册'];
    const INSUFFICIENT_USER_PERMISSIONS = [1007, '权限不足'];
    const USER_WAS_DISABLED = [1008, '用户被禁用'];
    const ORDER_APPLE_ERROR = [1009, '验证失败'];
    const SERVICE_LOGIN_ACCOUNT_ERROR = [1010, '账号或密码错误'];

    const TEACHER_INVITED = [2001, '教师已被邀请'];
    const INVITE_OK = [2002, '恭喜成为学校老师'];
    const NOT_SCHOOL_MANAGE = [2003, '不是学校管理员'];
    const WATCHED = [2004, '已经关注了'];
    const UNWATCHED = [2005, '还未关注'];
    const NOT_SAME_SCHOOL = [2006, '不同学校'];
    const NOT_ADMIN_MESSAGE = [2007, '不允许给系统发信息'];

}
