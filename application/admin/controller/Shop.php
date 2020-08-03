<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use fast\Random;
use think\Db;
use think\exception\PDOException;
use think\exception\ValidateException;

/**
 * 商家管理
 *
 * @icon fa fa-circle-o
 */
class Shop extends Backend
{

    /**
     * Shop模型对象
     * @var \app\admin\model\Shop
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Shop;
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */


    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->with(['shopaddress', 'shopmaterial', 'category'])
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->with(['shopaddress', 'shopmaterial', 'category'])
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            foreach ($list as $row) {
                $row->visible(['id', 'user_id', 'category_id', 'name','tui', 'logo_image', 'contact', 'phone', 'status', 'createtime','weigh']);
                $row->visible(['category']);
                $row->getRelation('category')->visible(['name']);
                $row->visible(['shopaddress']);
                $row->getRelation('shopaddress')->visible(['id', 'base_price','address', 'longitude', 'latitude', 'hours_start', 'hours_end', 'delivery', 'distance']);
                $row->visible(['shopmaterial']);
                $row->getRelation('shopmaterial')->visible(['id', 'card_up_image', 'card_down_image', 'license_image', 'storefront_image']);
            }
            $list   = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 编辑
     */
    public function edit($ids = null)
    {
        $row = $this->model->with(['shopaddress', 'shopmaterial'])->find($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name     = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                        $row->validateFailException(true)->validate($validate);
                    }
                    $result = $row->allowField(true)->save($params);
                    $row->shopaddress()->where(['id' => $params['shopaddress']['id']])->update($params['shopaddress']);
                    $row->shopmaterial()->where(['id' => $params['shopmaterial']['id']])->update($params['shopmaterial']);
                    // 同步商家手机号到商家后台
                    $find = Db::name('admin')->where(['username' => $params['phone']])->find();
                    if ($params['status'] == 1) {
                        $salt = Random::alnum();
                        if(!$find){
                            $admin_id = Db::name('admin')->insertGetId([
                                'username'   => $params['phone'],
                                'shop_id'    => $ids,
                                'nickname'   => $params['phone'],
                                'salt'       => $salt,
                                'password'   => md5(md5($params['phone']) . $salt),
                                'email'      => 'admin-'.$salt.'@website.com',
                                'avatar'     => '/uploads/20200602/26f5e51b8ac7fbd6f1c649cc45a18265.png',
                                'createtime' => time(),
                                'updatetime' => time(),
                            ]);
                            Db::name('auth_group_access')->insert(['uid'=>$admin_id,'group_id'=>'2']);
                        }
                    } else {
                        $find && Db::name('admin')->where(['username' => $params['phone']])->update(['status' => '']);
                    }
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (\Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were updated'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }
}
