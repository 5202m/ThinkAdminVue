<?php

namespace app\admin\model;

use think\Model;

class GoodsType extends Model
{
    /**
     * 获取商品类型，分页
     * @param array $where
     * @param int $page
     * @param int $pageSize
     * @return array|false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getGoodsType($where = [], $page = 1, $pageSize = 10)
    {
        $count = $this->where($where)->count();
        //withCount(['attributes'=>'attr_count']) 参数数组中的key是关联方法名，value是字段别名
        $res = $this->withCount(['attributes'=>'attr_count'])->where($where)->page($page, $pageSize)->select();
        if ($res) {
            $res = $res->toArray();
        }
        $data = ['currentPage' => (integer)$page, 'pageSize' => (integer)$pageSize, 'total' => (integer)$count, 'data' => $res];
        return $data;
    }

    /**
     * 获取所有商品类型
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getGoodsTypeList()
    {
        $res = $this->where(['enable'=>1])->select();
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
    public function getGoodTypeById($id = null)
    {
        $res = $this->getById($id);
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询商品类型不存在';
            return false;
        }
    }

    /**
     * 保存商品类型
     * @param array $param
     * @return bool
     */
    public function saveGoodsType($param = [])
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
     * 更新商品类型
     * @param null $id
     * @param array $param
     * @param bool $flag
     * @return bool
     */
    public function updateGoodsType($id = null, $param = [], $flag = true)
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
     * 删除商品类型
     * @param int $id
     * @return bool
     */
    public function del($id = 0)
    {
        try {
            $res = $this->delete(['cat_id'=>$id]);
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

    /**
     * 关联属性表
     * @return \think\model\relation\HasMany
     */
    public function attributes()
    {
        return $this->hasMany('Attribute', 'cat_id', 'cat_id');
    }
}
