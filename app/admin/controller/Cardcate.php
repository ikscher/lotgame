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

// use \think\Cache;
use \think\Controller;
// use think\Loader;
use think\Db;
use think\Config;
// use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\admin\model\CardCate as cardcateModel;
class Cardcate extends Permissions
{   
    private $card_random_bits=array();
    private $card_random_type=array();
    private $model;
    public function _initialize(){
        $this->card_random_bits=Config::get('card_random_bits');
        $this->card_random_type=Config::get('card_random_type');
        // var_dump($this->card_random_bits);
        $this->model = new cardcateModel();
    }
    public function index()
    {
        $cardcates = $this->model->select();
        $this->assign('cardcates',$cardcates);
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
                    'name'  => 'require',
                    'header'   => 'require',
                    'price' => 'number|require',
                    'coin'  => 'number|require',
                    'valid_time'  => 'number|require'
                ];

                $msg = [
                    'name.require' => '卡名称必须填写',
                    'header.require' => '卡头必须填写',
                    'price.require' => '充值价格必须填写',
                    'price.number'   => '充值价格必须是数字',
                    'coin.number'   => '金币必须是数字',
                    'coin.require'  => '金币必须填写',
                    'valid_time.require'  => '领取时长必须填写',
                    'valid_time.number'  => '领取时长必须是数字'
                ];
                $validate = new \think\Validate($rule,$msg);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
	            //验证菜单是否存在
	            $cardcate = $this->model->where('id',$id)->find();
	            if(empty($cardcate)) {
	            	return $this->error('id不正确');
	            }
                $post['is_vip']= empty($post['is_vip'])?0:1;
                $post['is_agent']= empty($post['is_agent'])?0:1;
	            if(false == $this->model->allowField(true)->save($post,['id'=>$id])) {
	            	return $this->error('修改失败');
	            } else {
                    $operation='修改卡类成功';
                    addlog($operation.'-'.$id);//写入日志
	            	return $this->success($operation,'admin/cardcate/index');
	            }
    		} else {
    			//非提交操作
                $this->assign('card_random_bits',$this->card_random_bits);
                $this->assign('card_random_type',$this->card_random_type);
    			$cardcate = $this->model->where('id',$id)->find();
    			$this->assign('cardcate',$cardcate);
    			if(!empty($cardcate)) {
    				$this->assign('cardcate',$cardcate);
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
                    'name'  => 'require',
                    'header'   => 'require',
                    'price' => 'number|require',
                    'coin'  => 'number|require',
                    'valid_time'  => 'number|require'
                ];

                $msg = [
                    'name.require' => '卡名称必须填写',
                    'header.require' => '卡头必须填写',
                    'price.require' => '充值价格必须填写',
                    'price.number'   => '充值价格必须是数字',
                    'coin.number'   => '金币必须是数字',
                    'coin.require'  => '金币必须填写',
                    'valid_time.require'  => '领取时长必须填写',
                    'valid_time.number'  => '领取时长必须是数字'
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
                    $operation='添加卡类成功';
                    addlog($operation.'-'.$this->model->id);//写入日志
	            	return $this->success($operation,'admin/cardcate/index');
	            }
    		} else {
                $this->assign('card_random_bits',$this->card_random_bits);
                $this->assign('card_random_type',$this->card_random_type);
    			return $this->fetch();
    		}
    	}
    	
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        
            if(false == $this->model->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='删除卡类成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/cardcate/index');
            }
            
    	}
    }
}
