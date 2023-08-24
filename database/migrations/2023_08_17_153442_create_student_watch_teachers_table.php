<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStudentWatchTeachersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_watch_teachers', function (Blueprint $table) {
            $table->increments('id');
            $table->Integer('student_id')->comment('学生id')->default(0);
            $table->Integer('teacher_id')->comment('教师id')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('student_watch_teachers');
    }
}
