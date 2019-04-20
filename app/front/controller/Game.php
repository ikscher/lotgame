<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\admin\model\Article as articleModel;
class Game extends Site
{   
	private $articleModel;
	// private $site_name;
	public function _initialize()
    {   
        parent::_initialize();
        $this->articleModel = new articleModel();
        // $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
    }
    
    //排行榜
    public function rank()
    {
        return $this->fetch();
    }

    public function index(){
        return $this->fetch();
    }

    public function data()
    {
        $json='{"code":200,"msg":"SUCCESS","data":{"prevTimes":{"result":"06,12,14,15,19,25,27,30,32,34,38,42,44,56,60,63,64,69,76,77","win_no":"7","number":"2416568"},"thisTimes":{"number":"2416569","draw_time":"1555747080","id":"171520","stop_time":2,"kj_time":52,"is_change":false},"timesLists":{"lists":[{"number":"2416572","draw_time":"04-20 16:08:30","result":null,"win_no":null,"total_money":0,"win_num":"0","bet_num":"0","status":"1","times_id":"171523","draw_time_full":"2019-04-20 16:08:30","my_total_money":0,"my_win_money":0},{"number":"2416571","draw_time":"04-20 16:05:00","result":null,"win_no":null,"total_money":0,"win_num":"0","bet_num":"0","status":"1","times_id":"171522","draw_time_full":"2019-04-20 16:05:00","my_total_money":0,"my_win_money":0},{"number":"2416570","draw_time":"04-20 16:01:30","result":null,"win_no":null,"total_money":0,"win_num":"0","bet_num":"0","status":"1","times_id":"171521","draw_time_full":"2019-04-20 16:01:30","my_total_money":0,"my_win_money":0},{"number":"2416569","draw_time":"04-20 15:58:00","result":null,"win_no":null,"total_money":"2,025,976,438","win_num":"0","bet_num":"176","status":"1","times_id":"171520","draw_time_full":"2019-04-20 15:58:00","my_total_money":0,"my_win_money":0},{"number":"2416568","draw_time":"04-20 15:54:30","result":"06,12,14,15,19,25,27,30,32,34,38,42,44,56,60,63,64,69,76,77","win_no":"7","total_money":"2,094,404,689","win_num":"173","bet_num":"182","status":"2","times_id":"171519","draw_time_full":"2019-04-20 15:54:30","my_total_money":0,"my_win_money":0},{"number":"2416567","draw_time":"04-20 15:51:00","result":"08,09,11,13,19,21,22,27,30,43,44,45,50,51,52,62,65,71,75,79","win_no":"4","total_money":"2,001,458,148","win_num":"164","bet_num":"173","status":"2","times_id":"171518","draw_time_full":"2019-04-20 15:51:00","my_total_money":0,"my_win_money":0},{"number":"2416566","draw_time":"04-20 15:47:30","result":"03,16,22,23,27,32,38,42,43,47,49,55,58,60,63,64,65,69,72,79","win_no":"9","total_money":"2,047,554,474","win_num":"171","bet_num":"177","status":"2","times_id":"171517","draw_time_full":"2019-04-20 15:47:30","my_total_money":0,"my_win_money":0},{"number":"2416565","draw_time":"04-20 15:44:00","result":"06,08,17,21,22,30,31,34,39,40,48,52,54,55,58,60,65,68,72,80","win_no":"4","total_money":"2,036,175,300","win_num":"168","bet_num":"175","status":"2","times_id":"171516","draw_time_full":"2019-04-20 15:44:00","my_total_money":0,"my_win_money":0},{"number":"2416564","draw_time":"04-20 15:40:30","result":"06,07,10,11,13,15,20,23,31,32,44,45,47,50,53,61,62,67,70,78","win_no":"10","total_money":"2,025,855,875","win_num":"155","bet_num":"174","status":"2","times_id":"171515","draw_time_full":"2019-04-20 15:40:30","my_total_money":0,"my_win_money":0},{"number":"2416563","draw_time":"04-20 15:37:00","result":"03,11,14,16,17,20,26,28,33,37,47,50,51,58,60,63,65,71,73,77","win_no":"8","total_money":"2,060,708,499","win_num":"172","bet_num":"179","status":"2","times_id":"171514","draw_time_full":"2019-04-20 15:37:00","my_total_money":0,"my_win_money":0},{"number":"2416562","draw_time":"04-20 15:33:30","result":"02,04,08,09,15,18,20,26,29,33,43,45,50,54,56,59,61,76,77,78","win_no":"11","total_money":"2,013,112,375","win_num":"159","bet_num":"173","status":"2","times_id":"171513","draw_time_full":"2019-04-20 15:33:30","my_total_money":0,"my_win_money":0},{"number":"2416561","draw_time":"04-20 15:30:00","result":"01,12,20,21,28,31,32,41,42,44,46,47,48,51,53,64,65,70,72,74","win_no":"7","total_money":"2,095,831,798","win_num":"166","bet_num":"182","status":"2","times_id":"171512","draw_time_full":"2019-04-20 15:30:00","my_total_money":0,"my_win_money":0},{"number":"2416560","draw_time":"04-20 15:26:30","result":"01,02,08,09,11,13,20,21,24,30,32,45,50,52,57,64,66,67,72,79","win_no":"6","total_money":"2,095,786,075","win_num":"170","bet_num":"181","status":"2","times_id":"171511","draw_time_full":"2019-04-20 15:26:30","my_total_money":0,"my_win_money":0},{"number":"2416559","draw_time":"04-20 15:23:00","result":"04,20,22,27,28,29,31,33,35,36,38,40,42,44,63,64,65,74,77,80","win_no":"7","total_money":"2,096,279,454","win_num":"173","bet_num":"182","status":"2","times_id":"171510","draw_time_full":"2019-04-20 15:23:00","my_total_money":0,"my_win_money":0},{"number":"2416558","draw_time":"04-20 15:19:30","result":"06,09,11,13,31,37,40,44,48,50,51,52,56,57,60,62,68,70,72,73","win_no":"9","total_money":"2,061,098,847","win_num":"172","bet_num":"178","status":"2","times_id":"171509","draw_time_full":"2019-04-20 15:19:30","my_total_money":0,"my_win_money":0},{"number":"2416557","draw_time":"04-20 15:16:00","result":"09,10,15,17,27,29,32,44,46,50,52,55,59,60,61,67,70,77,78,80","win_no":"3","total_money":"2,035,824,150","win_num":"154","bet_num":"175","status":"2","times_id":"171508","draw_time_full":"2019-04-20 15:16:00","my_total_money":0,"my_win_money":0},{"number":"2416556","draw_time":"04-20 15:12:30","result":"05,08,10,15,19,20,21,26,36,40,41,52,57,59,67,68,72,74,76,78","win_no":"5","total_money":"2,001,432,900","win_num":"159","bet_num":"173","status":"2","times_id":"171507","draw_time_full":"2019-04-20 15:12:30","my_total_money":0,"my_win_money":0},{"number":"2416555","draw_time":"04-20 15:09:00","result":"07,13,14,16,18,22,25,30,35,38,40,41,43,54,55,58,64,70,73,77","win_no":"6","total_money":"2,072,699,475","win_num":"168","bet_num":"178","status":"2","times_id":"171506","draw_time_full":"2019-04-20 15:09:00","my_total_money":0,"my_win_money":0},{"number":"2416554","draw_time":"04-20 15:05:30","result":"10,11,12,14,22,25,34,36,37,43,46,47,53,55,62,65,66,69,70,77","win_no":"5","total_money":"2,071,989,525","win_num":"169","bet_num":"178","status":"2","times_id":"171505","draw_time_full":"2019-04-20 15:05:30","my_total_money":0,"my_win_money":0},{"number":"2416553","draw_time":"04-20 15:02:00","result":"05,07,09,12,24,25,26,29,35,36,40,42,47,52,54,57,63,65,71,72","win_no":"7","total_money":"2,013,922,722","win_num":"159","bet_num":"175","status":"2","times_id":"171504","draw_time_full":"2019-04-20 15:02:00","my_total_money":0,"my_win_money":0}],"total_page":100},"dayCount":{"win_num":"0","betting":0,"scale":"0%"},"isAuto":"0"}}';
        echo $json;exit;
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
        return $this->fetch();
    }

