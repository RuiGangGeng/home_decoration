<?php

namespace app\admin\model\finance;

use think\Model;


class ShopBalance extends Model
{

    

    

    // 表名
    protected $name = 'shop_balance';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];
    

    







    public function shop()
    {
        return $this->belongsTo('app\admin\model\Shop', 'shop_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
