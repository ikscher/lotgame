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
use think\Config;
use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\admin\model\CardPwd as cardpwdModel;
use app\admin\model\CardCate as cardcateModel;
class Cardpwd extends Permissions
{   
    private $model;
    private $catemodel;
    private $card_status;
    public function _initialize()
    {
        $this->model=new cardpwdModel();
        $this->catemodel=new cardcateModel();
        $this->card_status=Config::get('card_status');
    }
    public function index()
    {
        $post = $this->request->param();
        if($this->request->isPost()) {
            if (isset($post['keywords']) and !empty($post['keywords'])) {
                $where['card_no|card_pwd'] = ['like', '%' . $post['keywords'] . '%'];
                $this->assign('keywords',$post['keywords']);
            }
        }
        if($this->request->isGet()) {
            if (isset($post['card_cate_id']) and $post['card_cate_id'] > 0) {
                $where['card_cate_id'] = $post['card_cate_id'];
                $this->assign('card_cate_id',$post['card_cate_id']);
            }
    
            if (isset($post['status']) and $post['status'] > 0) {
                $where['status'] = $post['status'];
                // $this->assign('status',$post['status']);
            }
        }
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
        
        // echo $this->model->getLastSql();
       
        // $arc=collection($articles->toArray());var_dump($arc['data']);exit;
        //$articles = $article->toArray();
        
        $this->assign('cardpwds',$cardpwds);
        $cates_= $this->catemodel->select();
        $cates=collection($cates_)->toArray();
        $this->assign('cates',$cates);
        $this->assign('card_status',$this->card_status);
        // $info['admin'] = Db::name('admin')->select();
        // $this->assign('info',$info);
        return $this->fetch();
    }
    public function publish()
    {
        //是新增操作
        if($this->request->isPost()) {
            //是提交操作
            $post = $this->request->post();
            //验证  唯一规则： 表名，字段名，排除主键值，主键名
            $rules=[
                'num'=>'require|between:1,30|number',
            ];
            $validate = new \think\Validate($rules);
            //验证部分数据合法性
            if (!$validate->check($post)) {
                $this->error('提交失败：' . $validate->getError());
            }
            
            $card_cate_id=$post['card_cate_id'];
            if(empty($card_cate_id)){
                return $this->error('ID错误！');
            }
            $card=$this->catemodel->where('id',$card_cate_id)->find();
            
            // echo $card['random_bits'];exit;
            
            $list=array();
            for($i=0;$i<$post['num'];$i++){
                $card_no=str_rand($card['random_bits'],$card['random_type']);
                $card_pwd=str_rand($card['random_bits'],$card['random_type']);
                $list[$i]['card_no']=$card['header'].$card_no;
                $list[$i]['card_pwd']=$card_pwd;
                $list[$i]['card_cate_id']=$card_cate_id;
            }
            
            
            // echo $card_no.'and'.$card_pwd;exit;
            // echo json_encode($post);exit;
            if(false == $this->model->allowField(true)->saveAll($list)) {
                return $this->error('添加失败');
            } else {
                $operation='成功生成卡密';
                addlog($operation);//写入日志
                return $this->success($operation,'admin/cardpwd/index');
            }
        } else {
            //非提交操作
            $cates = $this->catemodel->select();
            // $cates = $this->cateModel->catelist($cate);
            $this->assign('cates',$cates);
            return $this->fetch();
        }
        
    }
    public function delete()
    {
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == $this->model->where('id',$id)->delete()) {
                return $this->error('删除卡密失败');
            } else {
                addlog($id);//写入日志
                return $this->success('删除卡密成功','admin/cardpwd/index');
            }
        }
    }
}
