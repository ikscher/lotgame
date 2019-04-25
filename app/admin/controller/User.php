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

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\front\model\User as userModel;
use app\front\model\UserSafepwd as userSafepwdModel;

class User extends Permissions
{   
    private $userModel;
    private $userSafepwdModel;
    public function _initialize()
    {  
        parent::_initialize();
        $this->userModel = new userModel();
        $this->userSafepwdModel = new userSafepwdModel();
    }

    public function index()
    {
        
        $post = $this->request->param();
        if (isset($post['username']) and !empty($post['username'])) {
            $where['username'] = ['like', '%' . $post['username'] . '%'];
        }
        if (isset($post['user_type']) and $post['user_type'] > 0) {
            $where['user_type'] = $post['user_type'];
        }

        if (isset($post['uid']) and $post['uid'] > 0) {
            $where['uid'] = $post['uid'];
        }
        
        if (!empty($post['mobile'])) {
            $where['mobile'] = ['like', '%' . $post['mobile'] . '%'];
        }

        // if (isset($post['is_vip']) and ($post['is_vip'] == 1 or $post['is_top'] === '0')) {
        //     $where['is_top'] = $post['is_top'];
        // }

        if (isset($post['is_freeze'])) {
            $where['is_freeze'] = $post['is_freeze'];
        }
 
        // if(isset($post['create_time']) and !empty($post['create_time'])) {
        //     $min_time = strtotime($post['create_time']);
        //     $max_time = $min_time + 24 * 60 * 60;
        //     $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        // }
        
        $users = empty($where) ? $this->userModel->order('create_time desc')->paginate(15) : $this->userModel->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
        
        // echo $model->getLastSql();
        // $arc=collection($articles->toArray());var_dump($arc['data']);exit;
        //$articles = $article->toArray();
        //添加最后修改人的name
        // foreach ($users as $key => $value) {
        //     $articles[$key]['edit_admin'] = Db::name('admin')->where('id',$value['edit_admin_id'])->value('nickname');
        // }
        $this->assign('users',$users);
        // $info['cate'] = Db::name('article_cate')->select();
        // $info['admin'] = Db::name('admin')->select();
        // $this->assign('info',$info);
        return $this->fetch();
    }


    public function publish()
    {
    	//获取菜单id
    	$uid = $this->request->has('uid') ? $this->request->param('uid', 0, 'intval') : 0;
    	// $model = new userModel();
        
        if(empty($uid)) {
            $uid=Session::get('userid_edit');
        }

		//是正常添加操作
		if($uid > 0) {
            Session::set('userid_edit',$uid);
    		//是修改操作
    		if($this->request->isPost()) {
    			//是提交操作
    			$post = $this->request->post();
    			//验证  唯一规则： 表名，字段名，排除主键值，主键名
	            $validate = new \think\Validate([
	                ['username', 'require', '用户名不能为空']
	                // ['password', 'require', '密码不能为空'],
                    // ['thumb', 'require', '请上传缩略图'],
                    // ['content', 'require', '文章内容不能为空'],
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
	            //验证菜单是否存在
	            $user = $this->userModel->where('uid',$uid)->find();
	            if(empty($user)) {
	            	return $this->error('uid不正确');
	            }
                //设置被修改的UID
                $post['birth']=strtotime($post['year'].'-'.$post['month'].'-'.$post['day']);
                
                $post['vip_expire']=strtotime($post['vip_expire']);
                $post['is_email']= empty($post['is_email'])?0:1;
                $post['is_mobile']= empty($post['is_mobile'])?0:1;
                if(!empty($post['password'])){
                    $post['password']=password($post['password'], 'front_wew234ewAsSUrUOwWV');//前台加密方式
                }else{
                    unset($post['password']);
                }
                // $post['end_time']=strtotime($post['end_time']);
                $ret=$this->userModel->allowField(true)->save($post,['uid'=>$uid]);
                // echo $model->getLastSql();exit;
	            if(false == $ret) {
	            	return $this->error('修改失败');
	            } else {
                    $operation='修改用户信息成功';
                    addlog($operation.'-'.$uid);//写入日志
	            	return $this->success($operation,'admin/user/index');
	            }
    		} else {
    			//非提交操作
    			$user = $this->userModel->where('uid',$uid)->find();
    			$this->assign('user',$user);
    			if(!empty($user)) {
    				$this->assign('user',$user);
    				return $this->fetch();
    			} else {
    				return $this->error('uid不正确');
    			}
    		}
    	} 
    	
    	
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$uid = $this->request->has('uid') ? $this->request->param('uid', 0, 'intval') : 0;
            if(false == $this->userModel->where('uid',$uid)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='删除用户成功';
                addlog($operation.'-'.$uid);//写入日志
                return $this->success($operation,'admin/user/index');
            }
    	}
    }


    public function freeze()
    {
        if($this->request->isAjax()) {
            $uid = $this->request->has('uid') ? $this->request->param('uid', 0, 'intval') : 0;
            $is_freeze = $this->request->param('is_freeze','2','intval');
            // $model = new userModel();
            if(false !== $this->userModel->where('uid',$uid)->update(['is_freeze'=>$is_freeze])){
                $operation=($is_freeze==1)?'解冻用户成功':'冻结用户成功';
                addlog($operation.'-'.$uid);//写入日志
                return $this->success($operation,'admin/user/index');
            } else {
                $operation=($is_freeze==1)?'解冻用户失败':'冻结用户失败';
                return $this->error($operation);
            }
        }
    }

    //后台管理员模拟用户登录
    public function login(){
        $uid = $this->request->has('uid') ? $this->request->param('uid', 0, 'intval') : 0;
        if(empty($uid)) 
            return $this->error('用户不存在！');
        $password=$this->userModel->where('uid',$uid)->value('password');
        if(empty($password)) 
            return $this->error('用户不存在！');
        Cookie::set('auth',ThkAuthCode("$uid\t$password",'ENCODE'),86400*7);

        return $this->success('正在跳转...','/user/index');
    }

    //其他功能
    public function other()
    {   
        if($this->request->isPost()){
            $post=$this->request->post();
            $uid=$post['safepwduid'];
            $id=$this->userSafepwdModel->where('user_id',$uid)->value('id');
            if(empty($id)){
                return $this->error('此会员不存在密保卡，请确认！');
            }

            $r=$this->userSafepwdModel->where('user_id',$uid)->delete();
            if($r){
                return $this->success('已清空用户密保卡！','/admin/user/other');
            }else{
                return $this->error('取消错误,请联系管理员！');
            }
        }
        return $this->fetch();
    }

    
}
