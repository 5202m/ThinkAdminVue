<?php

namespace app\admin\model;

use think\Model;

class GoodsAttr extends Model
{
    /**
     * 获取商品属性，分页
     * @param array $where
     * @param int $page
     * @param int $pageSize
     * @return array|false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getGoodsAttr($where = [], $page = 1, $pageSize = 10)
    {
        $count = $this->where($where)->count();
        //withCount(['attributes'=>'attr_count']) 参数数组中的key是关联方法名，value是字段别名
        $res = $this->where($where)->page($page, $pageSize)->select();
        if ($res) {
            $res = $res->toArray();
        }
        $data = ['currentPage' => (integer)$page, 'pageSize' => (integer)$pageSize, 'total' => (integer)$count, 'data' => $res];
        return $data;
    }

    /**
     * 获取所有商品属性
     * @param array $where
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getGoodsAttrList($where = [])
    {
        $res = $this->where($where)->select();
        if($res){
            $res = $res->toArray();
        }
        return $res;
    }

    /**
     * 根据ID获取数据
     * @param null $id
     * @return bool
     */
    public function getGoodsAttrById($id = null)
    {
        $res = $this->where('goods_attr_id', $id)->findOrEmpty();
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询商品属性不存在';
            return false;
        }
    }

    /**
     * 保存商品属性
     * @param array $param
     * @return bool
     */
    public function saveGoodsAttr($param = [])
    {
        $validate = validate($this->name);
        if (!$validate->check($param)) {
            $this->error = $validate->getError();
            return false;
        }
        try {
            $this->data($param)->allowField(true)->save();
            return true;
        } catch (\Exception $e) {
            $this->error = '添加失败';
            return false;
        }
    }

    /**
     * 批量保存商品属性
     * @param array $param
     * @return bool
     */
    public function saveGoodsAttrAll($param = [])
    {
        $validate = validate($this->name);
        if (!$validate->check($param)) {
            $this->error = $validate->getError();
            return false;
        }
        try {
            $this->data($param)->allowField(true)->saveAll();

            return true;
        } catch (\Exception $e) {
            $this->error = '添加失败';
            return false;
        }
    }

    /**
     * 更新商品属性
     * @param null $id
     * @param array $param
     * @param bool $flag
     * @return bool
     */
    public function updateGoodsAttr($id = null, $param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->check($param)) {
                $this->error = $validate->getError();
                return false;
            }
        }
        try {
            $this->allowField(true)->save($param, ['goods_attr_id' => $id]);
            return true;
        } catch (\Exception $e) {
            $this->error = '更新失败';
            return false;
        }
    }

    /**
     * 批量更新商品属性
     * @param array $param
     * @param bool $flag
     * @return bool
     */
    public function updateGoodsAttrAll($param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->check($param)) {
                $this->error = $validate->getError();
                return false;
            }
        }
        try {
            $this->allowField(true)->saveAll($param);
            return true;
        } catch (\Exception $e) {
            $this->error = '更新失败';
            return false;
        }
    }

    /**
     * 删除商品属性
     * @param int $id
     * @return bool
     */
    public function del($id = 0)
    {
        try {
            $res = $this->delete(['goods_attr_id'=>$id]);
            if ($res) {
                return $res;
            } else {
                $this->error = '删除失败';
                return false;
            }
        } catch (\Exception $e) {
            $this->error = '删除失败';
            return false;
        }
    }

    public function goods()
    {
        return $this->belongsTo('Goods', 'goods_id', 'goods_id');
    }
}
