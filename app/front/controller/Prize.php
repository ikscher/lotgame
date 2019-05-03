<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use think\Db;
use think\Session;
use app\admin\model\SmashEgg as smashEggModel;
use app\admin\model\DrawLottery as drawLotteryModel;
class Prize extends Site
{   
	private $smashEggModel;
    private $drawLotteryModel;
	// private $site_name;
    private $map;
    private $can;
    private $per;
    private $smashegg_integral;//砸蛋一次消耗积分
    private $draw_lottery; //充值多少金币得一次抽奖机会
	public function _initialize()
    {   
        parent::_initialize();
        if(empty($this->uid)) { $this->redirect('/common/login');}
        $this->smashEggModel = new smashEggModel();
        $this->drawLotteryModel = new drawLotteryModel();
        // $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);

        $this->map['uid']=$this->uid;
        $user=$this->userModel->where($this->map)->find();
        
        // $this->can=$this->user['is_can_draw'];
        $this->can=1;
        $this->draw_lottery=Db::name('webconfig')->where('id',101)->value('draw_lottery');
        $this->smashegg_integral=Db::name('webconfig')->where('id',101)->value('smashegg_integral');
    }

    //砸金蛋1
    public function shatter()
    {   
        // $this->assign('title',$this->site_name);
        $this->assign('smashegg_integral',$this->smashegg_integral);
    	return $this->fetch();
    }

    //砸金蛋2
    public function point()
    {   
        //一次砸蛋扣除积分
        
        if($this->user['points']>=$this->smashegg_integral){
            // $jp = array();
            // $jp[] = array( 'gl' => 1 , 'title' => '一等奖');
            // $jp[] = array( 'gl' => 2 , 'title' => '二等奖');
            // $jp[] = array( 'gl' => 3 , 'title' => '三等奖');
            // $jp[] = array( 'gl' => 94 , 'title' => '未中奖');
            //砸蛋减少积分
            $this->userModel->where('uid',$this->uid)->setDec('points',$this->smashegg_integral);
            

            $smashEggs=$this->smashEggModel->select();
            $jp=collection($smashEggs)->toArray();

            $zj = random_hits( $jp ,'odd');
            // echo json_encode($zj);exit;
            if($zj['money']>0) {
                $data['msg']=1;
                $data['prize']=$zj['name'];
                $result_trans=true;
                Db::startTrans();
                try{
                    //中奖增加金币
                    $this->userModel->where('uid',$this->uid)->setInc('coin',$zj['money']);
                    //写入日志
                    $coins=$this->userModel->where('uid',$this->uid)->value('coin');
                    adduserlog($this->uid,'砸金蛋',$zj['money'],0,$coins,'smasheggs');
                    // 提交事务
                    Db::commit(); 
                }catch (\Exception $e) {
                    $result_trans=false;
                    // 回滚事务
                    Db::rollback();
                }

                if($result_trans){
                    echo json_encode($data);exit;
                }else{
                    
                }
                
            }else{
                $data['msg']=0;
                $data['prize']=$zj['name'];
                echo json_encode($data);exit;
            }



        }else{
            $data['msg']=-2;
            $data['prize']="";
            echo json_encode($data);exit;
        }
       
    }

    //抽奖大转盘1
    public function Index()
    {
        $title='幸运大转盘 金币抽不停';
        $this->assign('title',$title);
        // $this->assign('can',$this->can);
        return $this->fetch();
    }
    
    //抽奖大转盘2
    public function start()
    {
        
        //$sum=json_decode('[{"id":"1","points":"888000","prize":"888000金币","v":"0","max":40,"min":0},{"id":"2","points":"188000","prize":"188000金币","v":"0.00","max":85,"min":45},{"id":"3","points":"58800","prize":"58800金币","v":"0.00","max":130,"min":90},{"id":"4","points":"6888","prize":"6888金币","v":"1.00","max":175,"min":135},{"id":"5","points":"2888","prize":"2888金币","v":"2.00","max":220,"min":180},{"id":"6","points":"666","prize":"666金币","v":"7.00","max":265,"min":225},{"id":"7","points":"222","prize":"彩豆大礼包","v":"0.00","max":310,"min":270},{"id":"8","points":"0","prize":"再接再厉","v":"90.00","max":355,"min":315}]',true);
        // $prize[0]=array('id'=>1,'coin'=>'888000','prize'=>'888000金币','v'=>0,'max'=>40,'min'=>0);
        // $prize[1]=array('id'=>2,'coin'=>'188000','prize'=>'188000金币','v'=>0,'max'=>85,'min'=>45);
        // $prize[2]=array('id'=>3,'coin'=>'58800','prize'=>'58800金币','v'=>0,'max'=>130,'min'=>90);
        // $prize[3]=array('id'=>4,'coin'=>'6888','prize'=>'6888金币','v'=>0,'max'=>175,'min'=>135);
        // $prize[4]=array('id'=>5,'coin'=>'2888','prize'=>'2888金币','v'=>1,'max'=>220,'min'=>180);
        // $prize[5]=array('id'=>6,'coin'=>'666','prize'=>'666金币','v'=>1,'max'=>265,'min'=>225);
        // $prize[6]=array('id'=>7,'coin'=>'222','prize'=>'彩豆大礼包','v'=>5,'max'=>310,'min'=>270);
        // $prize[7]=array('id'=>8,'coin'=>'0','prize'=>'再接再厉','v'=>200,'max'=>355,'min'=>315);
        $prize=collection($this->drawLotteryModel->select())->toArray();
        $act=$this->request->get('act');
        if($act=='sum'){
            $data=array();
            foreach($prize as $v){
                $data[$v['id']]=$v['odd'];
            }
            $num=get_rand($data);
            
            $prize_hit=array();
            $prize_ret=array();
            $prize_hit=$prize[$num-1];
            $prize_ret['angle']=rand($prize_hit['min'],$prize_hit['max']);
            $prize_ret['name']=$prize_hit['name'];
            $prize_ret['can']=$this->can; //充值 获得抽奖的资格   （按照金币数量 来，一次抽奖需要多少金币，然后 用户的金币数/一次抽奖所需的金币=次数）
            $prize_ret['coin']=$prize_hit['money'];
            if($this->can>=1) $this->userModel->where($this->map)->setField('is_can_draw', 0);
        
            echo json_encode($prize_ret);exit;
        }elseif ($this->request->isPost()){
            echo json_encode($prize);exit;
        }

    }
    
    //抽奖大转盘3,中奖操作
    public function win()
    {
        if($this->request->isPost()){
            $post=$this->request->post();
            $coin=$post['coin'];
            //增加金币
            $this->userModel->where('uid',$this->uid)->setInc('coin',$coin);
        }
    }


}
