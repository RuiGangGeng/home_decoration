<?php

namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;

class Order extends Model
{

    use SoftDelete;

    

    // 表名
    protected $name = 'order';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';

    // 追加属性
    protected $append = [
        'status_text'
    ];
    

    
    public function getStatusList()
    {
        return ['-1' => __('Status -1'),'0' => __('Status 0'), '1' => __('Status 1'), '3' => __('Status 3'), '4' => __('Status 4')];
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function ordergood()
    {
        return $this->hasMany('OrderGood','order_id', 'id');
    }

    public function orderaddress()
    {
        return $this->hasOne('OrderAddress', 'order_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    public function ordershop()
    {
        return $this->hasOne('Shop', 'id', 'shop_id', [], 'LEFT')->setEagerlyType(0);
    }
}
