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
use app\admin\model\Prize as prizeModel;
use app\admin\model\PrizeCate as prizeCateModel;
use app\admin\model\CardCate as cardCateModel;
use app\front\model\UserGrade as gradeModel;
use app\front\model\User as userModel;
use app\front\model\UserLog as logModel;
use app\front\model\UserRemark as remarkModel;
class Prize extends Permissions
{   
    public function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {
        $model = new prizeModel();
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['name'] = ['like', '%' . $post['keywords'] . '%'];
        }
        if (isset($post['prize_cate_id']) and $post['prize_cate_id'] > 0) {
            $where['prize_cate_id'] = $post['prize_cate_id'];
        }

        // if (isset($post['admin_id']) and $post['admin_id'] > 0) {
        //     $where['admin_id'] = $post['admin_id'];
        // }
        
        if (isset($post['status']) and ($post['status'] == 1 or $post['status'] === '0')) {
            $where['status'] = $post['status'];
        }

        // if (isset($post['is_top']) and ($post['is_top'] == 1 or $post['is_top'] === '0')) {
        //     $where['is_top'] = $post['is_top'];
        // }
 
        // if(isset($post['create_time']) and !empty($post['create_time'])) {
        //     $min_time = strtotime($post['create_time']);
        //     $max_time = $min_time + 24 * 60 * 60;
        //     $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        // }
        
        $prizes = empty($where) ? $model->order('create_time desc')->paginate(20) : $model->where($where)->order('create_time desc')->paginate(20,false,['query'=>$this->request->param()]);
        
    
        // $arc=collection($prizes->toArray());var_dump($arc['data']);exit;
        //$prizes = $prize->toArray();
        //添加最后修改人的name
        // foreach ($prizes as $key => $value) {
        //     $prizes[$key]['edit_admin'] = Db::name('admin')->where('id',$value['edit_admin_id'])->value('nickname');
        // }
        $this->assign('prizes',$prizes);
        $info['cate'] = Db::name('prize_cate')->select();
        // $info['admin'] = Db::name('admin')->select();
        $this->assign('info',$info);
        return $this->fetch();
    }


    public function publish()
    {
    	//获取菜单id
    	$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

        $cardCateModel= new cardCateModel();
        $cates_= $cardCateModel->select();
        $cardcates=collection($cates_)->toArray();
        $this->assign('cardcates',$cardcates);


    	$model = new prizeModel();
        $prizeCateModel = new prizeCateModel();
		//是正常添加操作
		if($id > 0) {
    		//是修改操作
    		if($this->request->isPost()) {
    			//是提交操作
    			$post = $this->request->post();
    			//验证  唯一规则： 表名，字段名，排除主键值，主键名
	            $validate = new \think\Validate([
	                ['name', 'require', '奖品不能为空'],
	                ['prize_cate_id', 'require', '请选择分类'],
                    ['card_cate_id', 'require', '请选择对应卡类型'],
                    ['thumb', 'require', '请上传缩略图'],
                    ['price', 'require', '奖品价格不能为空']
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
                
	            //验证菜单是否存在
	            $prize = $model->where('id',$id)->find();
	            if(empty($prize)) {
	            	return $this->error('id不正确');
	            }
                //设置修改人
                // $post['edit_admin_id'] = Session::get('admin');
                $post['coin']=$post['price']*1000;
          
	            if(false == $model->allowField(true)->save($post,['id'=>$id])) {
	            	return $this->error('修改失败');
	            } else {
                    $operation='修改奖品成功';
                    addlog($operation.'-'.$model->id);//写入日志
	            	return $this->success($operation,'admin/prize/index');
	            }
    		} else {
    			//非提交操作
    			$prize = $model->where('id',$id)->find();
    			$cates = $prizeCateModel->select();
    			$cates_all = $prizeCateModel->catelist($cates);
    			$this->assign('prizecates',$cates_all);
    			if(!empty($prize)) {
    				$this->assign('prize',$prize);
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
	                ['name', 'require', '奖品不能为空'],
                    ['prize_cate_id', 'require', '请选择分类'],
                    ['card_cate_id', 'require', '请选择对应卡类型'],
                    ['thumb', 'require', '请上传缩略图'],
                    ['price', 'require', '奖品价格不能为空']
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
                //设置创建人
                // $post['admin_id'] = Session::get('admin');
                //设置修改人
                // $post['edit_admin_id'] = $post['admin_id'];
          
             
	            if(false == $model->allowField(true)->save($post)) {
	            	return $this->error('添加失败');
	            } else {
                    $operation='添加奖品成功';
                    addlog($operation.'-'.$model->id);//写入日志
	            	return $this->success($operation,'admin/prize/index');
	            }
    		} else {
    			//非提交操作
    			$prizecate = $prizeCateModel->select();
    			$prizecates = $prizeCateModel->catelist($prizecate);
    			$this->assign('prizecates',$prizecates);
    			return $this->fetch();
    		}
    	}
    	
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('prize')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                addlog($id);//写入日志
                return $this->success('删除成功','admin/prize/index');
            }
    	}
    }


    // public function is_top()
    // {
    //     if($this->request->isPost()){
    //         $post = $this->request->post();
    //         if(false == Db::name('prize')->where('id',$post['id'])->update(['is_top'=>$post['is_top']])) {
    //             return $this->error('设置失败');
    //         } else {
    //             addlog($post['id']);//写入日志
    //             return $this->success('设置成功','admin/prize/index');
    //         }
    //     }
    // }
 
    
    public function status()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            if(false == Db::name('prize')->where('id',$post['id'])->update(['status'=>$post['status']])) {
                return $this->error('设置失败');
            } else {
                addlog($post['id']);//写入日志
                return $this->success('设置成功','admin/prize/index');
            }
        }
    }
    
    //显示奖品评论
    public function remark(){
        $model = new remarkModel();
        $remarks = $model->select();
        // var_dump($remarks);exit;
        $this->assign('remarks',$remarks);
        return $this->fetch();
    }

    //编辑奖品评论
    public function editremark(){
        //获取菜单id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $model = new remarkModel();

        if($id > 0) {
            //是修改操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['content', 'require', '评论内容不能为空']
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                //验证菜单是否存在
                $remark = $model->where('id',$id)->find();
                if(empty($remark)) {
                    return $this->error('id不正确');
                }

                //设置修改人
                // $post['edit_admin_id'] = Session::get('admin');
                $ret=$model->allowField(['content','update_time'])->save($post,['id'=>$id]);
                // echo $model->getLastSql();exit;
                if(false ==$ret ) {
                    return $this->error('修改失败');
                } else {
                    $operation='修改奖品评论成功';
                    addlog($operation.'-'.$model->id);//写入日志
                    return $this->success($operation,'admin/prize/remark');
                }
            } else {
                //非提交操作
                $remark = $model->where('id',$id)->find();

                if(!empty($remark)) {
                    $this->assign('remark',$remark);
                    return $this->fetch();
                } else {
                    return $this->error('id不正确');
                }
            }
        }
    
    }


    //删除奖品评论
    public function deleteremark(){
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('user_remark')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='删除奖品评论成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/prize/remark');
            }
        }
    }



}
