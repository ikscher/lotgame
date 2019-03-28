<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\front\model\User as userModel;
class Prize extends Controller
{   
	private $userModel;
	private $site_name;
	public function _initialize()
    {
        $this->userModel = new userModel();
        $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
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
        return $this->fetch();
    }
    

    public function start()
    {
       

       $sum=json_decode('[{"id":"1","points":"888000","prize":"888000金币","v":"0.00","max":40,"min":0},{"id":"2","points":"188000","prize":"188000金币","v":"0.00","max":85,"min":45},{"id":"3","points":"58800","prize":"58800金币","v":"0.00","max":130,"min":90},{"id":"4","points":"6888","prize":"6888金币","v":"1.00","max":175,"min":135},{"id":"5","points":"2888","prize":"2888金币","v":"2.00","max":220,"min":180},{"id":"6","points":"666","prize":"666金币","v":"7.00","max":265,"min":225},{"id":"7","points":"222","prize":"彩豆大礼包","v":"0.00","max":310,"min":270},{"id":"8","points":"0","prize":"再接再厉","v":"90.00","max":355,"min":315}]',true);
       var_dump($sum);exit;
       echo json_encode($data);exit;

    }


}
