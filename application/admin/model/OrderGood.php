<?php

namespace app\admin\model;

use think\Model;

class OrderGood extends Model
{
    // 表名
    protected $name = 'order_good';

    public function ordergoodgood()
    {
        return $this->hasOne('Good', 'id', 'good_id', [], 'LEFT')->setEagerlyType(0);
    }
}
