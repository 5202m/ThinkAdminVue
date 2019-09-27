<?php

namespace app\admin\model;

use think\Model;

class Attribute extends Model
{

    public function GoodsType()
    {
        return $this->belongsTo('GoodsType', 'cat_id', 'cat_id');
    }
}
