<?php

namespace App\Admin\Controllers;

use App\Models\School;
use App\Models\Teacher;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SchoolController extends AdminController
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
        $grid = new Grid(new School());

        $grid->column('id', 'ID')->sortable();
        $grid->column('name', '名称');
        $grid->column('apply_id', '申请者')->display(function($userId) {
            return Teacher::find($userId)->name;
        });
        $grid->column('own_id', '管理员')->display(function($userId) {
            return Teacher::find($userId)->name;
        });
        $grid->column('status', '状态')->editable('select', [1 => '申请中', 2 => '通过', 3 => '拒绝']);
        $grid->column('created_at', '创建时间');
        $grid->column('updated_at', '修改时间');
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
        $show = new Show(School::findOrFail($id));

        $show->field('id', 'ID');
        $show->field('status', '状态');
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
        $form = new Form(new School);

        $form->display('id', 'ID');
        $form->text('name', '名称');
        $form->display('status', '状态');
        $form->display('created_at', '创建时间');
        $form->display('updated_at', '修改时间');

        return $form;
    }
}
