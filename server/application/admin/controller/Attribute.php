<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Attribute extends Comm
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new \app\admin\model\Attribute();
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
        //$cat_id = $this->param['cat_id'];
        $where = [];
        /*if($cat_id){
            $where['cat_id'] = $cat_id;
        }*/
        $ret = $this->model->getAttributes($where, $page, $pageSize);
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
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
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
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
