<?php

namespace app\admin\model;

use think\Model;

class Attribute extends Model
{

    /**
     * 获取商品类型属性
     * @param array $where
     * @param int $page
     * @param int $pageSize
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getAttributes($where = [], $page = 1, $pageSize = 10)
    {
        $count = $this->where($where)->count();
        $res = $this->with('GoodsType')->where($where)->page($page, $pageSize)->select();
        if ($res) {
            $res = $res->toArray();
        }
        $data = ['currentPage' => (integer)$page, 'pageSize' => (integer)$pageSize, 'total' => (integer)$count, 'data' => $res];
        return $data;
    }

    /**
     * 根据ID获取数据
     * @param null $id
     * @return bool
     */
    public function getAttributeById($id = null)
    {
        $res = $this->where('attr_id', $id)->findOrEmpty();
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询商品类型属性不存在';
            return false;
        }
    }

    /**
     * 保存商品类型属性
     * @param array $param
     * @return bool
     */
    public function saveAttribute($param = [])
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
            $this->error = '添加失败'.$e->getMessage();
            return false;
        }
    }

    /**
     * 更新商品类型属性
     * @param null $id
     * @param array $param
     * @param bool $flag
     * @return bool
     */
    public function updateAttribute($id = null, $param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->check($param)) {
                $this->error = $validate->getError();
                return false;
            }
        }
        try {
            $this->allowField(true)->save($param, ['attr_id' => $id]);
            return true;
        } catch (\Exception $e) {
            $this->error = '更新失败';
            return false;
        }
    }

    /**
     * 删除商品类型属性
     * @param int $id
     * @return bool
     */
    public function del($id = 0)
    {
        try {
            $res = $this->delete(['attr_id'=>$id]);
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

    public function GoodsType()
    {
        return $this->belongsTo('GoodsType', 'cat_id', 'cat_id');
    }
}
