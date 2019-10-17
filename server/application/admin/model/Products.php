<?php

namespace app\admin\model;

use think\Model;

class Products extends Model
{
    /**
     * 获取商品规格，分页
     * @param array $where
     * @param int $page
     * @param int $pageSize
     * @return array|false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getProducts($where = [], $page = 1, $pageSize = 10)
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
     * 获取商品规格
     * @param array $where
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getProductsList($where = [])
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
    public function getProductsById($id = null)
    {
        $res = $this->where('product_id', $id)->findOrEmpty();
        if ($res) {
            return $res;
        } else {
            $this->error = '当前查询商品规格不存在';
            return false;
        }
    }

    /**
     * 保存商品规格
     * @param array $param
     * @return bool
     */
    public function saveProduct($param = [])
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
     * 批量保存商品规格
     * @param array $param
     * @return bool
     */
    public function saveProductAll($param = [])
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
     * 更新商品类型
     * @param null $id
     * @param array $param
     * @param bool $flag
     * @return bool
     */
    public function updateProduct($id = null, $param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->check($param)) {
                $this->error = $validate->getError();
                return false;
            }
        }
        try {
            $this->allowField(true)->save($param, ['product_id' => $id]);
            return true;
        } catch (\Exception $e) {
            $this->error = '更新失败';
            return false;
        }
    }

    /**
     * 批量更新商品类型
     * @param array $param
     * @param bool $flag
     * @return bool
     */
    public function updateProductAll($param = [], $flag = true)
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
     * 删除商品规格
     * @param int $id
     * @return bool
     */
    public function del($id = 0)
    {
        try {
            $res = $this->delete(['product_id'=>$id]);
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
     * 批量删除商品规格
     * @param array $ids
     * @return bool
     */
    public function delBatch($ids = [])
    {
        try {
            $res = $this->whereIn('product_id', $ids)->delete();
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
