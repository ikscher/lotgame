<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\front\model\User as userModel;
class User extends Controller
{   
	private $userModel;
	private $site_name;
	public function _initialize()
    {
        $this->userModel = new userModel();
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);
    }
    public function index()
    {   
        $map['uid']=1;
    	$user=$this->userModel->where($map)->find();
        var_dump($user);
    	$this->assign('user',$user);
        

    	// return $this->fetch();
    }

    public function point()
    {   
        $data=array();
        $map['uid']=1;
        $user=$this->userModel->where($map)->find();
        
        if($user['points']>20){
            $this->userModel->where($map)->setDec('points',$user['points']); //一次砸蛋扣多少积分
            // echo $this->userModel->getLastSql();exit;
            adduserlog('1','砸金蛋');

            $jp = array();
            $jp[] = array( 'gl' => 1 , 'title' => '一等奖');
            $jp[] = array( 'gl' => 2 , 'title' => '二等奖');
            $jp[] = array( 'gl' => 3 , 'title' => '三等奖');
            $jp[] = array( 'gl' => 94 , 'title' => '未中奖');

            $zj = random_hits( $jp );
            
            if(in_array($zj['gl'],array('1','2','3'))) {
                $data['msg']=1;
                $data['prize']="我中奖了";
                echo json_encode($data);exit;
            }else{
                $data['msg']=0;
                $data['prize']="没有中奖";
                echo json_encode($data);exit;
            }



        }else{
            $data['msg']=-2;
            $data['prize']="";
            echo json_encode($data);exit;
        }
       
    }
}
