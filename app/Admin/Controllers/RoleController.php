<?php

namespace App\Admin\Controllers;

use App\Models\Permission;
use App\Models\Role;
use App\Models\Teacher;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Log;

class RoleController extends AdminController
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
        $grid = new Grid(new Role());

        $grid->column('id', 'ID')->sortable();
        $grid->column('name', '名称');
        $grid->column('guard_name', '守卫');
        $grid->column('created_at', '创建时间');
        $grid->column('updated_at', '修改时间');

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
        $show = new Show(Role::findOrFail($id));

        $show->field('id', 'ID');
        $show->field('guard_name', '守卫');
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
        $form = new Form(new Role);

        $form->display('id', 'ID');
        $form->text('name', '名称');
        $form->text('guard_name', '守卫');
        $form->display('created_at', '创建时间');
        $form->display('updated_at', '修改时间');
        $form->listbox('permissions')->options(Permission::all()->pluck('name', 'id'));

        return $form;
    }
}
