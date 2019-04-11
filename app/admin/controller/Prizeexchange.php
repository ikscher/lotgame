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
use think\Config;
use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\front\model\User as userModel;
use app\admin\model\Prize as prizeModel;
use app\admin\model\CardPwd as cardPwdModel;
use app\front\model\UserExchange as userExchangeModel;
use app\front\model\UserMsg as userMsgModel;
class Prizeexchange extends Permissions
{   
    private $prizeModel;
    private $cardPwdModel;
    private $userMsgModel;
    private $userExchangeModel;
    private $userModel;
    private $site_name;
    public function _initialize()
    {  
        $this->prizeModel=new prizeModel();
        $this->cardPwdModel=new cardPwdModel();
        $this->userMsgModel=new userMsgModel();
        $this->userExchangeModel=new userExchangeModel();
        $this->userModel= new userModel();
        $this->site_name=Config::get('site_name');
    }
    public function index()
    {
        // $model = new exchangeModel();
        $where=array();
        if($this->request->isPost()){
            $post = $this->request->param();

            if (empty($post['keywords_u']) && empty($post['keywords_p']) && !isset($post['status']) && empty($post['create_time'])){
                $exchanges=Db::name('user_exchange')->alias('a')->join('prize p','a.prize_id=p.id')->join('user u','a.user_id=u.uid')->field('a.*,u.username,u.email,p.name')->order('a.create_time desc')->paginate(10);
            }else{
                if (isset($post['keywords_u']) and !empty($post['keywords_u'])) {
                    $where['u.username'] = ['like', '%' . $post['keywords_u'] . '%'];
                }
                
                if (isset($post['keywords_p']) and !empty($post['keywords_p'])) {
                    $where['p.name'] = ['like', '%' . $post['keywords_p'] . '%'];
                }

                
                if (isset($post['status']) && ($post['status'] == '1' || $post['status'] === '0'  || $post['status']=='2' )) {
                    $where['a.status'] = $post['status'];
                }
         
                if(isset($post['create_time']) and !empty($post['create_time'])) {
                    $min_time = strtotime($post['create_time']);
                    $max_time = $min_time + 24 * 60 * 60;
                    $where['a.create_time'] = [['>=',$min_time],['<=',$max_time]];
                }

                $this->assign('post',$post);

                $exchanges=Db::name('user_exchange')->alias('a')->join('prize p','a.prize_id=p.id')->join('user u','a.user_id=u.uid')->where($where)->field('a.*,u.username,u.email,p.name')->order('a.create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
                // echo Db::name('user_exchange')->getLastSql();exit;
             }
        }else{
            $exchanges=Db::name('user_exchange')->alias('a')->join('prize p','a.prize_id=p.id')->join('user u','a.user_id=u.uid')->field('a.*,u.username,u.email,p.name')->order('a.create_time desc')->paginate(10);
        }  
        // $exchanges = empty($where) ? $model->order('create_time desc')->paginate(20) : $model->where($where)->order('create_time desc')->paginate(20,false,['query'=>$this->request->param()]);
        $page=$exchanges->render();
   
        $this->assign('exchanges',$exchanges);
        $this->assign('page',$page);

        return $this->fetch();
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('user_exchange')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                addlog('删除奖品兑换记录-'.$id);//写入日志
                return $this->success('删除成功','admin/prizeexchange/index');
            }
    	}
    }


 
    
    public function status()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            $result_trans=true;
            $status=$post['status'];

            if($status==2){//审核通过

                $prize=$this->prizeModel->where('id',$post['prize_id'])->find();
                 // $prize=$this->prizeModel->where('id',$post['prize_id'])->find();
                $card_cate_id=$prize['card_cate_id'];//卡类型ID
          
                //查看对应的卡密数量是否足够
                $map=array();
                $map['card_cate_id']=$card_cate_id;
                $map['status']=1;
                $cn=$this->cardPwdModel->where($map)->count();
                
                // $card_no=$cardpwd['card_no'];
                // $card_pwd=$cardpwd['card_pwd'];

                if($cn<$post['num']){
                    return $this->error('充值卡密数量不足，请联生成卡密！');
                }

                Db::startTrans();
                try{
                    //取出对应数量的兑换卡密
                    $map=array();
                    $cardpwd=array();
                    $card_pwd=array();
                    $map['card_cate_id']=$card_cate_id;
                    $map['status']=1;
                    $num=$post['num'];
                    $cardpwd=collection($this->cardPwdModel->where($map)->limit($num)->select())->toArray();

                    $strcardpwd='';
                    $comma='<br/>';
                    foreach($cardpwd as $k=>$v){
                        $card_pwd[$k]['card_no']=$v['card_no'];
                        $card_pwd[$k]['card_pwd']=$v['card_pwd'];
                        
                        $strcardpwd.=$v['card_no'].' '.$v['card_pwd'];
                        $strcardpwd.=$comma;

                        //更改卡密的状态为已兑出（未回收）
                        $map=array();
                        $map['card_no']=$v['card_no'];
                        $map['card_pwd']=$v['card_pwd'];
                        $this->cardPwdModel->where($map)->update(['status'=>2,'user_id'=>$post['uid'],'use_time'=>time()]);
                    }
                    //设置兑奖对应的卡密
                    $id=$post['id'];
                    $card_json=json_encode($card_pwd);
                    $this->userExchangeModel->where('id',$id)->update(['card'=>$card_json,'update_time'=>time()]);

                    
                    //发站内信
                    $data=array();
                    $prize_name=$prize['name']; //奖品名称
                    $data['send_uid']=1; //ID=1代表的是管理员（官方后台）
                    $data['user_id']=$post['uid'];
                    $data['type']=3; //单独用户
                    $data['create_time']=time();
                    $data['title']='兑奖发货通知';
                    $data['content']='内容：您兑换的奖品'.$prize_name.'已经发货，谢谢您对我们的支持。<br/>'.$strcardpwd;
                    $ret3=$this->userMsgModel->insert($data);

                    //发邮件
                    $ret4=SendMail($this->user['email'],$this->site_name."邮件",'内容：您兑换的奖品'.$prize_name.'已经发货，谢谢您对我们的支持。<br/>'.$strcardpwd);
                    //==============================end=========================
                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    $result_trans=false;
                    // 回滚事务
                    Db::rollback();
                    
                }

                if($result_trans){
                    addlog("审核用户{$post['uid']}兑换的奖品");//写入日志
                    return $this->success('奖品审核成功！','admin/prizeexchange/index');
                }else{
                    return $this->error('兑换奖品审核失败！');
                }
            }elseif($status==3){//拒绝
                $aggregate=$post['aggregate'];
                $uid=$post['uid'];
                $prize=$this->prizeModel->where('id',$post['prize_id'])->find();
                
                Db::startTrans();
                try{
                    //返还用户的金币
                    $this->userModel->where('uid',$uid)->setInc('coin',$aggregate);
                    //更改状态
                    $id=$post['id'];
                    $this->UserExchange->where('id',$id)->update(['status'=>3]);

                    //发站内信
                    $data=array();
                    $prize_name=$prize['name']; //奖品名称
                    $data['send_uid']=1; //ID=1代表的是管理员（官方后台）
                    $data['user_id']=$uid;
                    $data['type']=3; //单独用户
                    $data['create_time']=time();
                    $data['title']='兑奖缺货通知';
                    $data['content']='内容：您兑换的奖品'.$prize_name.'缺货，谢谢您对我们的支持。<br/>';
                    $ret3=$this->userMsgModel->insert($data);

                    //发邮件
                    // $ret4=SendMail($this->user['email'],$this->site_name."邮件",'内容：您兑换的奖品'.$prize_name.'缺货，谢谢您对我们的支持。<br/>');
                    //==============================end=========================
                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    $result_trans=false;
                    // 回滚事务
                    Db::rollback();
                    
                }

                if($result_trans){
                    addlog("拒绝用户{$post['uid']}兑换的奖品");//写入日志
                    return $this->success('奖品拒绝成功！','admin/prizeexchange/index');
                }else{
                    return $this->error('兑换奖品拒绝失败！');
                }

            }
            
        }
    }
    

}
