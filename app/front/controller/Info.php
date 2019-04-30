<?php
/*
开奖结果比兑用户投注,根据开奖赔率赔付用户及设置相关中奖信息
*/
namespace app\front\controller;
use think\Controller;
use think\Config;
use think\Session;
use think\Db;
use app\admin\model\Game as gameModel;
use app\front\model\UserBid as userBidModel;
use app\front\model\User as userModel;

class Info extends Controller
{   
	private $userBidModel;
	private $userModel;
    public function _initialize()
    {
    	$this->userBidModel=new userBidModel();
    	$this->userModel=new userModel();
    }
    public function check()
    {   
    	//幸运百家乐
    	$code= $this->request->has('code') ? $this->request->param('code'):'';
    	switch($code){
    		case 'xybjl':

	    	    $id=Db::name('game_xybjl')->where('period','thisTimes')->value('id');
	    	    $prior_id=$id-1;
	    	    //设置赔率
	    	    $x=array();
	    	    $x['f1']=number_format(2.23+rand(50,99)/10000,4,'.','');  //<2.24;
	    	    $x['f2']=number_format(2.17+rand(50,99)/10000,4,'.',''); //<2.18;
	    	    $x['f3']=number_format(10.45+rand(200,450)/10000,4,'.','');; //<10.50;
	    	    Db::name('game_xybjl')->where('id',$prior_id)->setField('bidrate',json_encode($x));
	    	    $row=Db::name('game_xybjl')->where('id',$prior_id)->find();
	            $result=$row['result'];
	    	    $num=$result=='PLAYER'?2:(($result=='BANKER')?1:3);

	    	    
	            
	            $map['game_number']=$row['id'];//期号
	            $map['game_id']=1;//幸运百家乐的ID
	            $data=collection($this->userBidModel->where($map)->select())->toArray();//所有投注此游戏的用户数据
	            

	            foreach($data as $v){
	            	$prizeinfo=array();
	                $bidinfo=json_decode($v['bidinfo'],true);
	                $gid=$v['game_id'];
	                $oid=$v['game_number'];
	                $uid=$v['user_id'];
	                foreach($bidinfo as $k=>$w){
	                    if('f'.$num==$k){
	                    	// $z=array_values($w);
	                    	$win_coin=floor($w*$x['f'.$num]);

	                    	$this->userModel->where('uid',$uid)->setInc('coin',$win_coin);
	                    	$game=get_game($gid);
	                    	$coin=$this->userModel->where('uid',$uid)->value('coin');
	                    	adduserlog($uid,$game['name'].'第'.$oid.'期,中奖'.$win_coin.'金币',$win_coin,0,$coin,'hit');//hit类型:游戏中奖
	                    	// $k=$k==1?'庄':($k==2?'闲':'和');
	                    	$prizeinfo[$k]=$win_coin;
                            //添加中奖人数
	                    	Db::name('game_xybjl')->where('id',$prior_id)->setInc('win_num',1);
	                    }else{
	                    	// $k=$k==1?'庄':($k==2?'闲':'和');
	                    	$prizeinfo[$k]=0;
	                    }

	                }
	                $bid=$v['id'];
	                $this->userBidModel->where('id',$bid)->setField('prizeinfo',json_encode($prizeinfo));
	            }
	            break;
	        case 'xy10':
                $id=Db::name('game_xy10')->where('period','thisTimes')->value('id');
	    	    $prior_id=$id-1;
	    	    //设置赔率
	    	    $x=array();
	    	    $y=array(9.9791,9.9804,9.9800,9.9812,9.9789);
	    	    $x['f1']=$y[array_rand($y,1)];
	    	    $x['f2']=$y[array_rand($y,1)];
	    	    $x['f3']=$y[array_rand($y,1)];
	    	    $x['f4']=$y[array_rand($y,1)];
	    	    $x['f5']=$y[array_rand($y,1)];
	    	    $x['f6']=$y[array_rand($y,1)];
	    	    $x['f7']=$y[array_rand($y,1)];
	    	    $x['f8']=$y[array_rand($y,1)];
	    	    $x['f9']=$y[array_rand($y,1)];
	    	    $x['f10']=$y[array_rand($y,1)];
	    	    Db::name('game_xy10')->where('id',$prior_id)->setField('bidrate',json_encode($x));
	    	    $row=Db::name('game_xy10')->where('id',$prior_id)->find();
	            $result=$row['result'];
	    	    $num=$result;

	            $map['game_number']=$row['id'];//上期期号
	            $map['game_id']=2;//幸运10的ID
	            $data=collection($this->userBidModel->where($map)->select())->toArray();//所有投注此游戏的用户数据
	            

	            foreach($data as $v){
	            	$prizeinfo=array();
	                $bidinfo=json_decode($v['bidinfo'],true);
	                $gid=$v['game_id'];
	                $oid=$v['game_number'];
	                $uid=$v['user_id'];
	                foreach($bidinfo as $k=>$w){
	                    if('f'.$num==$k){
	                    	// $z=array_values($w);
	                    	$win_coin=floor($w*$x['f'.$num]);

	                    	$this->userModel->where('uid',$uid)->setInc('coin',$win_coin);
	                    	$game=get_game($gid);
	                    	$coin=$this->userModel->where('uid',$uid)->value('coin');
	                    	adduserlog($uid,$game['name'].'第'.$oid.'期,中奖'.$win_coin.'金币',$win_coin,0,$coin,'hit');//hit类型:游戏中奖
	                    	$prizeinfo[$k]=$win_coin;
	                    	//添加中奖人数
	                    	Db::name('game_xy10')->where('id',$prior_id)->setInc('win_num',1);
	                    }else{
	                    	$prizeinfo[$k]=0;
	                    }

	                }
	                $bid=$v['id'];
	                $this->userBidModel->where('id',$bid)->setField('prizeinfo',json_encode($prizeinfo));
	            }
	            break;

    	}
    }

}