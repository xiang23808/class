<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLineBindsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('line_binds', function (Blueprint $table) {
            $table->increments('id');
            $table->Integer('line_id')->default(0);
            $table->Integer('bind_id')->comment('学生或教师id')->default(0);
            $table->tinyInteger('type')->comment('1-学生,2-教师')->default(0);
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
        Schema::dropIfExists('line_binds');
    }
}
