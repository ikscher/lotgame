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


namespace app\admin\controller;

use app\admin\controller\Permissions;
use \think\Db;
class Webconfig extends Permissions
{   
    public function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {
        $web_config = Db::name('webconfig')->where('id','101')->find();
        $this->assign('web_config',$web_config);

        return $this->fetch();
    }

    public function publish()
    {
    	if($this->request->isPost()) {
            $post = $this->request->post();
            //验证  唯一规则： 表名，字段名，排除主键值，主键名
            $validate = new \think\Validate([
                ['sitename', 'require', '网站名称不能为空'],
                ['file_type', 'require', '上传类型不能为空'],
                ['file_size','require','上传大小不能为空'],
            ]);
            //验证部分数据合法性
            if (!$validate->check($post)) {
                $this->error('提交失败：' . $validate->getError());
            }

            if(empty($post['is_log'])) {
                $post['is_log'] = 0;
            } else {
                $post['is_log'] = $post['is_log'];
            }

            if(false == Db::name('webconfig')->where('id','101')->update($post)) {
                return $this->error('提交失败');
            } else {
                $operation='网站设置提交成功';
                addlog($operation);
                return $this->success($operation,'admin/webconfig/index');
            }
        }
    }
}
