<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::prefix('student')->group(function () {
    Route::post('login', 'StudentController@login')->name('api.student.login');

    Route::middleware(["auth:student", "check.student.permissions"])->group(function () {
        Route::post('info', 'StudentController@info')->name('api.student.info');
        Route::post('teacher_list', 'StudentController@teacherList')->name('api.student.teacher_list');
        Route::post('watch_teacher', 'StudentController@watchTeacher')->name('api.student.watch_teacher');
        Route::post('unwatch_teacher', 'StudentController@unWatchTeacher')->name('api.student.unwatch_teacher');
        Route::post('watch_teacher_list', 'StudentController@watchTeacherList')->name('api.student.watch_teacher_list');
        Route::post('wk_bind', 'StudentController@wkBind')->name('api.student.wk_bind');
        Route::post('send_meg_to_teacher', 'StudentController@sendMegToTeacher')->name('api.student.send_meg_to_teacher');
        Route::post('get_history_message', 'StudentController@getHistoryMessage')->name('api.student.get_history_message');
        Route::post('get_message_user', 'StudentController@getMessageUser')->name('api.student.get_message_user');
    });
});


Route::prefix('teacher')->group(function () {
    Route::post('login', 'TeacherController@login')->name('api.teacher.login');
    Route::post('create', 'TeacherController@create')->name('api.teacher.create');
    Route::get('invite_register', 'TeacherController@inviteRegister')->name('api.teacher.invite_register');

    Route::middleware(["auth:teacher", "check.teacher.permissions"])->group(function () {
        Route::post('info', 'TeacherController@info')->name('api.teacher.info');
        Route::post('create_school', 'TeacherController@createSchool')->name('api.teacher.create_school');
        Route::post('invite', 'TeacherController@invite')->name('api.teacher.invite');
        Route::post('school_list', 'TeacherController@schoolList')->name('api.teacher.school_list');
        Route::post('create_student', 'TeacherController@createStudent')->name('api.teacher.create_student');
        Route::post('student_list', 'TeacherController@studentList')->name('api.teacher.student_list');
        Route::post('watched_student', 'TeacherController@watchedStudent')->name('api.teacher.watched_student');
        Route::post('school_teacher_list', 'TeacherController@schoolTeacherList')->name('api.teacher.school_teacher_list');
        Route::post('wk_bind', 'TeacherController@wkBind')->name('api.teacher.wk_bind');
        Route::post('send_meg_to_student', 'TeacherController@sendMegToStudent')->name('api.teacher.send_meg_to_student');
        Route::post('get_history_message', 'TeacherController@getHistoryMessage')->name('api.teacher.get_history_message');
        Route::post('get_message_user', 'TeacherController@getMessageUser')->name('api.teacher.get_message_user');
    });
});

Route::prefix('line')->group(function () {
    Route::get('login', 'LineController@login')->name('api.line.login');
    Route::get('redirect', 'LineController@redirect')->name('api.line.redirect');
    Route::middleware(["auth:line", "check.line.permissions"])->group(function () {
        Route::post('bind_student', 'LineController@bindStudent')->name('api.line.bind_student');
        Route::post('bind_teacher', 'LineController@bindTeacher')->name('api.line.bind_teacher');
        Route::post('student_list', 'LineController@studentList')->name('api.line.student_list');
        Route::post('teacher_list', 'LineController@teacherList')->name('api.line.teacher_list');
        Route::post('wk_bind', 'LineController@wkBind')->name('api.line.wk_bind');
    });
});
