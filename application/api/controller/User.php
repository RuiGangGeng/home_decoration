<?php

namespace app\api\controller;

use app\common\controller\Api;
use fast\Http;
use app\common\model\User as Users;
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
        }else{
            $this->error('请检查小程序配置');
        }

    }

    /**
     * 微信授权 【更新头像、昵称】
     * @param string $nickname 昵称
     * @param string $avatar 头像地址
     */
    public function wxAppAuthUser($nickname,$avatar)
    {

        $data = [
            'nickname'   => $nickname,
            'avatar'     => $avatar,
            'updatetime' => date("Y-m-d H:i:s", time())
        ];
        Users::update($data,['id'=>$this->auth->id]);
        $this->success("更新用户信息成功");
    }

    /**
     * 获取个人信息
     */
    public function getUserInfo()
    {
        $user = $this->auth->getUser();
        $user->visible(['mobile','nickname','id','level','avatar','username','is_extension']);
        $shop = \app\admin\model\Shop::get(['user_id'=>$this->auth->id]);
        $user = $user->toArray();
        $user['shop'] = $shop?$shop['status']:false;
        $user['shop_id'] = $shop?$shop['id']:false;
        $user['review'] = config('site.review')==1;
        $this->success('获取成功',$user);
    }

}
