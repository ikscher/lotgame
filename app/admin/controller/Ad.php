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
use app\admin\model\Ad as adModel;

class Ad extends Permissions
{   
    private $adModel;
    public function _initialize()
    {
        parent::_initialize();
        $this->adModel=new adModel();
    }
    public function index()
    {
        $list=$this->adModel->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        $this->assign('list',$list);
 
        return $this->fetch();
    }


    public function publish()
    {
    	//获取菜单id
    	$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        
        //是正常添加操作
        if($id > 0) {
            //是修改操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['title', 'require', '标题不能为空'],
                    // ['content', 'require', '内容不能为空'],
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                //验证菜单是否存在
                $ad = $this->adModel->where('id',$id)->find();
                if(empty($ad)) {
                    return $this->error('id不正确');
                }

                
                if(!empty($post['thumb'])){
                    $thumb_arr=array_filter($post['thumb']);

                    $post['content']=implode(',', $thumb_arr);
                }else{
                    $post['content']='';
                }


                if(false == $this->adModel->allowField(true)->save($post,['id'=>$id])) {
                    return $this->error('修改失败');
                } else {
                    $operation='广告修改成功';
                    addlog($operation.'-'.$this->adModel->id);//写入日志
                    return $this->success($operation,'admin/ad/index');
                }
            } else {
                //非提交操作
                $ad =$this->adModel->where('id',$id)->find();
    
                if(!empty($ad)) {
                    $image_ids_arr=array();
                    if(!empty($ad['content'])) $image_ids_arr=explode(',',$ad['content']);
                    $this->assign('image_ids_arr',$image_ids_arr);//[1,2,3]
                    // $this->assign('image_ids',$ad['content']);//1,2,3
                   
                    $this->assign('ad',$ad);
                    if ( $ad['ad_type'] == 1 ){
                        return $this->fetch( "editimg" );
                    }else{
                        return $this->fetch();
                    }
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
                    // ['content', 'require', '内容不能为空'],
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
  
                $ret=$this->adModel->allowField(true)->save($post);

                if(false ==$ret ) {
                    return $this->error('添加失败');
                } else {
                    $operation='添加广告成功';
                    addlog($operation.'-'.$this->adModel->id);//写入日志  报错因为必须要在菜单添加动作
                    return $this->success($operation,'admin/ad/index');
                }
            } else {
                //非提交操作

                return $this->fetch();
            }
        }
    	
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('ad')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='广告删除成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/ad/index');
            }
    	}
    }

    
    public function deleteimg()
    {
        if($this->request->isPost()){
            $post = $this->request->post();

            $filepath=Db::name('attachment')->where('id',$post['imgid'])->value('filepath');
           
            $ret=Db::name('attachment')->where('id',$post['imgid'])->delete();
            if(false ==$ret ) {
                return $this->error('删除图片失败');
            } else {
                // $operation='公告置顶设置成功';
                // addlog($operation.'-'.$post['id']);//写入日志
                unlink(SITE_PATH.$filepath);
                
                return $this->success('请点击立即提交确定彻底删除','');
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
