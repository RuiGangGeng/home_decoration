<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Session;

/**
 * 商家分类
 *
 * @icon fa fa-circle-o
 */
class ShopCategory extends Backend
{

    /**
     * ShopCategory模型对象
     * @var \app\admin\model\ShopCategory
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\ShopCategory;
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
            $where_ = Session::get('admin.shop_id') != 0 ? ['shop_category.shop_id' => Session::get('admin.shop_id')] : [];
            $total  = $this->model
                ->with(['shop'])
                ->where($where)
                ->where($where_)
                ->order($sort, $order)
                ->count('shop_category.id');

            $list = $this->model
                ->with(['shop'])
                ->where($where)
                ->where($where_)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            foreach ($list as $row) {
                $row->visible(['id', 'shop_id', 'name', 'thumb_image', 'weigh', 'status', 'createtime', 'updatetime']);
                $row->visible(['shop']);
                $row->getRelation('shop')->visible(['name']);
            }
            $list   = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 回收站
     */
    public function recyclebin()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $where_ = Session::get('admin.shop_id') != 0 ? ['shop_id' => Session::get('admin.shop_id')] : [];
            $total = $this->model
                ->onlyTrashed()
                ->where($where)
                ->where($where_)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->onlyTrashed()
                ->where($where_)
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }
}
