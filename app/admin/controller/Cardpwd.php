<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:ikscher
// +----------------------------------------------------------------------

//活动内容控制器
namespace app\admin\controller;

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\admin\model\CardPwd as cardpwdModel;
use app\admin\model\CardCate as cardcateModel;
class Cardpwd extends Permissions
{   
    private $model;
    private $catemodel;

    public function _initialize()
    {
        $this->model=new cardpwdModel();
        $this->catemodel=new cardcateModel();
    }
    public function index()
    {
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['card_no'] = ['like', '%' . $post['keywords'] . '%'];
        }
        // if (isset($post['article_cate_id']) and $post['article_cate_id'] > 0) {
        //     $where['article_cate_id'] = $post['article_cate_id'];
        // }

        // if (isset($post['admin_id']) and $post['admin_id'] > 0) {
        //     $where['admin_id'] = $post['admin_id'];
        // }
        
        // if (isset($post['status']) and ($post['status'] == 1 or $post['status'] === '0')) {
        //     $where['status'] = $post['status'];
        // }

        // if (isset($post['is_top']) and ($post['is_top'] == 1 or $post['is_top'] === '0')) {
        //     $where['is_top'] = $post['is_top'];
        // }
 
        // if(isset($post['create_time']) and !empty($post['create_time'])) {
        //     $min_time = strtotime($post['create_time']);
        //     $max_time = $min_time + 24 * 60 * 60;
        //     $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        // }
        
        $cardpwds = empty($where) ? $this->model->order('create_time desc')->paginate(15) : $this->model->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
        
    
        // $arc=collection($articles->toArray());var_dump($arc['data']);exit;
        //$articles = $article->toArray();
        
        $this->assign('cardpwds',$cardpwds);
        $cates_= $this->catemodel->select();
        $cates=collection($cates_)->toArray();

        $this->assign('cates',$cates);
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
                $post['edit_admin_id'] = Session::get('admin');
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
                $post['admin_id'] = Session::get('admin');
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
