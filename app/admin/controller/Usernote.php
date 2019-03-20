<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 听雨 < 389625819@qq.com >
// +----------------------------------------------------------------------


namespace app\admin\controller;

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;

class Usernote extends Permissions
{   
    public function index()
    {
        $post = $this->request->param();
        
        if (!empty($post['user_id'])) {
            $where['user_id'] = $post['user_id'];
        }

 
        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $begin_time = strtotime($post['create_time']);
            $end_time = $begin_time + 24*60*60;
            $where['create_time'] = [['>=',$begin_time],['<=',$end_time]];
        }
        
        $usernotes = empty($where) ? Db::name('user_note')->order('create_time desc')->paginate(15) : Db::name('user_note')->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
        // echo $model->getLastSql();
        // var_dump(collection($userlogs)->toArray());exit;
        $this->assign('usernotes',$usernotes);

        return $this->fetch();
    }

    public function send(){
        if($this->request->isPost()) {
            //是提交操作
            $post = $this->request->post();
            //验证  唯一规则： 表名，字段名，排除主键值，主键名

            $rule = [
                'title'  => 'require|max:30',
                'content'   => 'require'
            ];

            $msg = [
                'title.require' => '标题名称必须填写',
                'title.max' => '标题不能超过30个字符',
                'content.require' => '问题内容必须填写'
            ];
            $validate = new \think\Validate($rule,$msg);
            //验证部分数据合法性
            if (!$validate->check($post)) {
                $this->error('提交失败：' . $validate->getError());
            }

            $post['create_time']=time();
            if(false == Db::name('user_note')->insert($post)) {
                return $this->error('发送失败');
            } else {
                $id = Db::name('user_note')->getLastInsID();
                $operation='发送站内信成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/usernote/index');
            }
        } else {
            return $this->fetch();
        }

    }

    
    public function delete()
    {
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('user_note')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='删除站内信成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/usernote/index');
            }
        }
    }
}
