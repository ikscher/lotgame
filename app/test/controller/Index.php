<?php
namespace app\test\controller;
use \think\Controller;
use app\admin\model\Admin as adminModel;//管理员模型
use app\admin\model\AdminLog;//管理员模型

class Index extends Controller
{
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
        // var_dump(Db::name('admin_menu')->where('id','>',40)->select());
        return $this->fetch();
    }
}