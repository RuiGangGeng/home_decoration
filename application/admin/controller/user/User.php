<?php

namespace app\admin\controller\user;

use app\common\controller\Backend;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;

/**
 * 会员管理
 *
 * @icon fa fa-user
 */
class User extends Backend
{

    protected $relationSearch = true;


    /**
     * @var \app\admin\model\User
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('User');
    }

    /**
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->with(['group'])
                ->where($where)
                ->order($sort, $order)
                ->count();
            $list  = $this->model
                ->with(['group'])
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();
            foreach ($list as $k => $v) {
                $v->hidden(['password', 'salt']);
            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 编辑
     */
    public function edit($ids = NULL)
    {
        $row = $this->model->get($ids);
        if (!$row) $this->error(__('No Results were found'));
        $this->view->assign('groupList', build_select('row[group_id]', \app\admin\model\UserGroup::column('id,name'), $row['group_id'], ['class' => 'form-control selectpicker']));
        try {
            $result = Db::name('shop')
                ->alias('s')
                ->join(' user u', 'find_in_set(s.id,u.child)!=0')
                ->where(['u.id' => $ids, 's.status' => '1'])
                ->field("s.id,s.name,s.logo_image,s.short")
                ->select();
            $this->view->assign('shopList',$result);
        } catch (DataNotFoundException $e) {
            $this->error('没有找到信息');
        } catch (ModelNotFoundException $e) {
            $this->error('没有找到信息');
        } catch (DbException $e) {
            $this->error('没有找到信息');
        }
        return parent::edit($ids);
    }

}
