<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\admin\model\Article as articleModel;
class Article extends Controller
{   
	private $articleModel;
	private $site_name;
	public function _initialize()
    {
        $this->articleModel = new articleModel();
        $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
    }
    public function index()
    {   
        $map['status']=1;
    	$articles=$this->articleModel->where($map)->order('is_top desc')->select();
    	$this->assign('articles',$articles);
        $this->assign('title',$this->site_name);
    	return $this->fetch();
    }

    public function detail(){
    	$post = $this->request->param();
    	if(!empty($post['id'])){
    		$article=$this->articleModel->where('id',$post['id'])->find();
    		$this->assign('article',$article);
    	}else{
            return $this->error('id不正确');
    	}
    	$this->assign('title',$this->site_name);
    	return $this->fetch();
    }
}
