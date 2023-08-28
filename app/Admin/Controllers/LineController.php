<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Post\LineMessage;
use App\Models\LineUser;
use App\Models\Role;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class LineController extends AdminController
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
        $grid = new Grid(new LineUser());

        $grid->column('id', 'ID')->sortable();
        $grid->column('name', '名称');
        $grid->column('email', '邮箱');
        $grid->column('roles', '角色')->pluck('name')->label();
        $grid->column('created_at', '创建时间');
        $grid->column('updated_at', '修改时间');

        $grid->tools(function (Grid\Tools $tools) {
            $tools->append(new LineMessage());
        });
        $grid->disableCreation();


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
        $show = new Show(LineUser::findOrFail($id));

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
        $form = new Form(new LineUser);

        $form->display('id', 'ID');
        $form->text('name', '名称');
        $form->text('email', '邮箱');
        $form->multipleSelect('roles', '角色')->options(Role::all()->pluck('name', 'id'));
        $form->display('created_at', '创建时间');
        $form->display('updated_at', '修改时间');

        return $form;
    }
}
