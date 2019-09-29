<?php

namespace app\admin\controller;

class GoodsType extends Comm
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new \app\admin\model\GoodsType();
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        $page = $this->param['currentPage'];
        $pageSize = $this->param['pageSize'];
        $ret = $this->model->getGoodsType([], $page, $pageSize);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    /**
     * 获取所有商品类型
     * @return false|string
     */
    public function goodsTypes()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        $ret = $this->model->getGoodsTypeList();
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
    }

    /**
     * 保存新建的资源
     *
     * @return \think\Response
     */
    public function save()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        $ret = $this->model->saveGoodsType($this->param);
        if ($ret) {
            return msg(200, null, '添加成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    /**
     * 显示指定的资源
     *
     * @return \think\Response
     */
    public function read()
    {
        $id = $this->param['id'];
        $ret = $this->model->getGoodTypeById($id);
        if ($ret) {
            return msg(200, $ret);
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @return \think\Response
     */
    public function update()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        if ($this->param['id']) {
            $id = $this->param['id'];
            unset($this->param['id']);
        } else {
            return msg(100, null, '参数错误');
        }
        $ret = $this->model->updateCategory($id, $this->param);
        if ($ret) {
            return msg(200, null, '添加成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    /**
     * 删除指定资源
     *
     * @return \think\Response
     */
    public function delete()
    {
        if (!$this->checkRule()) {
            return msg(401, null, '您没有权限操作');
        }
        if ($this->param['id']) {
            $id = $this->param['id'];
        } else {
            return msg(100, null, '参数错误');
        }
        $ret = $this->model->del($id);
        if ($ret) {
            return msg(200, null, '删除成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }
}
