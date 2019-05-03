<?php
/*
开奖
*/
namespace app\front\controller;
use think\Controller;
use think\Config;
use think\Session;
use think\Db;
use app\admin\model\Game as gameModel;
use app\front\model\UserAuto as userAutoModel;
use app\front\model\User as userModel;
use app\front\model\UserBidmode as userBidmodeModel;
use baccarat\Game;
class Data extends Controller
{   
	private $bankCards;
	private $playerCards;
	private $result;
	private $userAutoModel;
	private $userModel;
	private $userBidmodeModel;
	
	public function _initialize()
	{
        $this->bankCards='';
        $this->playerCards='';
        $this->result='';
        $this->userAutoModel=new userAutoModel();
        $this->userModel=new userModel();
        $this->userBidmodeModel=new userBidmodeModel();
        // if(empty(Session::get('uid'))) { $this->redirect('/common/login');} //如果加上，命令行下计划任务是执行不了的
	}

	//幸运百家乐
	public function baccarat()
	{
        $game = new Game();
		$game->deal();
		echo "=SHUFFLE=\n";
		printf("Sequence: %s\n", $game->sequence());
		echo "=DEAL=\n";
		$this->bankCards=$this->ShowCards($game->bankerCards());
		printf("Banker Cards: %s [%u]\n",$this->bankCards , $game->bankerPoint());
		$this->playerCards=$this->ShowCards($game->playerCards());
		printf("Player Cards: %s [%u]\n", $this->playerCards, $game->playerPoint());
        
        
		while($game->draw()){
		    echo "=DRAW=\n";
            $this->bankCards=$this->ShowCards($game->bankerCards());
		    printf("Banker Cards: %s [%u]\n", $this->bankCards, $game->bankerPoint());
		    $this->playerCards=$this->ShowCards($game->playerCards());
		    printf("Player Cards: %s [%u]\n", $this->playerCards, $game->playerPoint());
		}
		$this->result=$game->result();
	    printf("=RESULT=\n%s\n", $game->result());
	    //随机生成abcd字符
	    $str = 'abcd';
        
		$now=strtotime('now');
        $data['open_time']=$now;

        //庄家
        $b=explode(',',$this->bankCards);
        $arr_b=array();
        foreach($b as $v){
        	$shuffled = str_shuffle($str);
            $singlestr=substr($shuffled,0,1);
            $arr_b[]=$this->showNumber($v).$singlestr;
        }
        $ba['banker']=$arr_b;
        //闲家
        $p=explode(',',$this->playerCards);
        $arr_p=array();
        foreach($p as $v){
        	$shuffled = str_shuffle($str);
            $singlestr=substr($shuffled,0,1);
            $arr_p[]=$this->showNumber($v).$singlestr;
        }
        $ba['player']=$arr_p;

		$data['desc']=json_encode($ba);
		$data['result']=$this->result;
		$data['create_time']=time();
		$data['status']=2;//已开奖
		$data['period']='';
    
        $row=Db::name('game_xybjl')->where('status',1)->order('id asc')->find();
 
        $data_=array();
        if(empty($row['id'])){//游戏表里面没有任何数据
        	Db::name('game_xybjl')->insert($data);
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xybjl')->insertAll($data_);
        }elseif($row['open_time']<time()){ //网络中断后
        	Db::startTrans();
            try{
	            $id=$row['id'];
		        Db::name('game_xybjl')->where('id',$id)->update($data);
	            
	        	$data_ =[ 'open_time' => strtotime("+1minute"),'period'=>'thisTimes'];
	        	Db::name('game_xybjl')->where('id',$id+1)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+2minute")];
				Db::name('game_xybjl')->where('id',$id+2)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+3minute")];
				Db::name('game_xybjl')->where('id',$id+3)->update($data_);
	        	unset($data_);

				$data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
		        Db::name('game_xybjl')->insert($data_);
		        // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }else{ //正常
        	Db::startTrans();
            try{
	            $id=$row['id'];
	            Db::name('game_xybjl')->where('id',$id)->update($data);
	            //更新下一期为当期开奖期
	            $next_id=$id+1;
	            Db::name('game_xybjl')->where('id',$next_id)->update(['period'=>'thisTimes']);
	            //同时插入一条记录
	            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
	            Db::name('game_xybjl')->insert($data_);
	            //自动投注用户投注$next_id这一期
                //(1)取出自动投注此游戏的所有用户
                $gid=1;//游戏ID
                $map['gid']=$gid;
                $userautomodes=collection($this->userAutoModel->where($map)->select())->toArray();
                foreach($userautomodes as $v){
                	if($v['start_game_no']>$next_id) continue; //自动投注起始期号大于当期开奖期号，退出
                	if($v['done']>=$v['span']) continue; //已执行完成所有自动投注期数

                    //用户自动投注信息
                    $uid=$v['user_id'];
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    if($coin>=$v['upper'] || $coin<=$v['lower']) continue;
                    $data_bid=array();
                    $data_bid['game_id']=$gid;
                    $data_bid['game_number']=$next_id;
                    $bidinfo=$this->userBidmodeModel->where('id',$v['mode_id'])->value('bidinfo');
                    $data_bid['bidinfo']=$bidinfo;
                    $bidmoney=array_sum(json_decode($bidinfo,true));
                    $data_bid['bidmoney']=$bidmoney;
                    $data_bid['create_time']=time();
                    $data_bid['user_id']=$uid;
                    $data_bid['is_auto']=1;
                    Db::name('user_bid')->where('user_id',$uid)->insert($data_bid);

                    //自动投注次数+1
                    $this->userAutoModel->where('id',$v['id'])->setInc('done',1);

                    //用户余额减少
                    $this->userModel->where('uid',$uid)->setDec('coin',$bidmoney);

                    //用户日志
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    $game=get_game($gid);
                    $ret6=adduserlog($uid,$game['name'].'第'.$next_id.'期,自动投注'.$bidmoney.'金币',-$bidmoney,0,$coin,'autobet');//bet类型：游戏下注
                    
                    //更改对应游戏表的投注总额，投注人数
                    Db::name('game_xybjl')->where('id',$next_id)->setInc('bet_num',1);
                    Db::name('game_xybjl')->where('id',$next_id)->setInc('total_money',$bidmoney);
                }
                // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }
		


	}

    //幸运10
    /**
    *计算机系统随机产生10个数字,数字范围1-10各不相同,每1分钟一期，24小时开奖 如第449159期	4,1,2,9,8,10,3,7,5,6
    */
    public function luckyten()
    {
        $a=array(1,2,3,4,5,6,7,8,9,10);
        shuffle($a);
		$len=sizeof($a);
		$temp='';
		for ($i = $len - 1; $i > 0; $i--) {
		    //生成一个0~i的随机数j(0 <= j < i)
			$j=rand(0,$i);
		    //交换a[i]和a[j]
			$temp=$a[$i];
			$a[$i]=$a[$j];
			$a[$j]=$temp;
		}

		shuffle($a);
        
        $now=strtotime('now');
        $data['open_time']=$now;
		$data['desc']=implode(',',$a);
		$data['result']=$a[0]; //取首位
		$data['create_time']=time();
		$data['status']=2;//已开奖
		$data['period']='';
    
        $row=Db::name('game_xy10')->where('status',1)->order('id asc')->find();
 
        $data_=array();
        if(empty($row['id'])){ //初始开奖
        	Db::name('game_xy10')->insert($data);
        	// $lastid=Db::name('game_xybjl')->getLastInsID();
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xy10')->insertAll($data_);
        }elseif($row['open_time']<time()){ //网络中端后
        	Db::startTrans();
            try{
	            $id=$row['id'];
		        Db::name('game_xy10')->where('id',$id)->update($data);
	            
	        	$data_ =[ 'open_time' => strtotime("+1minute"),'period'=>'thisTimes'];
	        	Db::name('game_xy10')->where('id',$id+1)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+2minute")];
				Db::name('game_xy10')->where('id',$id+2)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+3minute")];
				Db::name('game_xy10')->where('id',$id+3)->update($data_);
	        	unset($data_);

				$data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
		        Db::name('game_xy10')->insert($data_);
		        // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }else{ //正常开奖
        	Db::startTrans();
            try{
	            $id=$row['id'];
	            Db::name('game_xy10')->where('id',$id)->update($data);
	            //更新下一期为当期开奖期
	            $next_id=$id+1;
	            Db::name('game_xy10')->where('id',$next_id)->update(['period'=>'thisTimes']);
	            //同时插入一条记录
	            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
	            Db::name('game_xy10')->insert($data_);
	            //自动投注用户投注$next_id这一期
                //(1)取出自动投注此游戏的所有用户
                $gid=2;//游戏ID
                $map['gid']=$gid;
                $userautomodes=collection($this->userAutoModel->where($map)->select())->toArray();
                foreach($userautomodes as $v){
                	if($v['start_game_no']>$next_id) continue; //自动投注起始期号大于当期开奖期号，退出
                	if($v['done']>=$v['span']) continue; //已执行完成所有自动投注期数

                    //用户自动投注信息
                    $uid=$v['user_id'];
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    if($coin>=$v['upper'] || $coin<=$v['lower']) continue;
                    $data_bid=array();
                    $data_bid['game_id']=$gid;
                    $data_bid['game_number']=$next_id;
                    $bidinfo=$this->userBidmodeModel->where('id',$v['mode_id'])->value('bidinfo');
                    $data_bid['bidinfo']=$bidinfo;
                    $bidmoney=array_sum(json_decode($bidinfo,true));
                    $data_bid['bidmoney']=$bidmoney;
                    $data_bid['create_time']=time();
                    $data_bid['user_id']=$uid;
                    $data_bid['is_auto']=1;
                    Db::name('user_bid')->where('user_id',$uid)->insert($data_bid);

                    //自动投注次数+1
                    $this->userAutoModel->where('id',$v['id'])->setInc('done',1);

                    //用户余额减少
                    $this->userModel->where('uid',$uid)->setDec('coin',$bidmoney);

                    //用户日志
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    $game=get_game($gid);
                    $ret6=adduserlog($uid,$game['name'].'第'.$next_id.'期,自动投注'.$bidmoney.'金币',-$bidmoney,0,$coin,'autobet');//bet类型：游戏下注
                    
                    //更改对应游戏表的投注总额，投注人数
                    Db::name('game_xy10')->where('id',$next_id)->setInc('bet_num',1);
                    Db::name('game_xy10')->where('id',$next_id)->setInc('total_money',$bidmoney);
                }
                // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }
    }

    //幸运11
    /**
    *计算机系统随机产生2个数字,每个数字范围1-6,每1分钟一期，24小时开奖
    */
    public function luckyeleven()
    {
        $a=random_int(1,6);
        $b=random_int(1,6);
        
        $now=strtotime('now');
        $data['open_time']=$now;
		$data['desc']=$a.','.$b;
		$data['result']=$a+$b; //取首位
		$data['create_time']=time();
		$data['status']=2;//已开奖
		$data['period']='';
    
        $row=Db::name('game_xy11')->where('status',1)->order('id asc')->find();
 
        $data_=array();
        if(empty($row['id'])){//初始
        	Db::name('game_xy11')->insert($data);
        	// $lastid=Db::name('game_xybjl')->getLastInsID();
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xy11')->insertAll($data_);
        }elseif($row['open_time']<time()){//网络中断
        	Db::startTrans();
            try{
	            $id=$row['id'];
		        Db::name('game_xy11')->where('id',$id)->update($data);
	            
	        	$data_ =[ 'open_time' => strtotime("+1minute"),'period'=>'thisTimes'];
	        	Db::name('game_xy11')->where('id',$id+1)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+2minute")];
				Db::name('game_xy11')->where('id',$id+2)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+3minute")];
				Db::name('game_xy11')->where('id',$id+3)->update($data_);
	        	unset($data_);

				$data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
		        Db::name('game_xy11')->insert($data_);
		        // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }else{//正常
        	Db::startTrans();
            try{
	            $id=$row['id'];
	            Db::name('game_xy11')->where('id',$id)->update($data);
	            //更新下一期为当期开奖期
	            $next_id=$id+1;
	            Db::name('game_xy11')->where('id',$next_id)->update(['period'=>'thisTimes']);
	            //同时插入一条记录
	            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
	            Db::name('game_xy11')->insert($data_);
	            //自动投注用户投注$next_id这一期
                //(1)取出自动投注此游戏的所有用户
                $gid=3;//游戏ID
                $map['gid']=$gid;
                $userautomodes=collection($this->userAutoModel->where($map)->select())->toArray();
                foreach($userautomodes as $v){
                	if($v['start_game_no']>$next_id) continue; //自动投注起始期号大于当期开奖期号，退出
                	if($v['done']>=$v['span']) continue; //已执行完成所有自动投注期数

                    //用户自动投注信息
                    $uid=$v['user_id'];
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    if($coin>=$v['upper'] || $coin<=$v['lower']) continue;
                    $data_bid=array();
                    $data_bid['game_id']=$gid;
                    $data_bid['game_number']=$next_id;
                    $bidinfo=$this->userBidmodeModel->where('id',$v['mode_id'])->value('bidinfo');
                    $data_bid['bidinfo']=$bidinfo;
                    $bidmoney=array_sum(json_decode($bidinfo,true));
                    $data_bid['bidmoney']=$bidmoney;
                    $data_bid['create_time']=time();
                    $data_bid['user_id']=$uid;
                    $data_bid['is_auto']=1;
                    Db::name('user_bid')->where('user_id',$uid)->insert($data_bid);

                    //自动投注次数+1
                    $this->userAutoModel->where('id',$v['id'])->setInc('done',1);

                    //用户余额减少
                    $this->userModel->where('uid',$uid)->setDec('coin',$bidmoney);

                    //用户日志
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    $game=get_game($gid);
                    $ret6=adduserlog($uid,$game['name'].'第'.$next_id.'期,自动投注'.$bidmoney.'金币',-$bidmoney,0,$coin,'autobet');//bet类型：游戏下注
                    
                    //更改对应游戏表的投注总额，投注人数
                    Db::name('game_xy11')->where('id',$next_id)->setInc('bet_num',1);
                    Db::name('game_xy11')->where('id',$next_id)->setInc('total_money',$bidmoney);
                }
                // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }
    }

    //幸运16
    /**
    *计算机系统随机产生3个数字,每个数字范围1-6,每1分钟一期，24小时开奖
    */
    public function luckysixteen()
    {
        $a=random_int(1,6);
        $b=random_int(1,6);
        $c=random_int(1,6);
        
        $now=strtotime('now');
        $data['open_time']=$now;
		$data['desc']=$a.','.$b.','.$c;
		$data['result']=$a+$b+$c; //累加
		$data['create_time']=time();
		$data['status']=2;//已开奖
		$data['period']='';
    
        $row=Db::name('game_xy16')->where('status',1)->order('id asc')->find();
 
        $data_=array();
        if(empty($row['id'])){//初始
        	Db::name('game_xy16')->insert($data);
        	// $lastid=Db::name('game_xybjl')->getLastInsID();
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xy16')->insertAll($data_);
        }elseif($row['open_time']<time()){//网络中断
        	Db::startTrans();
            try{
	            $id=$row['id'];
		        Db::name('game_xy16')->where('id',$id)->update($data);
	            
	        	$data_ =[ 'open_time' => strtotime("+1minute"),'period'=>'thisTimes'];
	        	Db::name('game_xy16')->where('id',$id+1)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+2minute")];
				Db::name('game_xy16')->where('id',$id+2)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+3minute")];
				Db::name('game_xy16')->where('id',$id+3)->update($data_);
	        	unset($data_);

				$data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
		        Db::name('game_xy16')->insert($data_);
		        // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }else{//正常
        	Db::startTrans();
            try{
	            $id=$row['id'];
	            Db::name('game_xy16')->where('id',$id)->update($data);
	            //更新下一期为当期开奖期
	            $next_id=$id+1;
	            Db::name('game_xy16')->where('id',$next_id)->update(['period'=>'thisTimes']);
	            //同时插入一条记录
	            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
	            Db::name('game_xy16')->insert($data_);
	            //自动投注用户投注$next_id这一期
                //(1)取出自动投注此游戏的所有用户
                $gid=4;//游戏ID
                $map['gid']=$gid;
                $userautomodes=collection($this->userAutoModel->where($map)->select())->toArray();
                foreach($userautomodes as $v){
                	if($v['start_game_no']>$next_id) continue; //自动投注起始期号大于当期开奖期号，退出
                	if($v['done']>=$v['span']) continue; //已执行完成所有自动投注期数

                    //用户自动投注信息
                    $uid=$v['user_id'];
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    if($coin>=$v['upper'] || $coin<=$v['lower']) continue;
                    $data_bid=array();
                    $data_bid['game_id']=$gid;
                    $data_bid['game_number']=$next_id;
                    $bidinfo=$this->userBidmodeModel->where('id',$v['mode_id'])->value('bidinfo');
                    $data_bid['bidinfo']=$bidinfo;
                    $bidmoney=array_sum(json_decode($bidinfo,true));
                    $data_bid['bidmoney']=$bidmoney;
                    $data_bid['create_time']=time();
                    $data_bid['user_id']=$uid;
                    $data_bid['is_auto']=1;
                    Db::name('user_bid')->where('user_id',$uid)->insert($data_bid);

                    //自动投注次数+1
                    $this->userAutoModel->where('id',$v['id'])->setInc('done',1);

                    //用户余额减少
                    $this->userModel->where('uid',$uid)->setDec('coin',$bidmoney);

                    //用户日志
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    $game=get_game($gid);
                    $ret6=adduserlog($uid,$game['name'].'第'.$next_id.'期,自动投注'.$bidmoney.'金币',-$bidmoney,0,$coin,'autobet');//bet类型：游戏下注
                    
                    //更改对应游戏表的投注总额，投注人数
                    Db::name('game_xy16')->where('id',$next_id)->setInc('bet_num',1);
                    Db::name('game_xy16')->where('id',$next_id)->setInc('total_money',$bidmoney);
                }
                // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }
    }

    //幸运冠亚军
    /**
    *计算机系统随机产生10个数字,数字范围1-10各不相同,每1分钟一期，24小时开奖 
    */
    public function luckyrank()
    {
        $a=array(1,2,3,4,5,6,7,8,9,10);
        shuffle($a);
		$len=sizeof($a);
		$temp='';
		for ($i = $len - 1; $i > 0; $i--) {
		    //生成一个0~i的随机数j(0 <= j < i)
			$j=rand(0,$i);
		    //交换a[i]和a[j]
			$temp=$a[$i];
			$a[$i]=$a[$j];
			$a[$j]=$temp;
		}

		shuffle($a);
        
        $now=strtotime('now');
        $data['open_time']=$now;
		$data['desc']=implode(',',$a);
		$data['result']=$a[0]+$a[1]; //取头两位相加
		$data['create_time']=time();
		$data['status']=2;//已开奖
		$data['period']='';
    
        $row=Db::name('game_xygyj')->where('status',1)->order('id asc')->find();
 
        $data_=array();
        if(empty($row['id'])){ //初始开奖
        	Db::name('game_xygyj')->insert($data);
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xygyj')->insertAll($data_);
        }elseif($row['open_time']<time()){ //网络中端后
        	Db::startTrans();
            try{
	            $id=$row['id'];
		        Db::name('game_xygyj')->where('id',$id)->update($data);
	            
	        	$data_ =[ 'open_time' => strtotime("+1minute"),'period'=>'thisTimes'];
	        	Db::name('game_xygyj')->where('id',$id+1)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+2minute")];
				Db::name('game_xygyj')->where('id',$id+2)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+3minute")];
				Db::name('game_xygyj')->where('id',$id+3)->update($data_);
	        	unset($data_);

				$data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
		        Db::name('game_xygyj')->insert($data_);
		        // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }else{ //正常开奖
        	Db::startTrans();
            try{
	            $id=$row['id'];
	            Db::name('game_xygyj')->where('id',$id)->update($data);
	            //更新下一期为当期开奖期
	            $next_id=$id+1;
	            Db::name('game_xygyj')->where('id',$next_id)->update(['period'=>'thisTimes']);
	            //同时插入一条记录
	            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
	            Db::name('game_xygyj')->insert($data_);
	            //自动投注用户投注$next_id这一期
                //(1)取出自动投注此游戏的所有用户
                $gid=5;//游戏ID
                $map['gid']=$gid;
                $userautomodes=collection($this->userAutoModel->where($map)->select())->toArray();
                foreach($userautomodes as $v){
                	if($v['start_game_no']>$next_id) continue; //自动投注起始期号大于当期开奖期号，退出
                	if($v['done']>=$v['span']) continue; //已执行完成所有自动投注期数

                    //用户自动投注信息
                    $uid=$v['user_id'];
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    if($coin>=$v['upper'] || $coin<=$v['lower']) continue;
                    $data_bid=array();
                    $data_bid['game_id']=$gid;
                    $data_bid['game_number']=$next_id;
                    $bidinfo=$this->userBidmodeModel->where('id',$v['mode_id'])->value('bidinfo');
                    $data_bid['bidinfo']=$bidinfo;
                    $bidmoney=array_sum(json_decode($bidinfo,true));
                    $data_bid['bidmoney']=$bidmoney;
                    $data_bid['create_time']=time();
                    $data_bid['user_id']=$uid;
                    $data_bid['is_auto']=1;
                    Db::name('user_bid')->where('user_id',$uid)->insert($data_bid);

                    //自动投注次数+1
                    $this->userAutoModel->where('id',$v['id'])->setInc('done',1);

                    //用户余额减少
                    $this->userModel->where('uid',$uid)->setDec('coin',$bidmoney);

                    //用户日志
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    $game=get_game($gid);
                    $ret6=adduserlog($uid,$game['name'].'第'.$next_id.'期,自动投注'.$bidmoney.'金币',-$bidmoney,0,$coin,'autobet');//bet类型：游戏下注
                    
                    //更改对应游戏表的投注总额，投注人数
                    Db::name('game_xygyj')->where('id',$next_id)->setInc('bet_num',1);
                    Db::name('game_xygyj')->where('id',$next_id)->setInc('total_money',$bidmoney);
                }
                // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }
    }


    //幸运22
    /**
    *计算机系统随机产生10个数字,数字范围1-10各不相同,每1分钟一期，24小时开奖 
    */
    public function luckytwentytwo()
    {
        $a=array(1,2,3,4,5,6,7,8,9,10);
        shuffle($a);
		$len=sizeof($a);
		$temp='';
		for ($i = $len - 1; $i > 0; $i--) {
		    //生成一个0~i的随机数j(0 <= j < i)
			$j=rand(0,$i);
		    //交换a[i]和a[j]
			$temp=$a[$i];
			$a[$i]=$a[$j];
			$a[$j]=$temp;
		}

		shuffle($a);
        
        $now=strtotime('now');
        $data['open_time']=$now;
		$data['desc']=implode(',',$a);
		$data['result']=$a[0]+$a[1]+$a[2]; //取头3位相加
		$data['create_time']=time();
		$data['status']=2;//已开奖
		$data['period']='';
    
        $row=Db::name('game_xy22')->where('status',1)->order('id asc')->find();
 
        $data_=array();
        if(empty($row['id'])){ //初始开奖
        	Db::name('game_xy22')->insert($data);
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xy22')->insertAll($data_);
        }elseif($row['open_time']<time()){ //网络中端后
        	Db::startTrans();
            try{
	            $id=$row['id'];
		        Db::name('game_xy22')->where('id',$id)->update($data);
	            
	        	$data_ =[ 'open_time' => strtotime("+1minute"),'period'=>'thisTimes'];
	        	Db::name('game_xy22')->where('id',$id+1)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+2minute")];
				Db::name('game_xy22')->where('id',$id+2)->update($data_);
	        	unset($data_);
				$data_ = [ 'open_time' => strtotime("+3minute")];
				Db::name('game_xy22')->where('id',$id+3)->update($data_);
	        	unset($data_);

				$data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
		        Db::name('game_xy22')->insert($data_);
		        // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }else{ //正常开奖
        	Db::startTrans();
            try{
	            $id=$row['id'];
	            Db::name('game_xy22')->where('id',$id)->update($data);
	            //更新下一期为当期开奖期
	            $next_id=$id+1;
	            Db::name('game_xy22')->where('id',$next_id)->update(['period'=>'thisTimes']);
	            //同时插入一条记录
	            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
	            Db::name('game_xy22')->insert($data_);
	            //自动投注用户投注$next_id这一期
                //(1)取出自动投注此游戏的所有用户
                $gid=6;//游戏ID
                $map['gid']=$gid;
                $userautomodes=collection($this->userAutoModel->where($map)->select())->toArray();
                foreach($userautomodes as $v){
                	if($v['start_game_no']>$next_id) continue; //自动投注起始期号大于当期开奖期号，退出
                	if($v['done']>=$v['span']) continue; //已执行完成所有自动投注期数

                    //用户自动投注信息
                    $uid=$v['user_id'];
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    if($coin>=$v['upper'] || $coin<=$v['lower']) continue;
                    $data_bid=array();
                    $data_bid['game_id']=$gid;
                    $data_bid['game_number']=$next_id;
                    $bidinfo=$this->userBidmodeModel->where('id',$v['mode_id'])->value('bidinfo');
                    $data_bid['bidinfo']=$bidinfo;
                    $bidmoney=array_sum(json_decode($bidinfo,true));
                    $data_bid['bidmoney']=$bidmoney;
                    $data_bid['create_time']=time();
                    $data_bid['user_id']=$uid;
                    $data_bid['is_auto']=1;
                    Db::name('user_bid')->where('user_id',$uid)->insert($data_bid);

                    //自动投注次数+1
                    $this->userAutoModel->where('id',$v['id'])->setInc('done',1);

                    //用户余额减少
                    $this->userModel->where('uid',$uid)->setDec('coin',$bidmoney);

                    //用户日志
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    $game=get_game($gid);
                    $ret6=adduserlog($uid,$game['name'].'第'.$next_id.'期,自动投注'.$bidmoney.'金币',-$bidmoney,0,$coin,'autobet');//bet类型：游戏下注
                    
                    //更改对应游戏表的投注总额，投注人数
                    Db::name('game_xy22')->where('id',$next_id)->setInc('bet_num',1);
                    Db::name('game_xy22')->where('id',$next_id)->setInc('total_money',$bidmoney);
                }
                // 提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
            }
        }
    }

	private function ShowCards($cards){
	    return implode(",", array_map(function($card){
	        $card = $card[1];
	        if($card == 1){
	            return 'A';
	        }elseif($card === 11){
	            return 'J';
	        }elseif($card === 12){
	            return 'Q';
	        }elseif($card === 13){
	            return 'K';
	        }else{
	            return $card;
	        }
	    }, $cards));
	}

	private function showNumber($card){
         switch($card){
         	case '0':
         	   return 10;
         	case 'A':
         	   return 1;
         	case 'J':
         	   return 11;
         	case 'Q':
         	   return 12;
         	case 'K':
         	   return 13;
            default:
               return $card;
         }
	}

}
