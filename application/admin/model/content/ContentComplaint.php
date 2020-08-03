<?php

namespace app\admin\model\content;

use think\Model;


class ContentComplaint extends Model
{

    

    

    // 表名
    protected $name = 'content_complaint';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'stauts_text'
    ];
    

    
    public function getStautsList()
    {
        return ['1' => __('Stauts 1'), '2' => __('Stauts 2'), '3' => __('Stauts 3'), '5' => __('Stauts 5')];
    }


    public function getStautsTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['stauts']) ? $data['stauts'] : '');
        $list = $this->getStautsList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
