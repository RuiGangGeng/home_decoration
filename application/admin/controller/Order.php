<?php

namespace app\admin\controller;

use app\api\library\WxPay;
use app\common\controller\Backend;
use think\Db;
use think\exception\PDOException;
use think\exception\ValidateException;
use think\Session;

/**
 * 订单管理
 *
 * @icon fa fa-circle-o
 * @remark 一个管理员可以有多个角色组,左侧的菜单根据管理员所拥有的权限进行生成
 */
class Order extends Backend
{

    /**
     * Order模型对象
     * @var \app\admin\model\Order
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Order;
        $this->view->assign("statusList", $this->model->getStatusList());
        $this->view->assign("root", explode('admin.php',$this->request->root(true))[0]);
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
            $where_ = Session::get('admin.shop_id') != 0 ? ['shop_id' => Session::get('admin.shop_id')] : [];
            $total  = $this->model
                ->with(['orderaddress', 'ordershop'])
                ->where($where)
                ->where($where_)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->with(['orderaddress', 'ordershop'])
                ->where($where)
                ->where($where_)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            foreach ($list as $row) {
                $row->visible(['id', 'user_id','pay_time','total_price','total_counts', 'shop_id', 'numbers', 'transaction', 'status', 'createtime', 'updatetime']);
                $row->visible(['orderaddress']);
                $row->getRelation('orderaddress')->visible(['contact', 'phone', 'address']);
                $row->visible(['ordershop']);
                $row->getRelation('ordershop')->visible(['name']);
            }
            $list   = collection($list)->toArray();
            foreach ($list as &$item) {
                // 订单超时
                if ($item['createtime'] + 30 * 60 < time() && $item['pay_time'] === null) {
                    $item['status'] = '-1';
                    Db::name('order')->where(['id' => $item['id']])->update(['status' => '-1']);
                }
            }
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
        $row = $this->model->with(['orderaddress', 'ordershop', 'ordergood' => function ($query) {
            $query->with(['ordergoodgood']);
        }])->find($ids);

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
                    if($params['status']==9){
                        $params['platform_agree_time'] = time();
                        // 调用退款
                        $pay = WxPay::instance(config('site.app_id'), config('site.mch_id'), config('site.key'));
                        $pay->refund(config('site.ssl_cert'), config('site.ssl_key'), $row->total_price, config('site.refund_notify_url'), $row->numbers, false);
                        // 调整收益
                        // 操作商家余额
                        Db::name('shop_balance')->where(['shop_id'=>$row->shop_id])->setDec('balance_',$row->total_price);
                        Db::name('shop_balance')->where(['shop_id'=>$row->shop_id])->setDec('total_price',$row->total_price);
                    }
                    if($params['status']==10){
                        $params['platform_refuse_time'] = time();
                    }

                    $result = $row->allowField(true)->save($params);
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
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
