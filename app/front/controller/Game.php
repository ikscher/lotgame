<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use think\Session;
use think\Db;
use app\admin\model\Game as gameModel;
use app\front\model\UserBid as userBidModel;
class Game extends Site
{   
	private $gameModel;
    private $userBidModel;
    private $games;
    private $game;
    private $gid;
	private $game_area_type;
    private $scale_init;
    //用于测试
    public function test()
    {
       
    }
	public function _initialize()
    {   
        parent::_initialize();
        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}
        $this->gameModel = new gameModel();
        $this->userBidModel=new userBidModel();
        $this->game_area_type=Config::get('game_area_type');
 
        $this->assign('game_area_type',$this->game_area_type);
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
      
        
        $this->gid = $this->request->has('gid') ? $this->request->param('gid', 0, 'intval') : 1;
        $this->assign('gid',$this->gid);
       
        //游戏列表
        $this->games=$this->gameModel->where('onoff',1)->order('area_type')->select();
        $list=collection($this->games)->toArray();
        $listgame=array();
        foreach($list as $v){
            $listgame[$v['area_type']][]=$v;
        }
        // var_dump($listgame);
        $this->assign('games',$listgame);
        if(empty($this->gid)) $this->gid=1;
        $this->game=$this->gameModel->where('id',$this->gid)->find();
        $this->assign('game',$this->game);
    }
    
    //排行榜
    public function rank()
    {
        return $this->fetch();
    }

    public function index()
    {   

        // $game=$this->gameModel->where('id',$this->gid)->find();
        $this->assign("gtag",$this->game['gtag']);
        $this->assign("ntype",$this->game['ntype']);
        $this->assign("gtype",$this->game['gtype']);
        return $this->fetch();
    }
    
    //$json='{"code":200,"msg":"SUCCESS","data":{"prevTimes":{"result":"06,12,14,15,19,25,27,30,32,34,38,42,44,56,60,63,64,69,76,77","win_no":"7","number":"2416568"},"thisTimes":{"number":"2416569","draw_time":"1555747080","id":"171520","stop_time":2,"kj_time":52,"is_change":false},"timesLists":{"lists":[{"number":"2416572","draw_time":"04-20 16:08:30","result":null,"win_no":null,"total_money":0,"win_num":"0","bet_num":"0","status":"1","times_id":"171523","draw_time_full":"2019-04-20 16:08:30","my_total_money":0,"my_win_money":0},{"number":"2416571","draw_time":"04-20 16:05:00","result":null,"win_no":null,"total_money":0,"win_num":"0","bet_num":"0","status":"1","times_id":"171522","draw_time_full":"2019-04-20 16:05:00","my_total_money":0,"my_win_money":0},{"number":"2416570","draw_time":"04-20 16:01:30","result":null,"win_no":null,"total_money":0,"win_num":"0","bet_num":"0","status":"1","times_id":"171521","draw_time_full":"2019-04-20 16:01:30","my_total_money":0,"my_win_money":0},{"number":"2416569","draw_time":"04-20 15:58:00","result":null,"win_no":null,"total_money":"2,025,976,438","win_num":"0","bet_num":"176","status":"1","times_id":"171520","draw_time_full":"2019-04-20 15:58:00","my_total_money":0,"my_win_money":0},{"number":"2416568","draw_time":"04-20 15:54:30","result":"06,12,14,15,19,25,27,30,32,34,38,42,44,56,60,63,64,69,76,77","win_no":"7","total_money":"2,094,404,689","win_num":"173","bet_num":"182","status":"2","times_id":"171519","draw_time_full":"2019-04-20 15:54:30","my_total_money":0,"my_win_money":0},{"number":"2416567","draw_time":"04-20 15:51:00","result":"08,09,11,13,19,21,22,27,30,43,44,45,50,51,52,62,65,71,75,79","win_no":"4","total_money":"2,001,458,148","win_num":"164","bet_num":"173","status":"2","times_id":"171518","draw_time_full":"2019-04-20 15:51:00","my_total_money":0,"my_win_money":0},{"number":"2416566","draw_time":"04-20 15:47:30","result":"03,16,22,23,27,32,38,42,43,47,49,55,58,60,63,64,65,69,72,79","win_no":"9","total_money":"2,047,554,474","win_num":"171","bet_num":"177","status":"2","times_id":"171517","draw_time_full":"2019-04-20 15:47:30","my_total_money":0,"my_win_money":0},{"number":"2416565","draw_time":"04-20 15:44:00","result":"06,08,17,21,22,30,31,34,39,40,48,52,54,55,58,60,65,68,72,80","win_no":"4","total_money":"2,036,175,300","win_num":"168","bet_num":"175","status":"2","times_id":"171516","draw_time_full":"2019-04-20 15:44:00","my_total_money":0,"my_win_money":0},{"number":"2416564","draw_time":"04-20 15:40:30","result":"06,07,10,11,13,15,20,23,31,32,44,45,47,50,53,61,62,67,70,78","win_no":"10","total_money":"2,025,855,875","win_num":"155","bet_num":"174","status":"2","times_id":"171515","draw_time_full":"2019-04-20 15:40:30","my_total_money":0,"my_win_money":0},{"number":"2416563","draw_time":"04-20 15:37:00","result":"03,11,14,16,17,20,26,28,33,37,47,50,51,58,60,63,65,71,73,77","win_no":"8","total_money":"2,060,708,499","win_num":"172","bet_num":"179","status":"2","times_id":"171514","draw_time_full":"2019-04-20 15:37:00","my_total_money":0,"my_win_money":0},{"number":"2416562","draw_time":"04-20 15:33:30","result":"02,04,08,09,15,18,20,26,29,33,43,45,50,54,56,59,61,76,77,78","win_no":"11","total_money":"2,013,112,375","win_num":"159","bet_num":"173","status":"2","times_id":"171513","draw_time_full":"2019-04-20 15:33:30","my_total_money":0,"my_win_money":0},{"number":"2416561","draw_time":"04-20 15:30:00","result":"01,12,20,21,28,31,32,41,42,44,46,47,48,51,53,64,65,70,72,74","win_no":"7","total_money":"2,095,831,798","win_num":"166","bet_num":"182","status":"2","times_id":"171512","draw_time_full":"2019-04-20 15:30:00","my_total_money":0,"my_win_money":0},{"number":"2416560","draw_time":"04-20 15:26:30","result":"01,02,08,09,11,13,20,21,24,30,32,45,50,52,57,64,66,67,72,79","win_no":"6","total_money":"2,095,786,075","win_num":"170","bet_num":"181","status":"2","times_id":"171511","draw_time_full":"2019-04-20 15:26:30","my_total_money":0,"my_win_money":0},{"number":"2416559","draw_time":"04-20 15:23:00","result":"04,20,22,27,28,29,31,33,35,36,38,40,42,44,63,64,65,74,77,80","win_no":"7","total_money":"2,096,279,454","win_num":"173","bet_num":"182","status":"2","times_id":"171510","draw_time_full":"2019-04-20 15:23:00","my_total_money":0,"my_win_money":0},{"number":"2416558","draw_time":"04-20 15:19:30","result":"06,09,11,13,31,37,40,44,48,50,51,52,56,57,60,62,68,70,72,73","win_no":"9","total_money":"2,061,098,847","win_num":"172","bet_num":"178","status":"2","times_id":"171509","draw_time_full":"2019-04-20 15:19:30","my_total_money":0,"my_win_money":0},{"number":"2416557","draw_time":"04-20 15:16:00","result":"09,10,15,17,27,29,32,44,46,50,52,55,59,60,61,67,70,77,78,80","win_no":"3","total_money":"2,035,824,150","win_num":"154","bet_num":"175","status":"2","times_id":"171508","draw_time_full":"2019-04-20 15:16:00","my_total_money":0,"my_win_money":0},{"number":"2416556","draw_time":"04-20 15:12:30","result":"05,08,10,15,19,20,21,26,36,40,41,52,57,59,67,68,72,74,76,78","win_no":"5","total_money":"2,001,432,900","win_num":"159","bet_num":"173","status":"2","times_id":"171507","draw_time_full":"2019-04-20 15:12:30","my_total_money":0,"my_win_money":0},{"number":"2416555","draw_time":"04-20 15:09:00","result":"07,13,14,16,18,22,25,30,35,38,40,41,43,54,55,58,64,70,73,77","win_no":"6","total_money":"2,072,699,475","win_num":"168","bet_num":"178","status":"2","times_id":"171506","draw_time_full":"2019-04-20 15:09:00","my_total_money":0,"my_win_money":0},{"number":"2416554","draw_time":"04-20 15:05:30","result":"10,11,12,14,22,25,34,36,37,43,46,47,53,55,62,65,66,69,70,77","win_no":"5","total_money":"2,071,989,525","win_num":"169","bet_num":"178","status":"2","times_id":"171505","draw_time_full":"2019-04-20 15:05:30","my_total_money":0,"my_win_money":0},{"number":"2416553","draw_time":"04-20 15:02:00","result":"05,07,09,12,24,25,26,29,35,36,40,42,47,52,54,57,63,65,71,72","win_no":"7","total_money":"2,013,922,722","win_num":"159","bet_num":"175","status":"2","times_id":"171504","draw_time_full":"2019-04-20 15:02:00","my_total_money":0,"my_win_money":0}],"total_page":100},"dayCount":{"win_num":"0","betting":0,"scale":"0%"},"isAuto":"0"}}';
    /**
    * 游戏页面显示数据
    */
    public function data()
    {   
        if($this->request->isPost()){
            $post=$this->request->post();
            $gid=$post['gid'];
            
            switch($gid){
                case 1:
                    $page=isset($post['page'])?$post['page']:1;
                    $offset=20*($page-1);
                    $game=get_game($gid);
                    $code=$game['code'];
                    
                    $data['code']=200;
                    $data['msg']='SUCCESS';
           
                    $current=Db::name('game_xybjl')->where('period','thisTimes')->find();

                    //上期开奖的
                    $prior_id=$current['id']-1;
                    $prior=Db::name('game_xybjl')->where('id',$prior_id)->find();
                    $data_=array();
                    $data_['result']=$prior['desc'];
                    if($prior['result']=='PLAYER'){
                        $data_['win_no']=2;
                    }elseif($prior['result']=='BANKER'){
                        $data_['win_no']=1;
                    }elseif($prior['result']=='TIE'){
                        $data_['win_no']=3;
                    }
                    $data_['number']=$prior['id'];
                    $_data['prevTimes']=$data_;
                    
                    //本次即将开奖的
                    $data__['number']=$current['id'];
                    $data__['draw_time']=$current['open_time'];
                    $data__['id']=$current['id'];
                    $data__['stop_time']=50;
                    $data__['kj_time']=54;
                    $data__['is_change']=true;

                    $_data['thisTimes']=$data__;

                    $lists=collection(Db::name('game_xybjl')->order('id desc')->limit($offset,20)->select())->toArray();
                    $list1=array();
                    $lists_=array();
                    foreach($lists as $l){
                        $list1['number']=$l['id'];
                        $list1['draw_time']=date('m-d H:i:s',$l['open_time']);
                        $list1['result']=$l['desc'];
                        $list1['win_no']=$l['result']=='PLAYER'?2:(($l['result']=='BANKER')?1:3);
                        $list1['total_money']=0;//所有用户投注的金币总和
                        $list1['win_num']=12; //本期投注中奖人数
                        $list1['bet_num']=171;//本期投注人数
                        $list1['status']=$l['status'];
                        $list1['times_id']=$l['id'];
                        $list1['draw_time_full']=date('Y-m-d H:i:s',$l['open_time']);
                        $list1['my_total_money']=0;//本人投注的本期总金额
                        $list1['my_win_money']= 0;//本人投注的本期赢得金额
                        $lists_[]=$list1;
                    }
                    $_data['timesLists']['lists']=$lists_;

                    $count=Db::name('game_xybjl')->count('id');
                    $total_page=ceil($count/20);
                    $_data['timesLists']['total_page']=$total_page;

                    $_data['dayCount']['win_num']=0;//本人今日所有投注游戏赢取金币数（包括亏损如-99）
                    $_data['dayCount']['betting']=0;//本人今日参与本游戏的期数
                    $_data['dayCount']['scale']=0; //本人今日参与此游戏的或胜率

                    $_data['is_auto']=0;

                    $data['data']=$_data;

                    echo json_encode($data);exit;
                case 2:
                    
            }
       }
    }

    //根据gid获取对应游戏开奖信息
    public function getGameInfo($gid)
    {   
        $game=array();
        $game=$this->gameModel->where('id',$gid)->find();
        return $game;
    }
    

    //走势图
    public function chart()
    {
        return $this->fetch();
    }

    //自动投注
    public function auto()
    {
        return $this->fetch();
    }

    //盈利统计
    public function total()
    {
        return $this->fetch();
    }

    //编辑模式
    public function mode()
    {   
        $this->assign("gtag",$this->game['gtag']);
        $this->assign("ntype",$this->game['ntype']);
        $this->assign("gtype",$this->game['gtype']);
        return $this->fetch();
    }

    //投注记录
    public function record()
    {   
        $game=$this->gameModel->where('id',$this->gid)->find();
        $this->assign("gtag",$game['gtag']);
        $this->assign("ntype",$game['ntype']);
        $map['game_id']=$this->gid;
        $map['user_id']=$this->uid;
        $bids=$this->userBidModel->where($map)->paginate(10,false,['query'=>$this->request->param()]);
        $this->assign('bids',$bids);
        return $this->fetch();
    }

    //游戏规则
    public function intro()
    {
        return $this->fetch();
    }

    //获取投标记录
    //$json='{"code":200,"msg":"SUCCESS","data":{"list":[{"times_id":"1279163","draw_time":"04-26 22:52:30","result":"{\"banker\":[\"12c\",\"4c\",\"3d\"],\"player\":[\"13b\",\"11d\",\"7c\"]}","number":"1379163","win_no":"3","total_money":"150","win_money":"523","win_count":"373"},{"times_id":"1278861","draw_time":"04-26 20:21:30","result":"{\"banker\":[\"6b\",\"12c\"],\"player\":[\"13c\",\"9d\"]}","number":"1378861","win_no":"2","total_money":"110","win_money":"108","win_count":"-2"}],"total_page":1}}';
    public function get_record()
    {   
        if($this->request->isPost()){
            $post=$this->request->post();
            $uid=$this->uid;
            $map['user_id']=$uid;
            $map['game_id']=$post['gid'];
            $page=isset($post['page'])?$post['page']:1;
            $offset=($page-1)*10;
            $rows=collection($this->userBidModel->where($map)->order('id desc')->limit($offset,10)->select())->toArray();
            $total_page=ceil(sizeof($rows)/10);
            $data=array();
            $data['code']=200;
            $data['msg']='SUCCESS';
            $rows_a=array();
            $rows_b=array();
            foreach($rows as $v){
                $rows_b=array();
                $rows_b['times_id']=$v['game_number'];
                $zz=get_game_detail($v['game_id'],$v['game_number']);
                $rows_b['draw_time']=date('Y-m-d H:i:s',$zz['open_time']);
                if(empty($zz['desc'])) continue; //还未开奖的一期，已下注，不记入下注记录
                $rows_b['result']=$zz['desc'];
                $rows_b['number']=$v['game_number'];
                $rows_b['win_no']=$zz['result']=='PLAYER'?2:($zz['result']=='BANKER'?1:3);
                $rows_b['total_money']=$v['bidmoney'];
                $rows_b['win_money']=!empty($v['prizeinfo'])?array_sum(json_decode($v['prizeinfo'],true)):0;
                $rows_b['win_count']=$rows_b['win_money']-$rows_b['total_money'];
                $rows_a[]=$rows_b;
            }
            $data['data']['list']=$rows_a;
            $data['data']['total_page']=$total_page;
            echo json_encode($data);exit;
        }
    }

    //获取走势图
    public function get_chart()
    {
        $str = <<<EOT
        <table class="table_list" cellspacing="0px" style="border-collapse:collapse;width:1200px;">
            <tbody>
            <tr bgcolor="#fbfbfb">
                <th colspan="41">走势图 <select id="sltNum">
                    <option value="100" selected="selected" >最新100期</option>
                    <option value="200"  >最新200期</option>
                    <option value="300"  >最新300期</option>
                    <option value="400"  >最新400期</option>
                    <option value="500"  >最新500期</option>
                </select></th>
            </tr>
            <tr class="timeh">
                <th colspan="2"><b class="black777">标准次数</b></th>
                <th>2</th><th>5</th><th>8</th><th>11</th><th>14</th><th>16</th><th>14</th><th>11</th><th>8</th><th>5</th><th>2</th><th>50</th><th>50</th><th>56</th><th>44</th><th>50</th><th>50</th>    </tr>    <tr class="timeh">
                <th colspan="2"><b class="black777">实际次数</b></th>
                <th>3</th><th>7</th><th>7</th><th>10</th><th>12</th><th>12</th><th>12</th><th>14</th><th>18</th><th>4</th><th>1</th><th>47</th><th>53</th><th>60</th><th>40</th><th>121</th><th>79</th>        <th colspan="2"><b class="black777">尾数</b></th>
                <th colspan="3"><b class="black777">余数</b></th>
            </tr>
            <tr class="font_color_2" bgcolor="#e3f0ff">
                <th width="50">期号</th>
                <th width="62">时间</th>
                <th width="22">2</th><th width="22">3</th><th width="22">4</th><th width="22">5</th><th width="22">6</th><th width="22">7</th><th width="22">8</th><th width="22">9</th><th width="22">10</th><th width="22">11</th><th width="22">12</th>        <th width="22">单</th>
                <th width="22">双</th>
                <th width="22">中</th>
                <th width="22">边</th>
                <th width="22">大</th>
                <th width="22">小</th>
                <th width="22">大</th>
                <th width="22">小</th>
                <th width="22">3/</th>
                <th width="22">4/</th>
                <th width="22">5/</th>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td class="tdbg3">2416621</td>
                <td class="black777">04-20 19:00</td>
                <td class="bgnum"></td><td class="bgnum"></td><td class="bgnum"></td><td ></td><td ></td><td ></td><td ><em class="final"><i>8</i></em></td><td ></td><td class="bgnum"></td><td class="bgnum"></td><td class="bgnum"></td>            <td >单</td>
                <td class="bgkai02">双</td>
                <td class="bgkai03">中</td>
                <td >边</td>
                <td class="bgkai05">大</td>
                <td >小</td>
                <td class="bgkai07">大</td>
                <td >小</td>
                <td class="black333">2</td>
                <td class="black333">0</td>
                <td class="black333">3</td>
            </tr>
            <tr>
                <td class="tdbg3">2416620</td>
                <td class="black777">04-20 18:56</td>
                <td class="bgnum"></td><td class="bgnum"></td><td class="bgnum"></td><td ></td><td ></td><td ></td><td ></td><td ></td><td class="bgnum"><em class="final"><i>10</i></em></td><td class="bgnum"></td><td class="bgnum"></td>            <td >单</td>
                <td class="bgkai02">双</td>
                <td >中</td>
                <td class="bgkai04">边</td>
                <td class="bgkai05">大</td>
                <td >小</td>
                <td >大</td>
                <td class="bgkai08">小</td>
                <td class="black333">1</td>
                <td class="black333">2</td>
                <td class="black333">0</td>
            </tr>
            <tr>
                <td class="tdbg3">2416619</td>
                <td class="black777">04-20 18:53</td>
                <td class="bgnum"></td><td class="bgnum"><em class="final"><i>3</i></em></td><td class="bgnum"></td><td ></td><td ></td><td ></td><td ></td><td ></td><td class="bgnum"></td><td class="bgnum"></td><td class="bgnum"></td>            <td class="bgkai01">单</td>
                <td >双</td>
                <td >中</td>
                <td class="bgkai04">边</td>
                <td >大</td>
                <td class="bgkai06">小</td>
                <td >大</td>
                <td class="bgkai08">小</td>
                <td class="black333">0</td>
                <td class="black333">3</td>
                <td class="black333">3</td>
            </tr>
            <tr>
                <td class="tdbg3">2416618</td>
                <td class="black777">04-20 18:49</td>
                <td class="bgnum"></td><td class="bgnum"></td><td class="bgnum"></td><td ></td><td ><em class="final"><i>6</i></em></td><td ></td><td ></td><td ></td><td class="bgnum"></td><td class="bgnum"></td><td class="bgnum"></td>            <td >单</td>
                <td class="bgkai02">双</td>
                <td class="bgkai03">中</td>
                <td >边</td>
                <td >大</td>
                <td class="bgkai06">小</td>
                <td class="bgkai07">大</td>
                <td >小</td>
                <td class="black333">0</td>
                <td class="black333">2</td>
                <td class="black333">1</td>
            </tr>
            </tbody>
        </table>
EOT;
    echo $str;exit;
    }

    //获取投注信息
    //{"code":200,"msg":"SUCCESS","data":{"betting_num":"110","win_num":"108","order_num":"1378861","time":"2019-04-26 20:21:30","nolists":{"f1":{"no":"\u5e84\u8d62","scale_init":"2.2400","scale_draw":"2.2355","scale_prev":"2.2355","win_num":0,"bet_num":"50"},"f2":{"no":"\u95f2\u8d62","scale_init":"2.1800","scale_draw":"2.1756","scale_prev":"2.1756","win_num":"108","bet_num":"50","is_win":1},"f3":{"no":"\u548c","scale_init":"10.5000","scale_draw":"10.4790","scale_prev":"10.4791","win_num":0,"bet_num":"10"}}}}
    public function get_bet_info()
    {   
        if($this->request->isPost()){
            $post=$this->request->post();
            $gid=$post['gid'];
            $oid=$post['oid'];
            $map['game_id']=$gid;
            $map['game_number']=$oid;
            $row=$this->userBidModel->where($map)->find();

            $list['code']=200;
            $list['msg']='SUCCESS';
           
            $data['betting_num']=isset($row['bidmoney'])?$row['bidmoney']:0;
            $data['win_num']=!empty($row['prizeinfo'])?array_sum(json_decode($row['prizeinfo'],true)):0;
            $data['order_num']=$oid;
            $zz=get_game_detail($gid,$oid);
            $zz_prior=get_game_detail($gid,$oid-1);
            $data['time']=date('Y-m-d H:i:s',$zz['open_time']);
            $game=get_game($gid);
            $scale_init=Config::get('scale_init');
            $scale_init_=$scale_init[$game['code']];
            $f=array();
            $arr=array();

            $scale_draw=json_decode($zz['bidrate'],true);
            $scale_prev=json_decode($zz_prior['bidrate'],true);
            
            $prizeinfo=json_decode($row['prizeinfo'],true);
            $arr=json_decode($row['bidinfo'],true);
            foreach($arr as $k=>$v){
                
                $f["$k"]['no']=key($v);
                $f["$k"]['scale_init;']=isset($scale_init_["$k"])?$scale_init_["$k"]:'';
                $f["$k"]['scale_draw']=isset($scale_draw["$k"])?$scale_draw["$k"]:'';
                $f["$k"]['scale_prev']=isset($scale_prev["$k"])?$scale_prev["$k"]:'';
                $win_num=$prizeinfo[$k];
                $f["$k"]['win_num']=$win_num;
                if($win_num>0) $f["$k"]['is_win']=1;
                $f["$k"]['bet_num']=array_values($v)[0];
            }
            $data['nolists']=$f;
            $list['data']=$data;
            echo json_encode($list);exit;
        }
        
    }

    //投注界面
    public function betting()
    {   
        $oid = $this->request->has('oid') ? $this->request->param('oid', 0, 'intval') : 0; //彩票期号
        $this->assign('oid',$oid);


        $gid=$this->gid;
        switch($gid){
            case 1: //幸运百家乐（对于百家乐，期号和ID都是一个值ID,所以...
                //开奖剩余时间
                $open_time=Db::name('game_xybjl')->where('id',$oid)->value('open_time');
                $stop_time=$open_time-time();
                $this->assign('stop_time',$stop_time);
                return $this->fetch('game/betting_xybjl');
                break;
            case 2:
                return $this->fetch('game/betting_xy10');
        } 

        
        
    }

    //投注
    public function betting_submit()
    {   
        if($this->request->isPost()){
            
            $post=$this->request->post();
            $gid=$post['gid'];
            $oid=$post['oid'];
            $betting=$post['betting'];
            
            //$betting_money=array_sum($betting); //betting 是array ,下注的总数
            $betting_money=0;
            foreach($betting as $v){
                $temp=array_values($v);
                $betting_money+=$temp[0];
            }
            
            $code=$this->gameModel->where('id',$gid)->value('code');

            $open_time=Db::name('game_'.$code)->where('id',$oid)->value('open_time');
            $stop_time=$open_time-time();
            if(empty(Session::get('uid'))){
                $data['code']=302;
                $data['msg']='未登录，或登录超时，请重新登录！';
                echo json_encode($data);exit;
            }else if($stop_time<=0){
                $data['msg']='当期已停止下注,请选择其它期!';
                $data['code']=501;
                echo json_encode($data);exit;
            }else if($betting_money>$this->user['coin']){
                $data['msg']='您的余额不足，请充值!';
                $data['code']=901;
                echo json_encode($data);exit;
            }else{
                $result_trans=true;
                Db::startTrans();
                try{
                    //用户投注信息
                    $uid=$this->uid;
                    $data_bid=array();
                    $data_bid['game_id']=$gid;
                    $data_bid['game_number']=$oid;
                    $data_bid['bidinfo']=json_encode($betting);
                    $data_bid['bidmoney']=$betting_money;
                    $data_bid['create_time']=time();
                    $data_bid['user_id']=$uid;
                    Db::name('user_bid')->where('user_id',$uid)->insert($data_bid);

                    //用户余额减少
                    $this->userModel->where('uid',$uid)->setDec('coin',$betting_money);

                    //用户日志
                    $coin=$this->userModel->where('uid',$uid)->value('coin');
                    $game=get_game($gid);
                    $ret6=adduserlog($this->uid,$game['name'].'第'.$oid.'期,手动投注'.$betting_money.'金币',-$betting_money,0,$coin,'bet');//bet类型：游戏下注

                    //更改对应游戏表的投注总额，投注人数
                    Db::name('game_'.$code)->where('id',$oid)->setInc('bet_num',1);
                    Db::name('game_'.$code)->where('id',$oid)->setInc('total_money',$betting_money);
                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    $result_trans=false;
                    // 回滚事务
                    Db::rollback();
                    
                    
                }

                if($result_trans){
                    $data['code']=200;
                    $data['msg']='投注成功！';
                    echo json_encode($data);exit;
                }else{
                     $data['code']=800;
                    $data['msg']='投注失败！';
                    echo json_encode($data);exit;
                }
            }
       }
    }

}