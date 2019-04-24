<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use think\Db;
use app\admin\model\Game as gameModel;
use baccarat\Game;
class Data extends Site
{   
	private $bankCards;
	private $playerCards;
	private $result;
	//幸运百家乐
	public function _initialize()
	{
        $this->bankCards='';
        $this->playerCards='';
        $this->result='';
	}
	public function baccarat()
	{
        $game = new Game();
		$game->deal();
		echo "=SHUFFLE=\n";
		printf("Sequence: %s\n", $game->sequence());
		echo "=DEAL=\n";
		printf("Banker Cards: %s [%u]\n", $this->ShowCards($game->bankerCards()), $game->bankerPoint());
		printf("Player Cards: %s [%u]\n", $this->ShowCards($game->playerCards()), $game->playerPoint());
        
        
		while($game->draw()){
		    echo "=DRAW=\n";
            $this->bankCards=$this->ShowCards($game->bankerCards());
		    printf("Banker Cards: %s [%u]\n", $this->bankCards, $game->bankerPoint());
		    $this->playerCards=$this->ShowCards($game->playerCards());
		    printf("Player Cards: %s [%u]\n", $this->playerCards, $game->playerPoint());
		}
		$this->result=$game->result();
	    printf("=RESULT=\n%s\n", $game->result());
		$now=strtotime('now');
        $data['open_time']=$now;
        $ba['bankCards']=$this->bankCards;
        $ba['playerCards']=$this->playerCards;
		$data['desc']=json_encode($ba);
		$data['result']=$this->result;
		$data['create_time']=time();
		$data['status']=2;//已开奖
    
        $row=Db::name('game_xybjl')->where('status',1)->order('id asc')->find();
 
        $data_=array();
        if(empty($row['id'])){
        	Db::name('game_xybjl')->insert($data);
        	// $lastid=Db::name('game_xybjl')->getLastInsID();
        	$data_ = [
			    [ 'open_time' => strtotime("+1minute"),'status'=>1],
			    [ 'open_time' => strtotime("+2minute"),'status'=>1],
			    [ 'open_time' => strtotime("+3minute"),'status'=>1],
			    [ 'open_time' => strtotime("+4minute"),'status'=>1],
			    
			];
			Db::name('game_xybjl')->insertAll($data_);
        }else{
            $id=$row['id'];
            Db::name('game_xybjl')->where('id',$id)->update($data);
            $data_ = [ 'open_time' => strtotime("+4minute"),'status'=>1];
            Db::name('game_xybjl')->insert($data_);
        }
		


	}


	function ShowCards($cards){
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

}
