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
use app\admin\model\DrawLottery as drawLotteryModel;

class Drawlottery extends Permissions
{   
    private $drawLotteryModel;
    public function _initialize()
    {
        $this->drawLotteryModel=new drawLotteryModel();
    }
    public function index()
    {
        $list=$this->drawLotteryModel->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        $this->assign('list',$list);

        $draw_lottery=Db::name('webconfig')->value('draw_lottery');//只有一条记录，所以不需要where条件
        $this->assign('draw_lottery',$draw_lottery);

        if($this->request->isPost()){
            $post=$this->request->post();
            $draw_lottery=$post['draw_lottery'];

            $result=Db::name('webconfig')->where('id',101)->setField('draw_lottery',$draw_lottery);
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
                $drawlottery = $this->drawLotteryModel->where('id',$id)->find();
                if(empty($drawlottery)) {
                    return $this->error('id不正确');
                }
                
                $post['money']=!empty($post['money'])?$post['money']:0;
                

                if(false == $this->drawLotteryModel->allowField(true)->save($post,['id'=>$id])) {
                    return $this->error('修改失败');
                } else {
                    $operation='抽奖设置修改成功';
                    addlog($operation.'-'.$this->drawLotteryModel->id);//写入日志
                    return $this->success($operation,'admin/drawlottery/index');
                }
            } else {
                //非提交操作
                $drawlottery =$this->drawLotteryModel->where('id',$id)->find();
    
                if(!empty($drawlottery)) {
                    $this->assign('drawlottery',$drawlottery);
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
  
                $ret=$this->drawLotteryModel->allowField(true)->save($post);

                if(false ==$ret ) {
                    return $this->error('添加失败');
                } else {
                    $operation='抽奖设置添加成功';
                    addlog($operation.'-'.$this->drawLotteryModel->id);//写入日志  报错因为必须要在菜单添加动作
                    return $this->success($operation,'admin/drawlottery/index');
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
            if(false == Db::name('draw_lottery')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='抽奖设置删除成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/drawlottery/index');
            }
    	}
    }
}
