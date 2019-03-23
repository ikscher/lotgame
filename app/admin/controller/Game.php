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
use think\Config;
use \think\Session;
use app\admin\controller\Permissions;
use app\admin\model\Game as gameModel;
class Game extends Permissions
{   
    private $model;

    public function _initialize()
    {
        $this->model=new gameModel();
        // $this->agentcatemodel=new agentcateModel();
        // $this->usermodel=new userModel();
        // $this->agentlogmodel=new agentlogModel();
        // $this->agent_log_types=Config::get('agent_log_type');
    }
    public function index()
    {
        $post = $this->request->param();
        if($this->request->isPost()) {
            if (isset($post['keywords']) and !empty($post['keywords'])) {
                $where['name'] = ['like', '%' . $post['keywords'] . '%'];
                $this->assign('keywords',$post['keywords']);
            }
        }
        
        $games = empty($where) ? $this->model->order('create_time desc')->paginate(15) : $this->model->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
        $this->assign('games',$games);
        
        return $this->fetch();
    }



    //新增、修改游戏
    public function publish()
    {
        //获取菜单id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        // $model = new cardcateModel();
        //是正常添加操作
        if($id > 0) {
            //是修改操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $rule = [
                    'name'   => 'require|max:30',
                ];

                $msg = [
                    'name.require' => '游戏名称必须填写',
                    'name.max' => '游戏名称不能超过30个字符'
                ];
                $validate = new \think\Validate($rule,$msg);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
             
                //验证菜单是否存在
                $agent = $this->model->where('id',$id)->find();
                if(empty($agent)) {
                    return $this->error('id不正确');
                }

                $post['onff']= empty($post['onff'])?0:1;
                
                $ret=$this->model->allowField(true)->save($post,['id'=>$id]);
                // echo $this->model->getLastSql();exit;
                if(false ==$ret ) {
                    return $this->error('修改失败');
                } else {
                    $operation='修改游戏成功';
                    addlog($operation.'-'.$id);//写入日志
                    return $this->success($operation,'admin/game/index');
                }
            } else {
                //非提交操作
                $game = $this->model->where('id',$id)->find();

                if(!empty($game)) {
                    $this->assign('game',$game);
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

                $rule = [
                    'name'   => 'require|max:30',
                ];

                $msg = [
                    'name.require' => '游戏名称必须填写',
                    'name.max' => '游戏名称不能超过30个字符'
                ];
                $validate = new \think\Validate($rule,$msg);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                

                // $post['is_vip']= empty($post['is_vip'])?0:1;
                // $post['is_proxy']= empty($post['is_proxy'])?0:1;
                $ret=$this->model->allowField(true)->save($post);
                // echo $this->model->getLastSql();exit;
                if(false ==$ret ) {
                    return $this->error('添加失败');
                } else {
                    $operation='添加游戏成功';
                    addlog($operation.'-'.$this->model->id);//写入日志
                    return $this->success($operation,'admin/game/index');
                }
            } else {
                
                return $this->fetch();
            }
        }
        
    }

    //删除游戏
    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

            $ret=$this->model->where('id',$id)->delete();
            // echo $this->model->getLastSql();exit;
            if(false == $ret) {
                return $this->error('删除游戏失败');
            } else {
                $operation='删除游戏成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/game/index');
            }
    	}
    }

    //游戏开关
    public function onff()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            if(false == $this->model->where('id',$post['id'])->update(['onff'=>$post['onff']])) {
                return $this->error('设置失败');
            } else {
                $operation='设置成功';
                addlog($operation.'-'.$post['id']);//写入日志
                return $this->success($operation,'admin/game/index');
            }
        }
    }
    
    //游戏配置
    public function setup()
    {
       //获取菜单id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        if($id > 0) {

            //是修改操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();

                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $rule = [
                    'draw_ratio'   => 'number',
                    'forbid'   => 'number',
                    'min_bid'   => 'number',
                    'max_bid'   => 'number'
                ];

                $msg = [
                    'draw_ratio.require' => '抽水比例必须为数字',
                    'forbit.require' => '抽水比例必须为数字',
                    'min_bid.require' => '抽水比例必须为数字',
                    'max_bid.require' => '抽水比例必须为数字'
                ];
                $validate = new \think\Validate($rule,$msg);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                //验证菜单是否存在
                $game = $this->model->where('id',$id)->find();
                if(empty($game)) {
                    return $this->error('id不正确');
                }
                
                //设置修改人
                // $post['edit_admin_id'] = Session::get('admin');
                $ret=$this->model->allowField(true)->save($post,['id'=>$id]);
                // echo $this->model->getLastSql();exit;
                if(false ==$ret ) {
                    return $this->error('修改失败');
                } else {
                    $operation='配置游戏成功';
                    addlog($operation.'-'.$this->model->id);//写入日志
                    return $this->success($operation,'admin/game/index');
                }
            } else {
                //非提交操作
                $game = $this->model->where('id',$id)->find();

                if(!empty($game)) {
                    $this->assign('game',$game);
                    return $this->fetch();
                } else {
                    return $this->error('id不正确');
                }
            }
        }
    }

    //游戏管理
    public function manage()
    {

    }

}
