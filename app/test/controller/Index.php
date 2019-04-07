<?php
namespace app\test\controller;
use \think\Controller;
use think\Db;
use app\admin\model\Admin as adminModel;//管理员模型
use app\admin\model\AdminLog;//管理员模型
use app\admin\model\CardPwd as cardPwdModel;
use app\admin\model\Chargeconfig as chargeConfigModel;
use app\front\model\UserExchange as userExchangeModel;

class Index extends Controller
{   
    private $cardPwdModel;
    public function _initialize()
    {
        $this->cardPwdModel=new cardPwdModel();
        $this->chargeConfigModel=new chargeConfigModel();
        $this->userExchangeModel=new userExchangeModel();
    }
    public function index()
    {
        // echo $desc;

        // echo $admin->admincate->desc;
        
        ////////////////////////////////////////
        //
        //    $admin = new adminModel();
        // $desc=$admin->admincate()->field("desc")->where('id','1')->find();
        // echo $desc;
        //////////////////////////////////////////////

        // $admin = adminModel::hasWhere('log',['admin_menu_id'=>'50'])->find();
        // echo $admin->name;

        //一对一更新
        // $admin = adminModel::get(1);
        // $admin->log->ip = '192.168.1.102';
        // // $admin->log->save();
        // // 或者
        // $admin->log->save(['create_time' => '23234234']);
        //一对一插入
        // $admin = adminModel::get(1);
        // $admin->log()->save(['ip' => '192.168.1.103','create_time'=>'21342143']);
        
        //根据一对一的从表
        // $log = AdminLog::get(3);
        // // 输出User关联模型的属性
        // echo $log->admin->password;

        //一对多
        // $admin = adminModel::get(1);
        // // 获取文章的所有评论
        // $logs=collection($admin->log)->toArray();
        // // var_dump($logs);
        // // 也可以进行条件搜索
        // var_dump(collection($admin->log()->where('id',4)->select())->toArray());

        //模型操作
        // print_r(Db::name('admin_menu')->where('id','>',40)->limit(1)->select());
        // print_r(Db::name('admin_menu')->where('id','>',40)->find());
        // $map['card_no']='d1ruGtx6zv';
        // $map['card_pwd']='U17NIHQB';
        // $card=$this->cardPwdModel->where($map)->find();
        // $card=null;
        // var_dump($card);
        // $card=$this->cardPwdModel->where($map)->find();
        // var_dump($card);
        // echo '<br/>';

        //次数流水手续费
        // $charge_times=0;
        // $charge_t=$this->chargeConfigModel->where('status',1)->select();
        // // var_dump($charge_t);
        // $charge_t_=collection($charge_t)->toArray();
        // foreach($charge_t_ as $v){
        //     var_dump($v);
        // }

        $map['user_id']=1;
        $map['status']=array('in',array(1,2));
        $ids=$this->userExchangeModel->where($map)->count('id'); //兑换过多少次
        echo $this->userExchangeModel->getLastSql();
        // echo $card->cate->coin; 

        // $url = \think\Db::name("urlconfig")->where(['status' => 0])->column('aliases,url');
        // var_dump($url);
        return $this->fetch();
    }

   
}