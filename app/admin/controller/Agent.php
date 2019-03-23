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
use app\admin\model\Agent as agentModel;
use app\user\model\User as userModel;
use app\admin\model\AgentCate as agentcateModel;
use app\admin\model\AgentLog as agentlogModel;
class Agent extends Permissions
{   
    private $model;
    private $agentcatemodel;
    private $agent_log_types;
    private $usermodel;
    private $agentlog;

    public function _initialize()
    {
        $this->model=new agentModel();
        $this->agentcatemodel=new agentcateModel();
        $this->usermodel=new userModel();
        $this->agentlogmodel=new agentlogModel();
        $this->agent_log_types=Config::get('agent_log_type');
    }
    public function index()
    {
        $post = $this->request->param();
        if($this->request->isPost()) {
            if (isset($post['agent_id']) and $post['agent_id'] > 0) {
                $where['a.id'] = $post['agent_id'];
                $this->assign('agent_id',$post['agent_id']);
            }
        

            if (isset($post['agent_log_type']) and $post['agent_log_type'] > 0) {
                $where['l.type'] = $post['agent_log_type'];
                $this->assign('agent_log_type',$post['agent_log_type']);
            }

        }

        $agents_sel=collection($this->model->select())->toArray();
        
        // $agents = empty($where) ? $this->model->order('create_time desc')->paginate(15) : $this->model->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
        $agents=empty($where)?Db::name('agent')->alias('a')->field('a.*')->join('agent_log l',' a.id=l.agent_id','left')->order('a.create_time desc')->paginate(15):Db::name('agent')->alias('a')->join('agent_log l',' a.id=l.agent_id','left')->where($where)->order('a.create_time desc')->paginate(15);
        // echo Db::name('agent')->getLastSql();
        $this->assign('agents_sel',$agents_sel);
        $this->assign('agents',$agents);
        // $cates_= $this->agentcatemodel->select();
        // $cates=collection($cates_)->toArray();

        // $this->assign('cates',$cates);
        $this->assign('agent_log_types',$this->agent_log_types);
        return $this->fetch();
    }




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
                    'password'  => 'max:20',
                    'name'   => 'require|max:30',
                ];

                $msg = [
                    'password.require' => '密码不能超过20位',
                    'name.require' => '代理名称必须填写',
                    'name.max' => '代理名称不能超过30个字符'
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

                $post['is_freeze']= empty($post['is_freeze'])?0:1;
                $post['is_show']= empty($post['is_show'])?0:1;
                //修改对应的用户密码
                if($post['user_id']){
                    $data['password']=$post['password'];
                    $this->usermodel->allowField(['password'])->save($data, ['uid' => $post['user_id']]);
                }
                //更改代理信息
                $ret=$this->model->allowField(true)->save($post,['id'=>$id]);
                // echo $this->model->getLastSql();exit;
                if(false ==$ret ) {
                    return $this->error('修改失败');
                } else {
                    $operation='修改代理成功';
                    addlog($operation.'-'.$id);//写入日志
                    return $this->success($operation,'admin/agent/index');
                }
            } else {
                //非提交操作
                $agent = $this->model->where('id',$id)->find();
                $cates = $this->agentcatemodel->select();
                $this->assign('cates',$cates);
                if(!empty($agent)) {
                    $this->assign('agent',$agent);
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
                    'password'  => 'max:20',
                    'name'   => 'require|max:30',
                ];

                $msg = [
                    'password.require' => '密码不能超过20位',
                    'name.require' => '代理名称必须填写',
                    'name.max' => '代理名称不能超过30个字符'
                ];
                $validate = new \think\Validate($rule,$msg);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                

                // $post['is_vip']= empty($post['is_vip'])?0:1;
                // $post['is_proxy']= empty($post['is_proxy'])?0:1;
                if(false == $this->model->allowField(true)->save($post)) {
                    return $this->error('添加失败');
                } else {
                    $operation='添加代理成功';
                    addlog($operation.'-'.$this->model->id);//写入日志
                    return $this->success($operation,'admin/agent/index');
                }
            } else {
                $cates_= $this->agentcatemodel->select();
                $cates=collection($cates_)->toArray();

                $this->assign('cates',$cates);
                return $this->fetch();
            }
        }
        
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            $map['agent_id']=$id;
            // $logs=Db::name('agent_log')->where($map)->find();
            // echo json_encode($logs);exit;
            $logs=$this->agentlogmodel->where($map)->find();
            // echo $this->agentcatemodel->getLastSql();exit;
            // echo $logs['id'];exit;
            if(!empty($logs['id'])){
               return $this->error('代理已经有日志，删除失败');
            }
           
            $ret=$this->model->where('id',$id)->delete();
            // echo $this->model->getLastSql();exit;
            if(false == $ret) {
                return $this->error('删除代理失败');
            } else {
                $operation='删除代理成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/agent/index');
            }
    	}
    }

}
