<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 听雨 < 389625819@qq.com >
// +----------------------------------------------------------------------


namespace app\admin\controller;

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
// use \think\Cookie;
// use \think\Session;
use app\admin\controller\Permissions;
use app\user\model\User as userModel;

class User extends Permissions
{
    public function index()
    {
        $model = new userModel();
        $post = $this->request->param();
        if (isset($post['username']) and !empty($post['username'])) {
            $where['user'] = ['like', '%' . $post['username'] . '%'];
        }
        if (isset($post['user_type']) and $post['user_type'] > 0) {
            $where['user_type'] = $post['user_type'];
        }

        if (isset($post['uid']) and $post['uid'] > 0) {
            $where['uid'] = $post['uid'];
        }
        
        if (isset($post['mobile'])) {
            $where['mobile'] = $post['mobile'];
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
        
        $users = empty($where) ? $model->order('create_time desc')->paginate(20) : $model->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
        
    
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
    	$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
    	$model = new articleModel();
        $cateModel = new cateModel();
		//是正常添加操作
		if($id > 0) {
    		//是修改操作
    		if($this->request->isPost()) {
    			//是提交操作
    			$post = $this->request->post();
    			//验证  唯一规则： 表名，字段名，排除主键值，主键名
	            $validate = new \think\Validate([
	                ['title', 'require', '标题不能为空'],
	                ['article_cate_id', 'require', '请选择分类'],
                    ['thumb', 'require', '请上传缩略图'],
                    ['content', 'require', '文章内容不能为空'],
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
	            //验证菜单是否存在
	            $article = $model->where('id',$id)->find();
	            if(empty($article)) {
	            	return $this->error('id不正确');
	            }
                //设置修改人
                // $post['edit_admin_id'] = Session::get('admin');
                $post['begin_time']=strtotime($post['begin_time']);
                $post['end_time']=strtotime($post['end_time']);
	            if(false == $model->allowField(true)->save($post,['id'=>$id])) {
	            	return $this->error('修改失败');
	            } else {
                    $operation='修改成功';
                    addlog($operation.'-'.$model->id);//写入日志
	            	return $this->success($operation,'admin/article/index');
	            }
    		} else {
    			//非提交操作
    			$article = $model->where('id',$id)->find();
    			$cates = $cateModel->select();
    			$cates_all = $cateModel->catelist($cates);
    			$this->assign('cates',$cates_all);
    			if(!empty($article)) {
    				$this->assign('article',$article);
    				return $this->fetch();
    			} else {
    				return $this->error('id不正确');
    			}
    		}
    	} else {
    		//是新增操作
    		if($this->request->isPost()) {
    			//是提交操作
    			$post = $this->request->post();
    			//验证  唯一规则： 表名，字段名，排除主键值，主键名
	            $validate = new \think\Validate([
	                ['title', 'require', '标题不能为空'],
                    ['article_cate_id', 'require', '请选择分类'],
                    ['thumb', 'require', '请上传缩略图'],
                    ['content', 'require', '内容不能为空'],
                    ['begin_time', 'require', '开始时间不能为空'],
                    ['end_time', 'require', '结束时间不能为空']
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
                //设置创建人
                // $post['admin_id'] = Session::get('admin');
                //设置修改人
                $post['edit_admin_id'] = $post['admin_id'];
                $post['begin_time']=strtotime($post['begin_time']);
                $post['end_time']=strtotime($post['end_time']);
                // echo json_encode($post);exit;
	            if(false == $model->allowField(true)->save($post)) {
	            	return $this->error('添加失败');
	            } else {
                    $operation='添加活动成功';
                    addlog($operation.'-'.$model->id);//写入日志
	            	return $this->success($operation,'admin/article/index');
	            }
    		} else {
    			//非提交操作
    			$cate = $cateModel->select();
    			$cates = $cateModel->catelist($cate);
    			$this->assign('cates',$cates);
    			return $this->fetch();
    		}
    	}
    	
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('article')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                addlog($id);//写入日志
                return $this->success('删除成功','admin/article/index');
            }
    	}
    }


    public function is_top()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            if(false == Db::name('article')->where('id',$post['id'])->update(['is_top'=>$post['is_top']])) {
                return $this->error('设置失败');
            } else {
                addlog($post['id']);//写入日志
                return $this->success('设置成功','admin/article/index');
            }
        }
    }


    public function status()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            if(false == Db::name('article')->where('id',$post['id'])->update(['status'=>$post['status']])) {
                return $this->error('设置失败');
            } else {
                addlog($post['id']);//写入日志
                return $this->success('设置成功','admin/article/index');
            }
        }
    }
}
