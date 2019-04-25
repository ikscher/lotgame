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
use app\admin\model\SmashEgg as smashEggModel;

class Smashegg extends Permissions
{   
    private $smashEggModel;
    public function _initialize()
    {   
        parent::_initialize();
        $this->smashEggModel=new smashEggModel();
    }
    public function index()
    {
        $list=$this->smashEggModel->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        $this->assign('list',$list);

        $smashegg_integral=Db::name('webconfig')->value('smashegg_integral');//只有一条记录，所以不需要where条件
        $this->assign('smashegg_integral',$smashegg_integral);

        if($this->request->isPost()){
            $post=$this->request->post();
            $smashegg_integral=$post['smashegg_integral'];

            $result=Db::name('webconfig')->where('id',101)->setField('smashegg_integral',$smashegg_integral);
            if($result==false){
                $this->error('保存失败！');
            }else{
                $this->success('保存成功','');
            }
        }
 
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
                    ['name', 'require', '奖品不能为空'],
                    ['money', 'require', '金币不能为空'],
                    ['odd', 'require', '概率不能为空'],
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                //验证菜单是否存在
                $smashegg = $this->smashEggModel->where('id',$id)->find();
                if(empty($smashegg)) {
                    return $this->error('id不正确');
                }
                
                $post['money']=!empty($post['money'])?$post['money']:0;
                

                if(false == $this->smashEggModel->allowField(true)->save($post,['id'=>$id])) {
                    return $this->error('修改失败');
                } else {
                    $operation='砸蛋设置修改成功';
                    addlog($operation.'-'.$this->smashEggModel->id);//写入日志
                    return $this->success($operation,'admin/smashegg/index');
                }
            } else {
                //非提交操作
                $smashegg =$this->smashEggModel->where('id',$id)->find();
    
                if(!empty($smashegg)) {
                    $this->assign('smashegg',$smashegg);
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
                    ['name', 'require', '奖品名称不能为空'],
                    ['money', 'require', '金币不能为空'],
                    ['odd', 'require', '概率不能为空']
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
  
                $ret=$this->smashEggModel->allowField(true)->save($post);

                if(false ==$ret ) {
                    return $this->error('添加失败');
                } else {
                    $operation='砸蛋设置添加成功';
                    addlog($operation.'-'.$this->smashEggModel->id);//写入日志  报错因为必须要在菜单添加动作
                    return $this->success($operation,'admin/smashegg/index');
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
            if(false == Db::name('smash_egg')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='砸蛋设置删除成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/smashegg/index');
            }
    	}
    }
}