    //投注记录
    public function record()
    {
        return $this->fetch();
    }

    //游戏规则
    public function intro()
    {
        return $this->fetch();
    }

    //获取投标记录
    public function get_record()
    {
        $json='{"code":200,"msg":"SUCCESS","data":{"list":[{"times_id":"171539","draw_time":"04-20 17:04:30","result":"02,03,04,14,16,22,33,37,44,50,52,56,61,62,64,70,71,72,73,75","number":"2416588","win_no":"3","total_money":"100","win_money":"0","win_count":"-100"}],"total_page":1}}';
        echo $json;exit;
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
    public function get_bet_info()
    {
        $str='{"code":200,"msg":"SUCCESS","data":{"betting_num":"100","win_num":"0","order_num":"2416588","time":"2019-04-20 17:04:30","nolists":{"f1":{"no":"\u8c79","scale_init":"100.0000","scale_draw":"99.4908","scale_prev":"99.4877","win_num":0,"bet_num":"0"},"f2":{"no":"\u987a","scale_init":"16.6700","scale_draw":"16.5866","scale_prev":"16.5865","win_num":0,"bet_num":"50"},"f3":{"no":"\u5bf9","scale_init":"3.7000","scale_draw":"3.6815","scale_prev":"3.6815","win_num":"0","bet_num":"0","is_win":1},"f4":{"no":"\u534a","scale_init":"2.7800","scale_draw":"2.7661","scale_prev":"2.7661","win_num":0,"bet_num":"50"},"f5":{"no":"\u6742","scale_init":"3.3300","scale_draw":"3.3134","scale_prev":"3.3134","win_num":0,"bet_num":"0"}}}}';
        echo $str;exit;
    }

    //投注
    public function betting()
    {
        return $this->fetch();
    }
}