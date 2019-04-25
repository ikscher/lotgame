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
use app\admin\model\Board as boardModel;

class Board extends Permissions
{   
    public function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {   
        $model = new boardModel();
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['title'] = ['like', '%' . $post['keywords'] . '%'];
        }
        // if (isset($post['article_cate_id']) and $post['article_cate_id'] > 0) {
        //     $where['article_cate_id'] = $post['article_cate_id'];
        // }

        if (isset($post['admin_id']) and $post['admin_id'] > 0) {
            $where['admin_id'] = $post['admin_id'];
        }
        
        if (isset($post['status']) and ($post['status'] == 1 or $post['status'] === '0')) {
            $where['status'] = $post['status'];
        }

        if (isset($post['is_top']) and ($post['is_top'] == 1 or $post['is_top'] === '0')) {
            $where['is_top'] = $post['is_top'];
        }
 
        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }
        
        $boards = empty($where) ? $model->order('create_time desc')->paginate(20) : $model->where($where)->order('create_time desc')->paginate(20,false,['query'=>$this->request->param()]);

        //$articles = $article->toArray();
        //添加最后修改人的name
        // foreach ($boards as $key => $value) {
        //     $articles[$key]['edit_admin'] = Db::name('admin')->where('id',$value['edit_admin_id'])->value('nickname');
        // }
        $this->assign('boards',$boards);
        // $info['cate'] = Db::name('article_cate')->select();
        $info['admin'] = Db::name('admin')->select();
        $this->assign('info',$info);
        return $this->fetch();
    }


    public function publish()
    {
    	//获取菜单id
    	$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
    	$model = new boardModel();
		//是正常添加操作
		if($id > 0) {
    		//是修改操作
    		if($this->request->isPost()) {
    			//是提交操作
    			$post = $this->request->post();
    			//验证  唯一规则： 表名，字段名，排除主键值，主键名
	            $validate = new \think\Validate([
	                ['title', 'require', '标题不能为空'],
                    ['content', 'require', '文章内容不能为空'],
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
	            //验证菜单是否存在
	            $board = $model->where('id',$id)->find();
	            if(empty($board)) {
	            	return $this->error('id不正确');
	            }
                //设置修改人
                // $post['edit_admin_id'] = Session::get('admin');
	            if(false == $model->allowField(true)->save($post,['id'=>$id])) {
	            	return $this->error('修改失败');
	            } else {
                    $operation='公告修改成功';
                    addlog($operation.'-'.$model->id);//写入日志
	            	return $this->success($operation,'admin/board/index');
	            }
    		} else {
    			//非提交操作
    			$board = $model->where('id',$id)->find();
    			// $cates = $cateModel->select();
    			// $cates_all = $cateModel->catelist($cates);
    			// $this->assign('cates',$cates_all);
    			if(!empty($board)) {
    				$this->assign('board',$board);
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
                    ['content', 'require', '文章内容不能为空'],
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
                //设置创建人
                $post['admin_id'] = Session::get('admin');
                
                // echo json_encode($post);exit;
                //设置修改人
                // $post['edit_admin_id'] = $post['admin_id'];
                // foreach($post as $k=>$v){
                //     $model->$k=$v;
                // }
                // DB::name('board')->insert($post);
                // echo DB::name('board')->getLastSql();exit;
                $ret=$model->allowField(true)->save($post);

	            if(false ==$ret ) {
	            	return $this->error('添加失败');
	            } else {
                    $operation='添加公告成功';
                    addlog($operation.'-'.$model->id);//写入日志  报错因为必须要在菜单添加动作
                    // return addlog($operation.'-'.$model->id);//测试 输出 写入日志  报错因为必须要在菜单添加动作
	            	return $this->success($operation,'admin/board/index');
	            }
    		} else {
    			//非提交操作
    			// $cate = $cateModel->select();
    			// $cates = $cateModel->catelist($cate);
    			// $this->assign('cates',$cates);
    			return $this->fetch();
    		}
    	}
    	
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('board')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='公告删除成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/board/index');
            }
    	}
    }


    public function is_top()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            if(false == Db::name('board')->where('id',$post['id'])->update(['is_top'=>$post['is_top']])) {
                return $this->error('设置失败');
            } else {
                $operation='公告置顶设置成功';
                addlog($operation.'-'.$post['id']);//写入日志
                return $this->success($operation,'admin/board/index');
            }
        }
    }


    public function status()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            if(false == Db::name('board')->where('id',$post['id'])->update(['status'=>$post['status']])) {
                return $this->error('设置失败');
            } else {
                $operation='公告设置状态成功';
                addlog($operation.'-'.$post['id']);//写入日志
                return $this->success($operation,'admin/board/index');
            }
        }
    }
}
