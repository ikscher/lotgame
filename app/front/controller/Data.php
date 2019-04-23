<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\admin\model\Game as gameModel;
use baccarat\Game;
class Data extends Site
{   
	//幸运百家乐
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
		    printf("Banker Cards: %s [%u]\n", $this->ShowCards($game->bankerCards()), $game->bankerPoint());
		    printf("Player Cards: %s [%u]\n", $this->ShowCards($game->playerCards()), $game->playerPoint());
		}

		printf("=RESULT=\n%s\n", $game->result());
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
