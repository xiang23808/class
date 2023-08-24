<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('student', "StudentController");
    $router->resource('teacher', "TeacherController");
    $router->resource('role', "RoleController");
    $router->resource('school', "SchoolController");
    $router->resource('permission', "PermissionController");

});
