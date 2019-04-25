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

use think\Cache;
use think\Controller;
use think\Loader;
use think\Db;
use think\Cookie;
use think\Config;
use think\Url;
use think\Session;
use app\admin\controller\Permissions;
use app\admin\model\Game as gameModel;
class Game extends Permissions
{   
    private $model;
    private $prefix;
    private $game_area_type;
    public function _initialize()
    {
        parent::_initialize();
        $this->model  = new gameModel();
        $this->prefix = Config::get('database.prefix');
        $this->game_area_type=Config::get('game_area_type');
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
        
        $games = empty($where) ? $this->model->order('area_type asc,sort asc')->paginate(15) : $this->model->where($where)->order('area_type asc,sort asc')->paginate(15,false,['query'=>$this->request->param()]);
        $this->assign('games',$games);
        
        return $this->fetch();
    }



    //新增、修改游戏
    public function publish()
    {
        //获取菜单id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $this->assign('game_area_type',$this->game_area_type);
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
                    'code'   => 'require'
                ];

                $msg = [
                    'name.require' => '游戏名称必须填写',
                    'name.max' => '游戏名称不能超过60个字符',
                    'code.require'   => '编码不能为空'

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

                $post['onoff']= empty($post['onoff'])?0:1;
                // $post['sort']= empty($post['sort'])?0:$post['s'];
                
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
                    'code' =>'require'
                ];

                $msg = [
                    'name.require' => '游戏名称必须填写',
                    'name.max' => '游戏名称不能超过30个字符',
                    'code.require' =>'编码不能为空'
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
    public function onoff()
    {
        if($this->request->isPost()){
            $post = $this->request->post();

            $result=$this->model->where('id',$post['id'])->update(['onoff'=>$post['onoff']]);
            
            if(false ==$result ) {
                return $this->error('设置失败');
            } else {
                $operation='设置成功';
                // addlog($operation.'-'.$post['id']);//写入日志
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
                
                $exp_count=sizeof($post['min_exp_from']);
                for($i=1;$i<=$exp_count;$i++){
                    $reward_exp[$i]['min_exp_from']=!empty($post['min_exp_from'][$i])?$post['min_exp_from'][$i]:'';
                    $reward_exp[$i]['max_exp_to']=!empty($post['max_exp_to'][$i])?$post['max_exp_to'][$i]:'';
                    $reward_exp[$i]['seq_reward_exp']=!empty($post['seq_reward_exp'][$i])?$post['seq_reward_exp'][$i]:'';
                }
                $post['reward_exp']=json_encode($reward_exp);

                $points_count=sizeof($post['min_points_from']);
                for($j=0;$j<=$points_count;$j++){
                    $reward_points[$j]['min_points_from']=!empty($post['min_points_from'][$j])?$post['min_points_from'][$j]:'';
                    $reward_points[$j]['max_points_to']=!empty($post['max_points_to'][$j])?$post['max_points_to'][$j]:'';
                    $reward_points[$j]['seq_reward_points']=!empty($post['seq_reward_points'][$j])?$post['seq_reward_points'][$j]:'';
                }

                $post['reward_points']=json_encode($reward_points);
                // $post['max_exp_from']
                // $post['seq_reward_exp']

                // $post['min_points_from']
                // $post['max_points_from']
                // $post['seq_reward_points']


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
                    $reward_exp=json_decode($game['reward_exp'],true);
                    $reward_points=json_decode($game['reward_points'],true);
                    $this->assign('reward_exp',$reward_exp);
                    $this->assign('reward_points',$reward_points);

                    return $this->fetch();
                } else {
                    return $this->error('id不正确');
                }
            }
        }
    }
    
    //判断表是否存在
    public function istable(){
        $post = $this->request->param();
        
        $table='';
        if (!empty($post['code'])) {
            $table='game_'.$post['code'];
            // $this->assign('code',$post['code']);
        }
        
        if(!empty($post['name'])){
            $this->assign('gamename',$post['name']);
        }
        
        $table=$this->prefix.$table;
        $exist = $this->model->query("show tables like '{$table}'");
       
        if (false==$exist) {
            return $this->error('表不存在');
        }else {
            $url=Url::build('admin/game/manage',['code'=>$post['code'],'name'=>$post['name']]);
            return $this->success('',$url);
        }
    }

    //游戏管理
    public function manage()
    {
       $post = $this->request->param();
        
        if (!empty($post['code'])) {
            $table='game_'.$post['code'];
            $this->assign('code',$post['code']);
        }
        
       

        if(!empty($post['name'])){
            $this->assign('gamename',$post['name']);
        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $begin_time = strtotime($post['create_time']);
            $end_time = $begin_time + 24*60*60;
            $where['create_time'] = [['>=',$begin_time],['<=',$end_time]];
        }

        if(!empty($post['lot_num'])){
            $where['lot_num'] = $post['lot_num'];
        }

        
        $lotterys = empty($where) ? Db::name($table)->order('create_time desc')->paginate(15) : Db::name($table)->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
        // $lotterys = Db::name($table)->order('create_time desc')->paginate(15) ;
        // echo $model->getLastSql();
        // var_dump(collection($userlogs)->toArray());exit;
        $this->assign('lotterys',$lotterys);

        return $this->fetch();
    }
    
    //创建游戏表
    public function createtable(){
        
        $codes=$this->model->column('code');
        // $code='js22';
        foreach($codes as $code){
            $table=$this->prefix.'game_'.$code;
            $exist = $this->model->query("show tables like '{$table}'");
           
            if (false==$exist) {
                $sql="CREATE TABLE `{$table}` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  -- `lot_num` int(11) DEFAULT NULL COMMENT '期号',
                  `open_time` int(11) DEFAULT NULL COMMENT '开奖时间',
                  `desc`  varchar(200) DEFAULT NULL COMMENT '开奖描述',
                  `result` varchar(50) DEFAULT NULL COMMENT '开奖结果',
                  `create_time` int(11) DEFAULT NULL,
                  `update_time` int(11) DEFAULT NULL,
                  PRIMARY KEY (`id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

                $this->model->query($sql);

                echo $code;
            }else{
                $sql="alter table {$table} add column `number` varchar(30) default '' after `id`"; //json保存
                // $sql="alter table {$table} add column `status` tinyint(1)   COMMENT  '1：未开奖的，2：已开奖的'"; //json保存
                // $sql="alter table {$table} add column `odd` varchar(300)   COMMENT  '开奖赔率'"; //json保存
                $this->model->query($sql);
            }
        }

    }

}
