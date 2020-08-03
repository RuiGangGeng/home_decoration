<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\DbException;
use think\exception\PDOException;

/**
 * 首页接口
 */
class Index extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 首页
     *
     */
    public function index()
    {
        $this->success('请求成功');
    }

    /**
     * 获取 Banner 广告
     * @throws DbException
     */
    public function getBanners()
    {
        $result = Db::name('content_banner')
            ->order('weigh', 'desc')
            ->select();
        if ($result) {
            foreach ($result as &$item) $item['image'] = self::patch_oss($item['image']);
            $this->success('获取成功', $result);
        } else {
            $this->error('获取失败');
        }
    }

    /**
     * 获取 HeadLine 广告
     * @param boolean $id
     * @throws DbException
     */
    public function getHeadLine($id = false)
    {
        $where = [];
        if ($id) {
            $where['id'] = $id;
        }
        $result = Db::name('content_headline')
            ->where($where)
            ->order('weigh', 'desc')
            ->select();
        if ($result) {
            $this->success('获取成功', $result);
        } else {
            $this->error('获取失败');
        }
    }

    /**
     * 获取 Discount
     * @param bool $category_id
     * @throws DbException
     */
    public function getDiscount($category_id = false)
    {
        $where = [];
        if ($category_id) {
            $where['category_id'] = $category_id;
            $where['type_list']   = ['>', 2];
        } else {
            $where['type_list'] = ['<', 3];
        }
        $result = Db::name('content_discount')
            ->where($where)
            ->order('weigh', 'desc')
            ->select();
        if ($result) {
            foreach ($result as &$item) $item['image'] = self::patch_oss($item['image']);
            $this->success('获取成功', $result);
        } else {
            $this->error('获取失败');
        }
    }

    /**
     * 获取行业分类
     * @throws DbException
     */
    public function getCategories()
    {
        $result = Db::name('category')
            ->where(['type' => 'shop_type', 'status' => 'normal'])
            ->order('weigh', 'desc')
            ->select();
        if ($result) {
            foreach ($result as &$item) $item['image'] = self::patch_oss($item['image']);
            $this->success('获取成功', $result);
        } else {
            $this->error('获取失败');
        }
    }

    /**
     * 新增投诉反馈
     * @param string $content 投诉内容
     */
    public function postComplaint($content)
    {
        $result = Db::name('content_complaint')->insert([
            'user_id'    => $this->auth->id,
            'content'    => $content,
            'createtime' => time(),
            'updatetime' => time(),
        ]);
        $result ? $this->success('反馈成功') : $this->error('反馈失败');
    }

    /**
     * 上传文件
     */
    public function upload()
    {
        (new \addons\alioss\controller\Index())->upload();
    }

    /**
     * 校验收藏
     * @param $shop_id
     * @throws DbException
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     */
    public function like_($shop_id)
    {
        $user_id = $this->auth->id;
        $result  = Db::name('like')->where(['user_id' => $user_id, 'shop_id' => $shop_id])->find();
        $result ? $this->success() : $this->error();
    }

    /**
     * 取消、添加收藏
     * @param $shop_id
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws Exception
     * @throws PDOException
     */
    public function like($shop_id)
    {
        $user_id = $this->auth->id;
        $find    = Db::name('like')->where(['user_id' => $user_id, 'shop_id' => $shop_id])->find();
        if ($find) {
            $result = Db::name('like')->where(['user_id' => $user_id, 'shop_id' => $shop_id])->delete();
        } else {
            $result = Db::name('like')->insert(['user_id' => $user_id, 'shop_id' => $shop_id]);
        }
        $result ? $this->success() : $this->error();
    }

    /**
     * 帮助说明
     */
    public function help()
    {
        $result = Db::name('content_help')->find();
        $this->success('', $result);
    }
	
	/**
     * 提现说明
     */
    public function getContentBalance()
    {
        $result = Db::name('content_balance')->find();
        $this->success('', $result);
    }

    /**
     * 送审信息
     */
    public function review()
    {
        $this->success('',config('site.review')==1);
    }

    /**
     * 版本更新
     */
    public function versionUpdate()
    {
        $update = config('site.version_update')==1;
        if($update){
            $this->success('',self::patch_oss(config('site.version_image')));
        }
        $this->success('',false);
    }
}
