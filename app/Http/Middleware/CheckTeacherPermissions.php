<?php

namespace App\Http\Middleware;

use App\Helpers\ApiResponse;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class CheckTeacherPermissions
{
    use ApiResponse;
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (app()->environment('local')){
            Log::info('header:'.json_encode($request->header()).'----body:'.json_encode($request->input()).'----path:'.request()->path());
        }
        // 这里做一下权限判断
        $routeName = $request->route()->getName();
        $admin = Auth::user();
        // 是否是超级管理员
        $isSupAdmin = $admin->can('all.permission');

        # 检查权限
        //$admin->hasPermissionTo($routeName);

        $role = $admin->roles[0];
        $request->attributes->add(['page_size' => $request->input('page_size',15)]);

        return $next($request);
    }
}
