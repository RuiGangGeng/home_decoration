<?php

namespace app\admin\model\content;

use think\Model;


class ContentDiscount extends Model
{

    

    

    // 表名
    protected $name = 'content_discount';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'type_list_text'
    ];
    

    protected static function init()
    {
        self::afterInsert(function ($row) {
            $pk = $row->getPk();
            $row->getQuery()->where($pk, $row[$pk])->update(['weigh' => $row[$pk]]);
        });
    }

    
    public function getTypeListList()
    {
        return ['1' => __('Type_list 1'), '2' => __('Type_list 2'), '3' => __('Type_list 3'), '4' => __('Type_list 4')];
    }


    public function getTypeListTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['type_list']) ? $data['type_list'] : '');
        $list = $this->getTypeListList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function good()
    {
        return $this->belongsTo('app\admin\model\Good', 'good_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    public function shop()
    {
        return $this->belongsTo('app\admin\model\Shop', 'shop_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    public function category()
    {
        return $this->belongsTo('app\common\model\Category', 'category_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
