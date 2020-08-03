<?php


namespace app\api\model;


use think\Model;

class UserCart extends Model
{
    // 表名
    protected $name = 'user_cart';

    // 隐藏的字段
    protected $hidden = ['user_id'];

    public function userCartGood()
    {
        return $this->hasOne('\app\admin\model\Good','id','good_id',"","LEFT")
            ->field('id,shop_id,name,original,price,stock,thumb_image,short')
            ->setEagerlyType(0);
    }
}