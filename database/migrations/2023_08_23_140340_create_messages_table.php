<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMessagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('messages', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('from')->comment('发送者id')->default(0);
            $table->integer('to')->comment('接收者id')->default(0);
            $table->tinyInteger('type')->comment('类型1-聊天，2-推送')->default(0);
            $table->tinyInteger('message_type')->comment('消息方式1-学生->教师，2-教师->学生')->default(0);
            $table->string('message')->comment('消息内容');
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
        Schema::dropIfExists('messages');
    }
}
