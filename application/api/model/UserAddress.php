<?php


namespace app\api\model;

use think\Model;

class UserAddress extends Model
{
    // 表名
    protected $name = 'user_address';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    // 隐藏的字段
    protected $hidden = ['user_id'];

    // 输出格式化日期
    protected $dateFormat = 'Y-m-d H:i:s';
}