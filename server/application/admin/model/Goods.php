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
    public function getGoods($where = [], $page = 1, $pageSize = 10)
    {
        $count = $this->where($where)->count();
        $res = $this->with(['goodsAttr', 'products'])->where($where)->page($page, $pageSize)->order(['sort_order'=>'desc', 'goods_id'=>'desc'])->select();
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
    public function getGoodById($id = null)
    {
        $res = $this->with(['goodsAttr', 'products'])->where(['goods_id' => $id])->findOrEmpty();
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
        $goodsParam = $param;
        $admin_id = $param['admin_id'];
        if(empty($goodsParam['goods_sn'])){
            $goodsParam['goods_sn'] = $this->productSn();
        }
        $goodsParam['goods_img'] = $goodsParam['goods_thumb'] = $goodsParam['original_img'] = join(',', $goodsParam['goods_img']);
        $goodsParam['goods_cause'] = join(',', $goodsParam['return_type']);
        $goodsParam['user_id'] = 0;
        if(isset($goodsParam['attr_color_list'])){
            for($i = 0, $cnt = count($goodsParam['attr_color_list']); $i < $cnt; $i++){
                unset($goodsParam['color_'.$i]);
            }
        }
        unset($goodsParam['attr_check_list'],$goodsParam['attr_color_list'],$goodsParam['attr_tab_data'],$goodsParam['attr_img_size_data'],$goodsParam['attr_color_data'],$goodsParam['return_type'],$goodsParam['admin_id'],$goodsParam['color_count']);

        $validate = validate($this->name);
        if (!$validate->check($goodsParam)) {
            $this->error = $validate->getError();
            return false;
        }
        $this->startTrans();
        try {
            $goodsId = $this->insertGetId($goodsParam);
            //先保存商品，然后取出商品ID
            $goodsAttrSizeParam = $goodsAttrColorParam = $productsParam = array();
            $goodsAttrArr = array('size'=>[],'color'=>[]);
            $goodsAttr = new GoodsAttr();
            if(isset($param['attr_img_size_data'])) {
                foreach ($param['attr_img_size_data'] as $row){
                    $goodsAttrSizeParam[] = array('goods_id'=>$goodsId, 'attr_id'=>$row['attr_id'], 'attr_value'=>$row['size'], 'attr_img_file'=>$row['img'], 'attr_sort'=>$row['sort'], 'admin_id'=>$admin_id);
                }
                $goodsAttr->saveAll($goodsAttrSizeParam);
                $attrWhere = array('goods_id'=>$goodsId, 'attr_id'=>$param['attr_img_size_data'][0]['attr_id']);
                $goodsAttrArr['size'] = $goodsAttr->where($attrWhere)->column('goods_attr_id');
            }
            if(isset($param['attr_color_data'])){
                foreach ($param['attr_color_data'] as $row){
                    $goodsAttrColorParam[] = array('goods_id'=>$goodsId, 'attr_id'=>$row['attr_id'], 'attr_value'=>$row['color'], 'attr_img_file'=>$row['img'], 'attr_sort'=>$row['sort'], 'admin_id'=>$admin_id);
                }
                $goodsAttr->saveAll($goodsAttrColorParam);
                $attrWhere = array('goods_id'=>$goodsId, 'attr_id'=>$param['attr_color_data'][0]['attr_id']);
                $goodsAttrArr['color'] = $goodsAttr->where($attrWhere)->column('goods_attr_id');
            }

            //保存商品属性，然后取出尺码和颜色的ID，组合成SIZE_ID|COLOR_ID
            if(isset($param['attr_tab_data'])){
                $attrIdArr = array();
                $productsSnArr = array();
                if(count($goodsAttrArr['size']) > 0 && count($goodsAttrArr['color']) > 0){
                    foreach ($goodsAttrArr['size'] as $size) {
                        $productsSnArr[] = $goodsParam['goods_sn'].'_p'.$size;
                        foreach($goodsAttrArr['color'] as $color){
                            $productsSnArr[] = $goodsParam['goods_sn'].'_p'.$color;
                            $attrIdArr[] = array($size, $color);
                        }
                    }
                } else {
                    foreach ($goodsAttrArr['size'] as $size){
                        $productsSnArr[] = $goodsParam['goods_sn'].'_p'.$size;
                        $attrIdArr[] = $size;
                    }
                    foreach ($goodsAttrArr['color'] as $color){
                        $productsSnArr[] = $goodsParam['goods_sn'].'_p'.$color;
                        $attrIdArr[] = $color;
                    }
                }
                foreach ($param['attr_tab_data'] as $key => $row){
                    $productsParam[] = ['goods_id'=>$goodsId, 'goods_attr'=>join('|', $attrIdArr[$key]), 'product_sn'=>(empty($row['product_sn']) ? $productsSnArr[$key] : $row['product_sn']), 'bar_code'=>$row['product_bar_code'], 'product_number'=>$row['product_number'], 'product_price'=>$row['product_price'], 'product_warn_number'=>$row['product_warn_number'], 'admin_id'=>$admin_id];
                }
                $products = new Products();
                $products->saveAll($productsParam);
            }
            $this->commit();
            return true;
            //return true;
        } catch (\Exception $e) {
            $this->error = '添加失败';
            $this->rollback();
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
        $goodsParam = $param;
        $goodsId = $param['goods_id'];
        $admin_id = $param['admin_id'];
        if(empty($goodsParam['goods_sn'])){
            $goodsParam['goods_sn'] = $this->productSn();
        }
        $goodsParam['goods_img'] = $goodsParam['goods_thumb'] = $goodsParam['original_img'] = join(',', $goodsParam['goods_img']);
        $goodsParam['goods_cause'] = join(',', $goodsParam['return_type']);
        $goodsParam['user_id'] = 0;
        if(isset($goodsParam['attr_color_list'])){
            for($i = 0, $cnt = count($goodsParam['attr_color_list']); $i < $cnt; $i++){
                unset($goodsParam['color_'.$i]);
            }
        }
        unset($goodsParam['goods_id'],$goodsParam['attr_check_list'],$goodsParam['attr_color_list'],$goodsParam['attr_tab_data'],$goodsParam['attr_img_size_data'],$goodsParam['attr_color_data'],$goodsParam['return_type'],$goodsParam['admin_id'],$goodsParam['color_count']);

        $validate = validate($this->name);
        if (!$validate->check($goodsParam)) {
            $this->error = $validate->getError();
            return false;
        }
        $this->startTrans();
        try {
            $this->allowField(true)->save($goodsParam, ['goods_id' => $goodsId]);
            //先保存商品，然后取出商品ID
            $goodsAttrSizeParam = $goodsAttrColorParam = $productsParam = array();
            $goodsAttrArr = array('size' => [],'color' => []);
            $goodsAttr = new GoodsAttr();
            if(isset($param['attr_img_size_data'])) {
                foreach ($param['attr_img_size_data'] as $row){
                    $goodsAttrSizeParam[] = array('goods_id'=>$goodsId, 'attr_id'=>$row['attr_id'], 'attr_value'=>$row['size'], 'attr_img_file'=>$row['img'], 'attr_sort'=>$row['sort'], 'admin_id'=>$admin_id);
                }
                $goodsAttr->saveAll($goodsAttrSizeParam);
                $attrWhere = array('goods_id'=>$goodsId, 'attr_id'=>$param['attr_img_size_data'][0]['attr_id']);
                $goodsAttrArr['size'] = $goodsAttr->where($attrWhere)->column('goods_attr_id');
            }
            if(isset($param['attr_color_data'])){
                foreach ($param['attr_color_data'] as $row){
                    $goodsAttrColorParam[] = array('goods_id'=>$goodsId, 'attr_id'=>$row['attr_id'], 'attr_value'=>$row['color'], 'attr_sort'=>$row['sort'], 'admin_id'=>$admin_id);
                }
                $goodsAttr->saveAll($goodsAttrColorParam);
                $attrWhere = array('goods_id'=>$goodsId, 'attr_id'=>$param['attr_color_data'][0]['attr_id']);
                $goodsAttrArr['color'] = $goodsAttr->where($attrWhere)->column('goods_attr_id');
            }

            //保存商品属性，然后取出尺码和颜色的ID，组合成SIZE_ID|COLOR_ID
            if(isset($param['attr_tab_data'])){
                $attrIdArr = array();
                $productsSnArr = array();
                if(count($goodsAttrArr['size']) > 0 && count($goodsAttrArr['color']) > 0){
                    foreach ($goodsAttrArr['size'] as $size) {
                        $productsSnArr[] = $goodsParam['goods_sn'].'_p'.$size;
                        foreach($goodsAttrArr['color'] as $color){
                            $productsSnArr[] = $goodsParam['goods_sn'].'_p'.$color;
                            $attrIdArr[] = array($size, $color);
                        }
                    }
                } else {
                    foreach ($goodsAttrArr['size'] as $size){
                        $productsSnArr[] = $goodsParam['goods_sn'].'_p'.$size;
                        $attrIdArr[] = $size;
                    }
                    foreach ($goodsAttrArr['color'] as $color){
                        $productsSnArr[] = $goodsParam['goods_sn'].'_p'.$color;
                        $attrIdArr[] = $color;
                    }
                }
                foreach ($param['attr_tab_data'] as $key => $row){
                    $productsParam[] = ['goods_id'=>$goodsId, 'goods_attr'=>join('|', $attrIdArr[$key]), 'product_sn'=>(empty($row['product_sn']) ? $productsSnArr[$key] : $row['product_sn']), 'bar_code'=>$row['product_bar_code'], 'product_number'=>$row['product_number'], 'product_price'=>$row['product_price'], 'product_warn_number'=>$row['product_warn_number'], 'admin_id'=>$admin_id];
                }
                $products = new Products();
                $products->saveAll($productsParam);
            }
            $this->commit();
            return true;
            //return true;
        } catch (\Exception $e) {
            $this->error = '添加失败';
            $this->rollback();
            return false;
        }
    }

    /**
     * 更新商品各个状态
     * @param null $id
     * @param array $param
     * @param bool $flag
     * @return bool
     */
    public function updateGoodStatus($id = null, $param = [], $flag = true)
    {
        if ($flag) {
            $validate = validate($this->name);
            if (!$validate->check($param)) {
                $this->error = $validate->getError();
                return false;
            }
        }
        try {
            $this->allowField(true)->save($param, ['goods_id' => $id]);
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

    public function goodsAttr()
    {
        return $this->hasMany('GoodsAttr', 'goods_id', 'goods_id');
    }

    public function products()
    {
        return $this->hasMany('Products', 'goods_id', 'goods_id');
    }

    private function productSn(){
        $maxGoodId = $this->max('goods_id');
        $maxGoodId = (int)$maxGoodId + 1;
        return 'G'.str_pad($maxGoodId,6,"0",STR_PAD_LEFT);
    }
}
