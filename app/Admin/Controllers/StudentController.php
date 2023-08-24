<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Post\StudentMessage;
use App\Models\Role;
use App\Models\Student;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class StudentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Example controller';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Student);

        $grid->column('id', 'ID')->sortable();
        $grid->column('name', '名称');
        $grid->column('email', '邮箱');
        $grid->column('roles', '角色')->pluck('name')->label();
        $grid->column('created_at', '创建时间');
        $grid->column('updated_at', '修改时间');

        $grid->tools(function (Grid\Tools $tools) {
            $tools->append(new StudentMessage());
        });


        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed   $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Student::findOrFail($id));

        $show->field('id', 'ID')->sortable();
        $show->field('name', '名称');
        $show->field('email', '邮箱');
        $show->field('roles', '角色')->as(function ($roles) {
            return $roles->pluck('name');
        })->label();
        $show->field('created_at', '创建时间');
        $show->field('updated_at', '修改时间');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Student);

        $form->display('id', 'ID');
        $form->display('name', '名称');
        $form->display('email', '邮箱');
        $form->select('roles', '角色')->options(Role::all()->pluck('name', 'id'));
        $form->display('created_at', '创建时间');
        $form->display('updated_at', '修改时间');

        return $form;
    }
}
