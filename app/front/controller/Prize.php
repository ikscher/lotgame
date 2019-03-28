<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\front\model\User as userModel;
class Prize extends Controller
{   
	private $userModel;
	private $site_name;
    private $map;
    private $can;
    private $per;
	public function _initialize()
    {
        $this->userModel = new userModel();
        $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);

        $this->map['uid']=1;
        $user=$this->userModel->where($this->map)->find();
        $coin=$user['coin'];
        $this->per=1000;//一次抽奖所需的金币数
        $this->can=floor($coin/$this->per);
    }

    //砸金蛋
    public function shatter()
    {   
        $this->assign('title',$this->site_name);
    	return $this->fetch();
    }

    //抽奖大转盘
    public function Index()
    {
        $title='幸运大转盘 金币抽不停';
        $this->assign('title',$title);
        $this->assign('can',$this->can);
        return $this->fetch();
    }
    

    public function start()
    {
        
        //$sum=json_decode('[{"id":"1","points":"888000","prize":"888000金币","v":"0","max":40,"min":0},{"id":"2","points":"188000","prize":"188000金币","v":"0.00","max":85,"min":45},{"id":"3","points":"58800","prize":"58800金币","v":"0.00","max":130,"min":90},{"id":"4","points":"6888","prize":"6888金币","v":"1.00","max":175,"min":135},{"id":"5","points":"2888","prize":"2888金币","v":"2.00","max":220,"min":180},{"id":"6","points":"666","prize":"666金币","v":"7.00","max":265,"min":225},{"id":"7","points":"222","prize":"彩豆大礼包","v":"0.00","max":310,"min":270},{"id":"8","points":"0","prize":"再接再厉","v":"90.00","max":355,"min":315}]',true);
        $prize[0]=array('id'=>1,'coin'=>'888000','prize'=>'888000金币','v'=>0,'max'=>40,'min'=>0);
        $prize[1]=array('id'=>2,'coin'=>'188000','prize'=>'188000金币','v'=>0,'max'=>85,'min'=>0);
        $prize[2]=array('id'=>3,'coin'=>'58800','prize'=>'58800金币','v'=>0,'max'=>130,'min'=>90);
        $prize[3]=array('id'=>4,'coin'=>'6888','prize'=>'6888金币','v'=>0,'max'=>175,'min'=>135);
        $prize[4]=array('id'=>5,'coin'=>'2888','prize'=>'2888金币','v'=>1,'max'=>220,'min'=>180);
        $prize[5]=array('id'=>6,'coin'=>'666','prize'=>'666金币','v'=>1,'max'=>265,'min'=>225);
        $prize[6]=array('id'=>7,'coin'=>'222','prize'=>'彩豆大礼包','v'=>5,'max'=>310,'min'=>270);
        $prize[7]=array('id'=>8,'coin'=>'0','prize'=>'再接再厉','v'=>200,'max'=>355,'min'=>315);
        
        $act=$this->request->get('act');
        if($act=='sum'){
            $data=array();
            foreach($prize as $v){
                $data[$v['id']]=$v['v'];
            }
            $num=get_rand($data);
            
            $prize_hit=array();
            $prize_ret=array();
            $prize_hit=$prize[$num-1];
            $prize_ret['angle']=rand($prize_hit['min'],$prize_hit['max']);
            $prize_ret['prize']=$prize_hit['prize'];
            $prize_ret['can']=$this->can; //按照金币数量 来，一次抽奖需要多少金币，然后 用户的金币数/一次抽奖所需的金币=次数
            $prize_ret['coin']=$prize_hit['coin'];
            if($this->can>=1) $this->userModel->where($this->map)->setDec('coin', $this->per);
        
            echo json_encode($prize_ret);exit;
        }elseif ($this->request->isPost()){
            echo json_encode($prize);exit;
        }

    }


}
