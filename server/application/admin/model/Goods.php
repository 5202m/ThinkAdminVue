<?php

namespace app\admin\model;

use think\Model;

class Goods extends Model
{
    /**
     * 获取商品列表
     * @param array $where
     * @param int $page
     * @param int $pageSize
     * @return array|false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getGoods($where = [], $page = 0, $pageSize = 10)
    {
        //$pageSize = $page ? $pageSize : $page * $pageSize;
        $res = $this->where($where)->skip($page)->limit($pageSize)->order(['sort_order'=>'desc', 'goods_id'=>'desc'])->select();
        if ($res) {
            $res = $res->toArray();
        }
        return $res;
    }

    /**
     * 根据ID获取数据
     * @param null $id
     * @return bool
     */
    public function getGoodById($id = null)
    {
        $res = $this->getById($id);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询商品不存在';
            return false;
        }
    }

    /**
     * 保存商品
     * @param array $param
     * @return bool
     */
    public function saveGood($param = [])
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
     * 更新商品
     * @param null $id
     * @param array $param
     * @param bool $flag
     * @return bool
     */
    public function updateGood($id = null, $param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->check($param)) {
                $this->error = $validate->getError();
                return false;
            }
        }
        try {
            $this->allowField(true)->save($param, [$this->getPk() => $id]);
            return true;
        } catch (\Exception $e) {
            $this->error = '更新失败';
            return false;
        }
    }

    /**
     * 删除商品
     * @param int $id
     * @return Goods|bool
     */
    public function del($id = 0)
    {
        try {
            $res = $this->update(['is_delete'=>1], ['goods_id'=>$id]);
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
}
