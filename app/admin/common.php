<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------

//admin模块公共函数

/**
 * 管理员密码加密方式
 * @param $password  密码
 * @param $password_code 密码额外加密字符
 * @return string
 */
function password($password, $password_code='lshi4AsSUrUOwWV')
{
    return md5(md5($password) . md5($password_code));
}

/**
 * 管理员操作日志
 * @param  [type] $data [description]
 * @return [type]       [description]
 */
function addlog($operation='')
{
    //获取网站配置
    $web_config = \think\Db::name('webconfig')->where('id','101')->find();
    if($web_config['is_log'] == 1) {
        $data['operation'] = $operation;
        $data['admin_id'] = \think\Session::get('admin');//管理员id
        $request = \think\Request::instance();
        $data['ip'] = $request->ip();//操作ip
        $data['create_time'] = time();//操作时间
        $url['module'] = $request->module();
        $url['controller'] = $request->controller();
        $url['function'] = $request->action();
        //获取url参数
        $parameter = $request->path() ? $request->path() : null;
        //将字符串转化为数组
        $parameter = explode('/',$parameter);
        //剔除url中的模块、控制器和方法
        foreach ($parameter as $key => $value) {
            if($value != $url['module'] and $value != $url['controller'] and $value != $url['function']) {
                $param[] = $value;
            }
        }

        if(isset($param) and !empty($param)) {
            //确定有参数
            $string = '';
            foreach ($param as $key => $value) {
                //奇数为参数的参数名，偶数为参数的值
                if($key%2 !== 0) {
                    //过滤只有一个参数和最后一个参数的情况
                    if(count($param) > 2 and $key < count($param)-1) {
                        $string.=$value.'&';
                    } else {
                        $string.=$value;
                    }
                } else {
                    $string.=$value.'=';
                }
            } 
        } else {
            //ajax请求方式，传递的参数path()接收不到，所以只能param()
            $string = [];
            $param = $request->param();
            foreach ($param as $key => $value) {
                if(!is_array($value)) {
                    //这里过滤掉值为数组的参数
                    $string[] = $key.'='.$value;
                }
            }
            $string = implode('&',$string);
        }
        $data['admin_menu_id'] = empty(\think\Db::name('admin_menu')->where($url)->where('parameter',$string)->value('id')) ? \think\Db::name('admin_menu')->where($url)->value('id') : \think\Db::name('admin_menu')->where($url)->where('parameter',$string)->value('id');
        // $data['admin_menu_id'] = \think\Db::name('admin_menu')->where($url)->value('id');
        // $data['sql']=\think\Db::name('admin_menu')->getLastSql();
        // return $data;
        \think\Db::name('admin_log')->insert($data);
    } else {
        //关闭了日志
        return true;
    }
	
}


/**
 * 格式化字节大小
 * @param  number $size      字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 */
function format_bytes($size, $delimiter = '') {
    $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
    for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
    return round($size, 2) . $delimiter . $units[$i];
}


/*
 * 生成随机字符串
 * @param int $length 生成随机字符串的长度
 * @param string $char 组成随机字符串的字符串
 * @return string $string 生成的随机字符串
 */
function str_rand($length = 8, $format = '') {
    switch($format){
        case '3'://数字+大写字母+小写字母
           $char='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
           break;
        case '2'://数字+大写字母
           $char='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
           break;
        case '1': //数字
           $char='0123456789';
           break;
        default:
           $char='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    if(!is_int($length) || $length < 0) {
        return false;
    }

    $string = '';
    for($i = $length; $i > 0; $i--) {
        $string .= $char[mt_rand(0, strlen($char) - 1)];
    }

    return $string;
}

/**
*  返回用户工单的状态
*  @param  1，2，3，4，5
*  @return 1待处理，2正在处理，3待用户反馈，4已解决，5已取消
*/
function getStatus($status){
    if (empty($status)) return '';
    $status_arr=array('1'=>'待处理','2'=>'正在处理','3'=>'待用户反馈','4'=>'已解决','5'=>'已取消');
    return $status_arr[$status];
}
