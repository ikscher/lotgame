<?php
namespace app\front\controller;
use think\Controller;
class Index extends Controller
{
    public function index()
    {
        $this->assign('title','彩豆28');
    	return $this->fetch();
    }
}
