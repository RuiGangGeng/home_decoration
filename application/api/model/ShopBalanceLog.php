<?php


namespace app\api\model;

use think\Model;

class ShopBalanceLog extends Model
{
    // 表名
    protected $name = 'shop_balance_log';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    // 输出格式化日期
    protected $dateFormat = 'Y-m-d H:i:s';
}