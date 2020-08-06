<?php

namespace app\admin\model\content;

use think\Model;


class ContentBanner extends Model
{

    

    

    // 表名
    protected $name = 'content_banner';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];
    

    protected static function init()
    {
        self::afterInsert(function ($row) {
            $pk = $row->getPk();
            $row->getQuery()->where($pk, $row[$pk])->update(['weigh' => $row[$pk]]);
        });
    }

    







    public function shop()
    {
        return $this->belongsTo('app\admin\model\Good', 'shop_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
