<?php

namespace app\api\controller;

use app\common\controller\Api;
use fast\Http;
use app\common\model\User as Users;
use think\Db;
use think\Exception;
use think\exception\DbException;

/**
 * 会员接口
 */
class User extends Api
{
    protected $noNeedLogin = 'wxAppLogIn';
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 小程序登录
     * @param string $code code码
     * @throws DbException
     */
    public function wxAppLogIn($code)
    {
        $app_id     = config('site.app_id');
        $app_secret = config('site.app_secret');
        $get_result = (new Http)->get("https://api.weixin.qq.com/sns/jscode2session?appid=$app_id&secret=$app_secret&js_code=$code&grant_type=authorization_code");
        // 对JSON格式的字符串进行解码
        $array = json_decode($get_result, true);

        if (!empty($array['openid'])) {
            $find = Users::get(['open_id' => $array['openid']]);

            if ($find) {
                $user_id = $find['id'];
                Users::where(['open_id' => $array['openid']])->update(['session_key' => $array['session_key']]);
            } else {
                $user_id = Users::insertGetId([
                    'open_id'     => $array['openid'],
                    'group_id'    => 1,
                    'prevtime'    => time(),
                    'logintime'   => time(),
                    'loginip'     => request()->ip(),
                    'joinip'      => request()->ip(),
                    'jointime'    => time(),
                    'createtime'  => time(),
                    'updatetime'  => time(),
                    'status'      => 'normal',
                    'session_key' => $array['session_key'],
                ]);
            }
            $ret = $this->auth->direct($user_id);
            if ($ret) {
                $this->success(__('登录成功'), $this->auth->getUserinfo());
            } else {
                $this->error($this->auth->getError());
            }
        } else {
            $this->error('请检查小程序配置');
        }

    }

    /**
     * 微信授权 【更新头像、昵称】
     * @param string $nickname 昵称
     * @param string $avatar 头像地址
     */
    public function wxAppAuthUser($nickname, $avatar)
    {

        $data = [
            'nickname'   => $nickname,
            'avatar'     => $avatar,
            'updatetime' => date("Y-m-d H:i:s", time())
        ];
        Users::update($data, ['id' => $this->auth->id]);
        $this->success("更新用户信息成功");
    }

    /**
     * 获取个人信息
     * @throws Exception
     */
    public function getUserInfo()
    {
        $user = $this->auth->getUser();
        $user->visible(['mobile', 'nickname', 'id', 'level', 'avatar', 'username', 'is_extension']);
        $user->append(['like', 'view']);
        $user->like = Db::name('like')->where(['user_id' => $user['id']])->count('id');
        $user->view = Db::name('view')->where(['user_id' => $user['id']])->count('id');
        $this->success('获取成功', $user);
    }

    /**
     * 获取我的收藏
     * @throws DbException
     */
    public function getLikes()
    {
        $result = Db::name('like')
            ->alias('l')
            ->where(['l.user_id' => $this->auth->id])
            ->join('good g', 'g.id = l.shop_id')
            ->field('l.*,g.name,g.original,g.price,g.thumb_image')
            ->paginate(null, false, $this->paginate)
            ->each(function ($item) {
                $item['thumb_image'] = self::patch_oss($item['thumb_image']);
                return $item;
            });
        if ($result) {
            $this->success('获取成功', $result);
        } else {
            $this->success('暂无记录');
        }
    }

    /**
     * 获取我的足迹
     * @throws DbException
     */
    public function getViews()
    {
        $result = Db::name('view')
            ->alias('l')
            ->where(['l.user_id' => $this->auth->id])
            ->order('l.view_time','desc')
            ->join('good g', 'g.id = l.shop_id')
            ->field('l.*,g.name,g.original,g.price,g.thumb_image')
            ->paginate(null, false, $this->paginate)
            ->each(function ($item) {
                $item['thumb_image'] = self::patch_oss($item['thumb_image']);
                return $item;
            });
        if ($result) {
            $this->success('获取成功', $result);
        } else {
            $this->success('暂无记录');
        }
    }
}
