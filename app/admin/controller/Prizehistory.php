<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------


namespace app\admin\controller;

// use \think\Cache;
use \think\Controller;
// use think\Loader;
use think\Db;
// use \think\Cookie;
// use \think\Session;
use app\admin\controller\Permissions;
use app\front\model\UserExchange as exchangeModel;
class Prizehistory extends Permissions
{   
    public function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {
        // $model = new exchangeModel();
        $where['a.status']=1;
        if($this->request->isPost()){
            $post = $this->request->param();

            
            if (isset($post['keywords_u']) and !empty($post['keywords_u'])) {
                $where['u.username'] = ['like', '%' . $post['keywords_u'] . '%'];
            }
            
            if (isset($post['keywords_p']) and !empty($post['keywords_p'])) {
                $where['p.name'] = ['like', '%' . $post['keywords_p'] . '%'];
            }

            
            // if (isset($post['status']) && ($post['status'] == '1' || $post['status'] === '0'  || $post['status']=='2' )) {
            //     $where['a.status'] = $post['status'];
            // }
     
            if(isset($post['create_time']) and !empty($post['create_time'])) {
                $min_time = strtotime($post['create_time']);
                $max_time = $min_time + 24 * 60 * 60;
                $where['a.create_time'] = [['>=',$min_time],['<=',$max_time]];
            }

            $this->assign('post',$post);

            
        }
        $exchanges=Db::name('user_exchange')->alias('a')->join('prize p','a.prize_id=p.id')->join('user u','a.user_id=u.uid')->where($where)->field('a.*,u.username,u.email,p.name')->order('a.create_time desc')->paginate(10);
         
        // $exchanges = empty($where) ? $model->order('create_time desc')->paginate(20) : $model->where($where)->order('create_time desc')->paginate(20,false,['query'=>$this->request->param()]);
        $page=$exchanges->render();
   
        $this->assign('exchanges',$exchanges);
        $this->assign('page',$page);

        return $this->fetch();
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('user_exchange')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                addlog('删除兑换记录-'.$id);//写入日志
                return $this->success('删除成功','admin/prizeexchange/index');
            }
    	}
    }


 
    
    public function status()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            if(false == Db::name('user_exchange')->where('id',$post['id'])->update(['status'=>$post['status']])) {
                return $this->error('设置失败');
            } else {
                addlog($post['id']);//写入日志
                return $this->success('设置成功','');
            }
        }
    }
    

}
