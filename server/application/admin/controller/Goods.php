<?php

namespace app\admin\controller;


class Goods extends Comm
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new \app\admin\model\Goods();
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
        $ret = $this->model->getGoods([], $page, $pageSize);
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
     * 保存顺序：商品->商品属性图片->商品规格
     * @return \think\Response
     */
    public function save()
    {
        if (!$this->checkRule()) {
            return msg(102, null, '您没有权限操作');
        }
        $this->param['admin_id'] = $this->user['id'];
        /*$goodsParam = $this->param;
        unset($goodsParam['attr_check_list'],$goodsParam['attr_color_list'],$goodsParam['attr_tab_data'],$goodsParam['attr_img_size_data'],$goodsParam['attr_color_data']);
        if(isset($goodsParam['color_count'])){
            for($i = 0; $i < $goodsParam['color_count']; $i++){
                unset($goodsParam['color_'.$i]);
            }
        }

        //先保存商品，然后取出商品ID
        $goodsAttr = array();
        if(isset($this->param['attr_img_size_data'])) {
            foreach ($this->param['attr_img_size_data'] as $row){
                $goodsAttr[] = array('goods_id'=>'', 'attr_id'=>$row['attr_id'], 'attr_value'=>$row['size'], 'attr_img_file'=>$row['img'], 'attr_sort'=>$row['sort'], 'admin_id'=>$this->user['id']);
            }
        }
        if(isset($this->param['attr_color_data'])){
            foreach ($this->param['attr_color_data'] as $row){
                $goodsAttr[] = array('goods_id'=>'', 'attr_id'=>$row['attr_id'], 'attr_value'=>$row['color'], 'attr_sort'=>$row['sort'], 'admin_id'=>$this->user['id']);
            }
        }
        //保存商品属性，然后取出尺码和颜色的ID，组合成SIZE_ID|COLOR_ID
        if(isset($this->param['attr_tab_data'])){

        }*/
        $ret = $this->model->saveGood($this->param);
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
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @return \think\Response
     */
    public function edit()
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
        $ret = $this->model->updateGood($id, $this->param);
        if ($ret) {
            return msg(200, null, '更新成功');
        } else {
            return msg(100, null, $this->model->getError());
        }
    }

    /**
     * 更新商品各个状态
     * @return false|string
     */
    public function enable()
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
        $ret = $this->model->updateGoodStatus($id, $this->param);
        if ($ret) {
            return msg(200, null, '更新成功');
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
        //
    }
}
