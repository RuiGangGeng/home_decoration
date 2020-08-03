<?php

return array (
  0 => 
  array (
    'name' => 'app_id',
    'title' => 'app_id',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => 'LTAI4GEhKXc1rVpiPgmhESMn',
    'rule' => 'required',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  1 => 
  array (
    'name' => 'app_key',
    'title' => 'app_key',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => 'IhJexiTu7lRnPM0zsZEMBK3g2mvIna',
    'rule' => 'required',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  2 => 
  array (
    'name' => 'bucket',
    'title' => 'Bucket',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => 'net-jxm',
    'rule' => 'required',
    'msg' => '',
    'tip' => '阿里云OSS的空间名',
    'ok' => '',
    'extend' => '',
  ),
  3 => 
  array (
    'name' => 'endpoint',
    'title' => 'EndPoint',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => 'oss-cn-beijing.aliyuncs.com',
    'rule' => 'required',
    'msg' => '',
    'tip' => '如果是服务器中转模式，可填写内网域名，前面不可加http://',
    'ok' => '',
    'extend' => '',
  ),
  4 => 
  array (
    'name' => 'cdnurl',
    'title' => 'CDN地址',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => 'https://net-jxm.oss-cn-beijing.aliyuncs.com',
    'rule' => 'required',
    'msg' => '',
    'tip' => '请填写CDN地址，必须以http://开头',
    'ok' => '',
    'extend' => '',
  ),
  5 => 
  array (
    'name' => 'uploadmode',
    'title' => '上传模式',
    'type' => 'select',
    'content' => 
    array (
      'client' => '客户端直传(速度快,无备份)',
      'server' => '服务器中转(占用服务器带宽,有备份)',
    ),
    'value' => 'client',
    'rule' => '',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  6 => 
  array (
    'name' => 'savekey',
    'title' => '保存文件名',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '/uploads/{year}{mon}{day}/{filemd5}{.suffix}',
    'rule' => 'required',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  7 => 
  array (
    'name' => 'expire',
    'title' => '上传有效时长',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '600',
    'rule' => 'required',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  8 => 
  array (
    'name' => 'maxsize',
    'title' => '最大可上传',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '10M',
    'rule' => 'required',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  9 => 
  array (
    'name' => 'mimetype',
    'title' => '可上传后缀格式',
    'type' => 'string',
    'content' => 
    array (
    ),
    'value' => '*',
    'rule' => 'required',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  10 => 
  array (
    'name' => 'multiple',
    'title' => '多文件上传',
    'type' => 'bool',
    'content' => 
    array (
    ),
    'value' => '0',
    'rule' => 'required',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  11 => 
  array (
    'name' => 'syncdelete',
    'title' => '附件删除时是否同步删除文件',
    'type' => 'bool',
    'content' => 
    array (
    ),
    'value' => '1',
    'rule' => 'required',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
  12 => 
  array (
    'name' => '__tips__',
    'title' => '温馨提示',
    'type' => '',
    'content' => 
    array (
    ),
    'value' => '在使用之前请注册阿里云账号并进行认证和创建空间，注册链接:<a href="https://oss.console.aliyun.com/index" target="_blank">https://oss.console.aliyun.com/index</a><br/>FastAdmin赠送你阿里云最高1888云产品通用代金券，如有需要可以<a href="https://www.fastadmin.net/go/aliyun" target="_blank">点击领取</a>',
    'rule' => '',
    'msg' => '',
    'tip' => '',
    'ok' => '',
    'extend' => '',
  ),
);
