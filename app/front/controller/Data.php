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
use baccarat\Game;
class Data extends Site
{   
	private $bankCards;
	private $playerCards;
	private $result;
	
	public function _initialize()
	{
        $this->bankCards='';
        $this->playerCards='';
        $this->result='';
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
        	// $lastid=Db::name('game_xybjl')->getLastInsID();
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xybjl')->insertAll($data_);
        }elseif($row['open_time']<time()){
            Db::name('game_xybjl')->where('status',1)->delete();
            Db::name('game_xybjl')->insert($data);
        	// $lastid=Db::name('game_xybjl')->getLastInsID();
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xybjl')->insertAll($data_);
        }else{
            $id=$row['id'];
            Db::name('game_xybjl')->where('id',$id)->update($data);
            //更新下一期为当期开奖期
            $next_id=$id+1;
            Db::name('game_xybjl')->where('id',$next_id)->update(['period'=>'thisTimes']);
            //同时插入一条记录
            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
            Db::name('game_xybjl')->insert($data_);
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
        if(empty($row['id'])){
        	Db::name('game_xy10')->insert($data);
        	// $lastid=Db::name('game_xybjl')->getLastInsID();
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xy10')->insertAll($data_);
        }elseif($row['open_time']<time()){
            Db::name('game_xy10')->where('status',1)->delete();
            Db::name('game_xy10')->insert($data);
        	// $lastid=Db::name('game_xybjl')->getLastInsID();
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1,'period'=>'thisTimes'],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1,'period'=>''],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1,'period'=>''],
			    
			];
			Db::name('game_xy10')->insertAll($data_);
        }else{
            $id=$row['id'];
            Db::name('game_xy10')->where('id',$id)->update($data);
            //更新下一期为当期开奖期
            $next_id=$id+1;
            Db::name('game_xy10')->where('id',$next_id)->update(['period'=>'thisTimes']);
            //同时插入一条记录
            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
            Db::name('game_xy10')->insert($data_);
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
