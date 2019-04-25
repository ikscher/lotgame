var page = 1;
var stopSec, kjSec, isAuto, curNo, timerid, totalPage;
var BSDBZTEXT = {'1':'豹','2':'顺','3':'对','4':'半','5':'杂'};
var LHTEXT = {'1':'龙','2':'虎'};
var ajax_status = null;

getContent();

function getContent(){
    if(ajax_status != null){
        ajax_status.abort();
    }
    ajax_status = $.ajax({
        url: '/game/data',//game/data
        type: 'post',
        dataType: 'json',
        data: {
            gid: GID,
            page: page
        },
        success: function(map){
            // console.log(map);
            ajax_status = null;
            if(map.code == 200){
                renderPage(map.data);
            }else if(map.code == 302){
                window.location.href = '/index/login';
            }
        }
    })
}

function renderPage(data){

    renderBox();//基础框架
    renderPrevNo(data.prevTimes);//上期信息
    renderNoList(data.timesLists.lists);//结果列表
    totalPage = data.timesLists.total_page;//总页数
    isAuto = data.isAuto;//是否开启自动投注
    renderPager();//分页
    renderDayCount(data.dayCount);//今日盈亏
    /*本期信息*/
    var thisNo = data.thisTimes;
    stopSec = thisNo.stop_time;
    kjSec = thisNo.kj_time;
    curNo = thisNo.number;
    if(curNo){
        clearInterval(timerid);//清除定时
        timerid = setInterval('refreshContent(1)',1000);
        refreshContent();
    }else{
        $('#liTimer').html('暂停开奖!');
        setTimeout(function(){
            getContent();
        }, 1000*60)
    }

}

function renderBox(){
    var html = '';
    html += '<div class="game-prev after" id="game-prev"></div>';
    html += '<div class="game-this after">';
    html += '   <div class="count-down" id="liTimer"></div>';
    html += '   <div class="day-count" id="dayCount"></div>';
    html += '   <div class="warning-tone"><img id="sond_offon" src="" onclick="changsound(1)"></div>';
    html += '</div>';
    html += '<div class="game-times"">';
    html += '   <table>';
    html += '       <thead>';
    html += '           <tr>';
    html += '               <th>期号</th>';
    html += '               <th>开奖时间</th>';
    if(GID == 1 || GID == 44){
        html += '           <th>（庄）开奖结果（闲）</th>';
    }else{
        html += '           <th>开奖结果</th>';
    }
    if(GTAG == 'basic' || GTAG == 'virtual'){
        html += '           <th>金币总数</th>';
        html += '           <th>中奖人数</th>';
    }
    if(GTAG == 'ww'){
        html += '           <th>中奖</th>';
    }

    if(GTAG == 'sc'){
        if(GID == 37){
            var colspan = 8;
        }
        if(GID == 38){
            var colspan = 7;
        }
        html += '           <th colspan="' + colspan + '">中奖</th>';
    }
    html += '               <th>投注额/中奖额</th>';
    html += '               <th>投注</th>';
    html += '           </tr>';
    html += '       </thead>';
    html += '       <tbody id="NoList"></tbody>';
    html += '   </table>';
    html += '';
    html += '<div class="page" id="pager"></div>';
    $('#page-wrap').html(html);
    changsound();
}

function refreshContent(s){
    if (kjSec > SOUNDSJV){
        SOUNDSJV = kjSec;
        playsund();
    }else{
        SOUNDSJV = kjSec;
    }
    if(kjSec <= 0){
        if(kjSec <= -3 && Math.abs(kjSec) % 3 == 0){
            $('#liTimer').html('Loading......');
            if(s){
                page = 1;

                getContent();
            }

        } else {
            $('#liTimer').html('第<b>' + curNo + '</b>期 正在开奖，请稍后!');
        }
        kjSec--;
    }else{
        if(stopSec == 0){
            /*修改列表按钮状态*/
            $('#scur_' + curNo).html('<a class="ing">开奖中</a>');
        }
        if(stopSec > 0){
            $('#liTimer').html('第<b>' +curNo+'</b>期 还有<b>' + stopSec + '</b>秒停止下注!');
        } else {
            $('#liTimer').html('第<b>'+curNo+'</b>期 停止下注，还有<b> ' + kjSec + ' </b>秒开奖!');
        }
        kjSec--;
        stopSec--;
    }
}

function renderDayCount(data){
    if(parseInt(data.win_num) > 0){
        var color = 'win_color';
    }else if(parseInt(data.win_num) < 0){
        var color = 'lose_color';
    }else{
        var color = '';
    }
    //<div class="day-count">今日盈亏：<i class="r">390</i> 参与：<i>1</i>期 胜率：<i>100%</i></div>
    $('#dayCount').html('今日盈亏：<i class="' + color + '">' + data.win_num + '</i> 参与：<i>' + data.betting + '</i>期  胜率：<i>' + data.scale + '</i>');
}

function renderPrevNo(data){
    data = data ? data : {};
    data.number = data.number ? data.number : ' ';
    data.result = data.result ? data.result : ' ';
    var html = '';
    var result = GID == 1 || GID == 44 ? '' : data.result;
    var draw_source = NTYPE == 'js' ? '系统开奖：' : '第三方开奖：';
    var prevRes = fetchPrevRes(data);
    html += '<div class="game-prev after">';
    html += '   <div class="times-no">';
    html += '       <h2>第' + data.number + '期</h2>';
    html += '       <p>开奖结果</p>';
    html += '   </div>';
    html += '   <div class="result">';
    html += '       <div class="base-data">';
    html += '           <label>' + draw_source + '</label>';
    html += '           <span>' + result + '</span>';
    html += '       </div>';
    html += '       <div class="res-data after">' + prevRes + '</div>';
    html += '   </div>';
    html += '</div>';
    $('#game-prev').html(html);
}


function fetchPrevRes(data){
    var html = '';

    switch (GID){
        case 26 :
        case 19 :
            var res = data.result.split(',');
            html += '<div class="lis"><label>一区号码：</label><span>' + parseInt(res[0]) + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + data.win_no + '</span></div>';
            break;
        case 17 :
            html += '<div class="lis"><label>一区号码：</label><span>' + data.win_no + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + data.win_no + '</span></div>';
            break;
        case 34 :
        case 35 :
        case 36 :
        case 45 :
        case 46 :
            var res = dyeResult(data.result);
            html += '<div class="lis"><label>一区号码：</label><span>' + res.first_value + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + data.win_no + '</span></div>';
            break;
        case 2 :
        case 7 :
        case 21 :
            var res = data.result.split(',');
            html += '<div class="lis"><label>一区号码：</label><span>' + parseInt(res[0]) + '</span></div>';
            html += '<div class="lis"><label>二区号码：</label><span>' + parseInt(res[1]) + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + data.win_no + '</span></div>';
            break;
        case 3 :
        case 4 :
        case 5 :
        case 18 :
        case 43 :
            var res = data.result.split(',');
            html += '<div class="lis"><label>一区号码：</label><span>' + parseInt(res[0]) + '</span></div>';
            html += '<div class="lis"><label>二区号码：</label><span>' + parseInt(res[1]) + '</span></div>';
            html += '<div class="lis"><label>三区号码：</label><span>' + parseInt(res[2]) + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + data.win_no + '</span></div>';
            break;
        case 6 :
            var res = data.result.split(',');
            html += '<div class="lis"><label>一区号码：</label><span>' + res[0] + '</span></div>';
            html += '<div class="lis"><label>二区号码：</label><span>' + res[1] + '</span></div>';
            html += '<div class="lis"><label>三区号码：</label><span>' + res[2] + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + BSDBZTEXT[data.win_no] + '</span></div>';
            break;
        case 9 :
        case 12 :
        case 16 :
        case 25 :
        case 42 :
            var res = dyeResult(data.result);
            html += '<div class="lis"><label>一区号码：</label><span>' + res.first_value + '</span></div>';
            html += '<div class="lis"><label>二区号码：</label><span>' + res.second_value + '</span></div>';
            html += '<div class="lis"><label>三区号码：</label><span>' + res.third_value + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + BSDBZTEXT[data.win_no] + '</span></div>';
            break;
        case 20 :
            var res = data.result.split(',');
            html += '<div class="lis"><label>一区号码：</label><span>' + parseInt(res[0]) + '</span></div>';
            html += '<div class="lis"><label>二区号码：</label><span>' + parseInt(res[9]) + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + LHTEXT[data.win_no] + '</span></div>';
            break;
        case 13 :
        case 22 :
        case 40 :
            var res = dyeResult(data.result);
            html += '<div class="lis"><label>一区号码：</label><span>' + res.first_value + '</span></div>';
            html += '<div class="lis"><label>二区号码：</label><span>' + res.second_value + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + data.win_no + '</span></div>';
            break;
        case 8 :
        case 10 :
        case 11 :
        case 14 :
        case 15 :
        case 23 :
        case 24 :
        case 27 :
        case 28 :
        case 29 :
        case 30 :
        case 31 :
        case 32 :
        case 33 :
        case 41 :
        case 39 :
        case 47 :
        case 48 :
        case 49 :
        case 50 :
        case 51 :
            var res = dyeResult(data.result);
            html += '<div class="lis"><label>一区号码：</label><span>' + res.first_value + '</span></div>';
            html += '<div class="lis"><label>二区号码：</label><span>' + res.second_value + '</span></div>';
            html += '<div class="lis"><label>三区号码：</label><span>' + res.third_value + '</span></div>';
            html += '<div class="lis"><label>结果：</label><span class="r">' + data.win_no + '</span></div>';
            break;
        case 1 :
        case 44 :
            var result = JSON.parse(data.result),
                banker = result.banker,
                player = result.player,
                win_no = data.win_no,
                span_player = '',
                span_banker = '';
            $.each(banker, function(i,o){
                span_banker += '<span class="bjl_res p' + o + '"></span>';
            })
            $.each(player, function(i,o){
                span_player += '<span class="bjl_res p' + o + '"></span>';
            })
            html += '<div class="lis bjl"><label>庄：</label>' + span_banker + '</div>';
            html += '<div class="lis bjl"><label>闲：</label>' + span_player + '</div>';
            html += '<div class="lis bjl"><label>结果：</label><span class="bjl_res pr' + win_no + '"></span></div>';
            break;
    }
    return html;
}

var NOList;
function renderNoList(data){
    console.log(data)
    NOList = data;
    var html = '';
    $.each(data, function(i, o){
        var bet = '';
        var rest = fetchRest(o, i);
        // console.log(rest);
        if(o.status == 1){
            bet = '<a class="bet" data-href="/game/betting?gid=' + GID + '&oid=' + o.times_id + '">投注</a>';
        }else if(o.status == 0){
            bet = '<a class="ing">开奖中</a>';
        }else{
            bet = '<a class="ed">已开奖</a>';
        }
        if(o.my_win_money !== 0){
            var my_win_money = o.my_win_money.replace(/,/g, "");
            var my_total_money = o.my_total_money.replace(/,/g, "");
            if(parseInt(my_win_money) > parseInt(my_total_money)){
                var winning = '<a class="win_color" href="/game/record?gid=' + GID + '">' + o.my_total_money + '/' + o.my_win_money + '</a>';
            }else{
                var winning = '<a class="lose_color" href="/game/record?gid=' + GID + '">' + o.my_total_money + '/' + o.my_win_money + '</a>';
            }

        }else{
            var winning = o.my_total_money + '/' + o.my_win_money + '';
        }
        html += '<tr>';
        html += '   <td>' + o.number + '</td>';
        html += '   <td>' + o.draw_time + '</td>';
        html += '   <td>' + rest + '</td>';
        if(GTAG == 'basic' || GTAG == 'virtual'){
            html += '   <td>' + o.total_money + '</td>';
            html += '   <td>' + o.win_num + '/' + o.bet_num + '</td>';
        }

        if(GTAG == 'ww'){
            var ww_span = '';
            $.each(o.win_no_ww, function(i, o){
                ww_span += '<span class="win_no_ww">' + o + '</span>';
            })
            html += '   <td>' + ww_span + '</td>';
        }

        if(GID == 37){

            var sc_span = getScResult(o.result);
            html += sc_span;
        }

        if(GID == 38){

            var sc_span = getCqsscResult(o.result);
            html += sc_span;
        }

        html += '   <td>' + winning + '</td>';
        html += '   <td id="scur_' + o.number + '">' + bet + '</td>';
        html += '</tr>';
    })
    $('#NoList').html(html);

    $('a.bet').on('click', function(){
        window.location.href = $(this).attr('data-href');
    })
}

function renderPager(){
    $("#pager").pager({
        pagenumber: page,
        pagecount: totalPage,
        buttonClickCallback: PageClick
    });
}
function PageClick(pageclickednumber) {
    page = pageclickednumber;
    $("#pager").pager({
        pagenumber: pageclickednumber,
        pagecount: totalPage,
        buttonClickCallback: PageClick
    });
    getContent();
}

function fetchRest(o, i){
    if(o.status != 2){
        return '';
    }
    var html = '';
    if(o.win_no == null){
        o.win_no = '';
    }
    switch(GTYPE){
        case 10:
            if(o.win_no != '') {
                if(GID == 34 || GID == 35 || GID == 36 || GID == 45||GID==46){
                    html += '<i class="mh m' + o.win_no + '"></i>';
                    html += '<a href="javascript:;" onclick="checkRes(' + i + ')" class="check">验证</a>';
                }else{
                    var result = o.result.split(',');
                    $.each(result, function (ii, oo) {
                        oo = parseInt(oo);
                        if (o.win_no == oo) {
                            html += '<em class="regular' + oo + '"></em>';
                        } else {
                            html += '<em class="light' + oo + '"></em>';
                        }
                    })
                }

            }
            break;
        case 11:
            if(o.win_no != ''){
                var res = dyeResult(o.result);
                html += '<i class="kj kj_' + res.first_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.second_value + '"></i>';
                html += '<i class="hdeng"></i>';
                html += '<i class="mh m' + o.win_no + '"></i>';
                if(GID != 2){
                    html += '<a href="javascript:;" onclick="checkRes(' + i + ')" class="check">验证</a>';
                }
            }
            break;
        case 16:
            if(o.win_no != ''){
                var res = dyeResult(o.result);
                html += '<i class="kj kj_' + res.first_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.second_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.third_value + '"></i>';
                html += '<i class="hdeng"></i>';
                html += '<i class="mh m' + o.win_no + '"></i>';
                if(GID != 3){
                    html += '<a href="javascript:;" onclick="checkRes(' + i + ')" class="check">验证</a>';
                }
            }
            break;
        case 22:
            if(o.win_no != '') {
                var result = o.result.split(',');
                $.each(result, function (ii, oo) {
                    if (ii < 3) {
                        html += '<em class="regular' + oo + '"></em>';

                    } else {
                        html += '<em class="light' + oo + '"></em>';
                    }
                })
                html += '<em class="final"><i>' + o.win_no + '</i></em>';
            }
            break;
        case 28:
        case 110:
        case 111:
        case 112:
            if(o.win_no != ''){
                // console.log(i);
                var res = dyeResult(o.result);
                html += '<i class="kj kj_' + res.first_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.second_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.third_value + '"></i>';
                html += '<i class="hdeng"></i>';
                html += '<i class="mh m' + o.win_no + '"></i>';
                if(GID != 5 && GID != 43){
                    html += '<a href="javascript:;" onclick="checkRes(' + i + ')" class="check">验证</a>';
                }
            }
            break;
        case 5:
            if(o.win_no != ''){
                var res = dyeResult(o.result);
                html += '<i class="kj kj_' + res.first_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.second_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.third_value + '"></i>';
                html += '<i class="hdeng"></i>';
                html += '<i class="zh z' + o.win_no + '"></i>';
                if(GID != 6){
                    html += '<a href="javascript:;" onclick="checkRes(' + i + ')" class="check">验证</a>';
                }
            }
            break;
        case 17:
            if(o.win_no != ''){
                var result = o.result.split(',');
                $.each(result, function(ii, oo){
                    if(ii < 2){
                        html += '<em class="regular' + oo + '"></em>';

                    }else{
                        html += '<em class="light' + oo + '"></em>';
                    }
                })
                html += '<em class="final"><i>' + o.win_no + '</i></em>';
            }
            break;
        case 2:
            if(o.win_no != ''){
                var result = o.result.split(',');
                $.each(result, function(ii, oo){
                    if(ii == 0 || ii == 9){
                        html += '<em class="regular' + oo + '"></em>';

                    }else{
                        html += '<em class="light' + oo + '"></em>';
                    }
                })
                html += '<i class="lh n' + o.win_no + '"></i>';
            }
            break;
        case 3:
            if(o.win_no != ''){
                var result = JSON.parse(o.result),
                    banker = result.banker,
                    player = result.player,
                    win_no = o.win_no,
                    span_player = '',
                    span_banker = '';
                $.each(banker, function(i,o){
                    span_banker += '<span class="bjl_res p' + o + '"></span>';
                })
                $.each(player, function(i,o){
                    span_player += '<span class="bjl_res p' + o + '"></span>';
                })
                html += '<div class="bjl_nolist_z">'+span_banker+'</div><div class="bjl_nolist_r"><span class="bjl_res pr' + win_no + '"></span></div><div class="bjl_nolist_x">'+span_player+'</div>';
            }
            break;
        case 120:
            if(o.result != ''){
                var result = o.result.split(',');
                $.each(result, function (ii, oo) {
                    oo = parseInt(oo);
                    html += '<em class="regular' + oo + '"></em>';
                })
            }
            break;
        case 130:
            if(o.result != ''){
                var result = o.result.split(',');
                $.each(result, function (ii, oo) {
                    oo = parseInt(oo);
                    html += '<i class="mh m' + oo + '"></i> ';
                })
            }
            break;
    }
    return html;
}

/*结果验证*/
function checkRes(i){
    var data = NOList[i],
        game_name = $('.game-names').find('a.hover').html(),
        order_num = data.number,
        datetimes = data.draw_time_full,
        result = data.result,
        result = dyeResult(result),
        title = game_name + ' 第 ' + order_num + ' 期开奖结果',
        table = '';
    $('body').addClass('modal-open');
    $('#myModal').addClass('in');
    $('#myModal').find('.modal-backdrop').addClass('in');

    switch(GTYPE){
        case 10:
            table += '<table>';
            table += '  <tr><td width="20%">开奖时间</td><td>' + datetimes + '</td></tr>';
            table += '  <tr><td width="20%">开奖号码</td><td>' + result.nos + '</td></tr>';
            table += '  <tr><td width="20%">区位</td><td>第一区[第1/2/3/4/5/6/7位数字]</td></tr>';
            table += '  <tr><td width="20%">数字</td><td>' + result.first + '</td></tr>';
            table += '  <tr><td width="20%">求和</td><td>' + result.first_sum + '</td></tr>';
            table += '  <tr><td width="20%">计算</td><td>' + result.first_sum + '尾数 + 1</td></tr>';
            table += '  <tr><td width="20%">开奖</td><td class="td_fruit" colspan="2"><i class="mh m' + result.win + '"></i></td></tr>';
            table += '</table>';
            break;
        case 11:
            table += '<table>';
            table += '  <tr><td colspan="2">开奖时间</td><td>' + datetimes + '</td></tr>';
            table += '  <tr><td colspan="2">开奖号码</td><td>' + result.nos + '</td></tr>';
            table += '  <tr><td width="8%">区位</td><td>第一区[第1/4/7/10/13/16位数字]</td><td>第二区[第3/6/9/12/15/18位数字]</td></tr>';
            table += '  <tr><td width="8%">数字</td><td>' + result.first + '</td><td>' + result.second + '</td></tr>';
            table += '  <tr><td width="8%">求和</td><td>' + result.first_sum + '</td><td>' + result.second_sum + '</td></tr>';
            table += '  <tr><td width="8%">计算</td><td>' + result.first_sum + '除以6的余数 + 1</td><td>' + result.second_sum + '除以6的余数 + 1</td></tr>';
            table += '  <tr><td width="8%">结果</td><td class="td_fruit"><i class="kj kj_' + result.first_value + '"></i></td><td class="td_fruit"><i class="kj kj_' + result.second_value + '"></i></td></tr>';
            table += '  <tr><td width="8%">开奖</td><td class="td_fruit" colspan="2"><i class="kj kj_' + result.first_value + '"></i><i class="hja"></i><i class="kj kj_' + result.second_value + '"></i><i class="hdeng"></i><i class="mh m' + result.win + '"></i></td></tr>';
            table += '</table>';
            break;
        case 16:
            table += '<table>';
            table += '  <tr><td colspan="2">开奖时间</td><td colspan="2">' + datetimes + '</td></tr>';
            table += '  <tr><td colspan="2">开奖号码</td><td colspan="2">' + result.nos + '</td></tr>';
            table += '  <tr><td width="8%">区位</td><td>第一区[第1/4/7/10/13/16位数字]</td><td>第二区[第2/5/8/11/14/17位数字]</td><td>第三区[第3/6/9/12/15/18位数字]</td></tr>';
            table += '  <tr><td width="8%">数字</td><td>' + result.first + '</td><td>' + result.second + '</td><td>' + result.third + '</td></tr>';
            table += '  <tr><td width="8%">求和</td><td>' + result.first_sum + '</td><td>' + result.second_sum + '</td><td>' + result.third_sum + '</td></tr>';
            table += '  <tr><td width="8%">计算</td><td>' + result.first_sum + '除以6的余数 + 1</td><td>' + result.second_sum + '除以6的余数 + 1</td><td>' + result.third_sum + '除以6的余数 + 1</td></tr>';
            table += '  <tr><td width="8%">结果</td><td class="td_fruit"><i class="kj kj_' + result.first_value + '"></i></td><td class="td_fruit"><i class="kj kj_' + result.second_value + '"></i></td><td class="td_fruit"><i class="kj kj_' + result.third_value + '"></i></td></tr>';
            table += '  <tr><td width="8%">开奖</td><td class="td_fruit" colspan="3"><i class="kj kj_' + result.first_value + '"></i><i class="hja"></i><i class="kj kj_' + result.second_value + '"></i><i class="hja"></i><i class="kj kj_' + result.third_value + '"></i><i class="hdeng"></i><i class="mh m' + result.win + '"></i></td></tr>';
            table += '</table>';
            break;
        case 28:
        case 110:
        case 111:
        case 112:
            if(GID == 8 || GID == 33 || GID == 27 || GID==47){
                var qu = '<td>第一区[第1/2/3/4/5/6位数字]</td><td>第二区[第7/8/9/10/11/12位数字]</td><td>第三区[第13/14/15/16/17/18位数字]</td>';
            }else{
                var qu = '<td>第一区[第2/5/8/11/14/17位数字]</td><td>第二区[第3/6/9/12/15/18位数字]</td><td>第三区[第4/7/10/13/16/19位数字]</td>'
            }
            table += '<table>';
            table += '  <tr><td colspan="2">开奖时间</td><td colspan="2">' + datetimes + '</td></tr>';
            table += '  <tr><td colspan="2">开奖号码</td><td colspan="2">' + result.nos + '</td></tr>';
            table += '  <tr><td width="8%">区位</td>' + qu + '</tr>';
            table += '  <tr><td width="8%">数字</td><td>' + result.first + '</td><td>' + result.second + '</td><td>' + result.third + '</td></tr>';
            table += '  <tr><td width="8%">求和</td><td>' + result.first_sum + '</td><td>' + result.second_sum + '</td><td>' + result.third_sum + '</td></tr>';
            table += '  <tr><td width="8%">计算</td><td>取尾数</td><td>取尾数</td><td>取尾数</td></tr>';
            table += '  <tr><td width="8%">结果</td><td class="td_fruit"><i class="kj kj_' + result.first_value + '"></i></td><td class="td_fruit"><i class="kj kj_' + result.second_value + '"></i></td><td class="td_fruit"><i class="kj kj_' + result.third_value + '"></i></td></tr>';
            table += '  <tr><td width="8%">开奖</td><td class="td_fruit" colspan="3"><i class="kj kj_' + result.first_value + '"></i><i class="hja"></i><i class="kj kj_' + result.second_value + '"></i><i class="hja"></i><i class="kj kj_' + result.third_value + '"></i><i class="hdeng"></i><i class="mh m' + result.win + '"></i></td></tr>';
            table += '</table>';
            break;
        case 5:
            if(GID == 9){
                var qu = '<td>第一区[第1/2/3/4/5/6位数字]</td><td>第二区[第7/8/9/10/11/12位数字]</td><td>第三区[第13/14/15/16/17/18位数字]</td>';
            }else{
                var qu = '<td>第一区[第2/5/8/11/14/17位数字]</td><td>第二区[第3/6/9/12/15/18位数字]</td><td>第三区[第4/7/10/13/16/19位数字]</td>'
            }
            table += '<table>';
            table += '  <tr><td colspan="2">开奖时间</td><td colspan="2">' + datetimes + '</td></tr>';
            table += '  <tr><td colspan="2">开奖号码</td><td colspan="2">' + result.nos + '</td></tr>';
            table += '  <tr><td width="8%">区位</td>' + qu + '</tr>';
            table += '  <tr><td width="8%">数字</td><td>' + result.first + '</td><td>' + result.second + '</td><td>' + result.third + '</td></tr>';
            table += '  <tr><td width="8%">求和</td><td>' + result.first_sum + '</td><td>' + result.second_sum + '</td><td>' + result.third_sum + '</td></tr>';
            table += '  <tr><td width="8%">计算</td><td>取尾数</td><td>取尾数</td><td>取尾数</td></tr>';
            table += '  <tr><td width="8%">结果</td><td class="td_fruit"><i class="kj kj_' + result.first_value + '"></i></td><td class="td_fruit"><i class="kj kj_' + result.second_value + '"></i></td><td class="td_fruit"><i class="kj kj_' + result.third_value + '"></i></td></tr>';
            table += '  <tr><td width="8%">开奖</td><td class="td_fruit" colspan="3"><i class="kj kj_' + result.first_value + '"></i><i class="hja"></i><i class="kj kj_' + result.second_value + '"></i><i class="hja"></i><i class="kj kj_' + result.third_value + '"></i><i class="hdeng"></i><i class="zh z' + result.win + '"></i></td></tr>';
            table += '</table>';
            break;
    }
    $('#m-title').html(title);
    $('#m-table').html(table);
}

$('#myModal').find('.close').off('click').on('click', function(){
    $('#m-title').html('');
    $('#m-table').html('');
    $('body').removeClass('modal-open');
    $('#myModal').removeClass('in');
    $('#myModal').find('.modal-backdrop').removeClass('in');
})

/*给开奖结果染色*/
function dyeResult(result){
    result = result.split(',');
    switch(GTYPE){
        case 10:
            var returnData = {},
                nos = [],
                first = [],
                first_sum = 0,
                first_value;
            $.each(result, function(i,o){
                var ii = i+1;
                if(ii >= 1 && ii <= 7){
                    nos[i] = '<i style="color:red">' + o + '</i>';
                    first.push(nos[i]);
                    first_sum += Number(o);
                }else{
                    nos[i] = '<i style="color:gray">' + o + '</i>';
                }
            })
            returnData['nos'] = nos.join(' ');
            returnData['first'] = first.join(',');
            returnData['first_sum'] = first_sum;
            first_value = getTail(first_sum) + 1;
            returnData['first_value'] = first_value;
            returnData['win'] = first_value;
            break;
        case 11:
            if(GID == 2){
                var returnData = {};
                returnData['first_value'] = result[0];
                returnData['second_value'] = result[1];
                returnData['win'] = first_value + second_value;

            }else{
                var returnData = {},
                    nos = [],
                    first = [],
                    second = [],
                    first_sum = 0,
                    second_sum = 0,
                    first_value,
                    second_value;
                $.each(result, function(i,o){
                    var ii = i+1;
                    if(ii%3 == 1 && ii <= 18){
                        nos[i] = '<i style="color:red">' + o + '</i>';
                        first.push(nos[i]);
                        first_sum += Number(o);
                    }else if(ii%3 == 0 && ii <= 18){
                        nos[i] = '<i style="color:green">' + o + '</i>';
                        second.push(nos[i]);
                        second_sum += Number(o);
                    }else{
                        nos[i] = '<i style="color:gray">' + o + '</i>';
                    }
                })
                returnData['nos'] = nos.join(' ');
                returnData['first'] = first.join(',');
                returnData['second'] = second.join(',');
                returnData['first_sum'] = first_sum;
                returnData['second_sum'] = second_sum;
                first_value = first_sum % 6 + 1;
                second_value = second_sum % 6 + 1;
                returnData['first_value'] = first_value;
                returnData['second_value'] = second_value;
                returnData['win'] = first_value + second_value;
            }
            break;
        case 16:
            if(GID == 3){
                var returnData = {};
                returnData['first_value'] = result[0];
                returnData['second_value'] = result[1];
                returnData['third_value'] = result[2];
                returnData['win'] = first_value + second_value + third_value;
            }else{
                var returnData = {},
                    nos = [],
                    first = [],
                    second = [],
                    third =[],
                    first_sum = 0,
                    second_sum = 0,
                    third_sum = 0,
                    first_value,
                    second_value,
                    third_value;
                $.each(result, function(i,o){
                    var ii = i+1;
                    if(ii%3 == 1 && ii <= 18){
                        nos[i] = '<i style="color:red">' + o + '</i>';
                        first.push(nos[i]);
                        first_sum += Number(o);
                    }else if(ii%3 == 2 && ii <= 18){
                        nos[i] = '<i style="color:green">' + o + '</i>';
                        second.push(nos[i]);
                        second_sum += Number(o);
                    }else if(ii%3 == 0 && ii <= 18){
                        nos[i] = '<i style="color:orange">' + o + '</i>';
                        third.push(nos[i]);
                        third_sum += Number(o);
                    }else{
                        nos[i] = '<i style="color:gray">' + o + '</i>';
                    }
                })
                returnData['nos'] = nos.join(' ');
                returnData['first'] = first.join(',');
                returnData['second'] = second.join(',');
                returnData['third'] = third.join(',');
                returnData['first_sum'] = first_sum;
                returnData['second_sum'] = second_sum;
                returnData['third_sum'] = third_sum;
                first_value = first_sum % 6 + 1;
                second_value = second_sum % 6 + 1;
                third_value = third_sum % 6 + 1;
                returnData['first_value'] = first_value;
                returnData['second_value'] = second_value;
                returnData['third_value'] = third_value;
                returnData['win'] = first_value + second_value + third_value;
            }
            break;
        case 28:
        case 110:
        case 111:
        case 112:
            if(GID == 5 || GID == 43){
                var returnData = {};
                returnData['first_value'] = result[0];
                returnData['second_value'] = result[1];
                returnData['third_value'] = result[2];
                returnData['win'] = first_value + second_value + third_value;
            }else{
                var returnData = {},
                    nos = [],
                    first = [],
                    second = [],
                    third =[],
                    first_sum = 0,
                    second_sum = 0,
                    third_sum = 0,
                    first_value,
                    second_value,
                    third_value;

                $.each(result, function(i,o){
                    var ii = i+1;
                    if(GID == 8 || GID == 33 || GID == 27 ||GID==47){
                        if(ii >= 1 && ii < 7){
                            nos[i] = '<i style="color:red">' + o + '</i>';
                            first.push(nos[i]);
                            first_sum += Number(o);
                        }else if(ii >= 7 && ii < 13){
                            nos[i] = '<i style="color:green">' + o + '</i>';
                            second.push(nos[i]);
                            second_sum += Number(o);
                        }else if(ii >= 13 && ii < 19){
                            nos[i] = '<i style="color:orange">' + o + '</i>';
                            third.push(nos[i]);
                            third_sum += Number(o);
                        }else{
                            nos[i] = '<i style="color:gray">' + o + '</i>';
                        }
                    }else{
                        if(ii%3 == 2 && ii <= 19 && ii > 1){
                            nos[i] = '<i style="color:red">' + o + '</i>';
                            first.push(nos[i]);
                            first_sum += Number(o);
                        }else if(ii%3 == 0 && ii <= 19 && ii > 1){
                            nos[i] = '<i style="color:green">' + o + '</i>';
                            second.push(nos[i]);
                            second_sum += Number(o);
                        }else if(ii%3 == 1 && ii <= 19 && ii > 1){
                            nos[i] = '<i style="color:orange">' + o + '</i>';
                            third.push(nos[i]);
                            third_sum += Number(o);
                        }else{
                            nos[i] = '<i style="color:gray">' + o + '</i>';
                        }
                    }

                })

                returnData['nos'] = nos.join(' ');
                returnData['first'] = first.join(',');
                returnData['second'] = second.join(',');
                returnData['third'] = third.join(',');
                returnData['first_sum'] = first_sum;
                returnData['second_sum'] = second_sum;
                returnData['third_sum'] = third_sum;
                first_value = getTail(first_sum);
                second_value = getTail(second_sum);
                third_value = getTail(third_sum);
                returnData['first_value'] = first_value;
                returnData['second_value'] = second_value;
                returnData['third_value'] = third_value;
                returnData['win'] = first_value + second_value + third_value;
            }
            break;
        case 5:
            if(GID == 6){
                var returnData = {};
                returnData['first_value'] = result[0];
                returnData['second_value'] = result[1];
                returnData['third_value'] = result[2];
            }else{
                var returnData = {},
                    nos = [],
                    first = [],
                    second = [],
                    third =[],
                    first_sum = 0,
                    second_sum = 0,
                    third_sum = 0,
                    first_value,
                    second_value,
                    third_value;

                $.each(result, function(i,o){
                    var ii = i+1;
                    if(GID == 9){//蛋蛋36
                        if(ii >= 1 && ii < 7){
                            nos[i] = '<i style="color:red">' + o + '</i>';
                            first.push(nos[i]);
                            first_sum += Number(o);
                        }else if(ii >= 7 && ii < 13){
                            nos[i] = '<i style="color:green">' + o + '</i>';
                            second.push(nos[i]);
                            second_sum += Number(o);
                        }else if(ii >= 13 && ii < 19){
                            nos[i] = '<i style="color:orange">' + o + '</i>';
                            third.push(nos[i]);
                            third_sum += Number(o);
                        }else{
                            nos[i] = '<i style="color:gray">' + o + '</i>';
                        }
                    }else{
                        if(ii%3 == 2 && ii <= 19 && ii > 1){
                            nos[i] = '<i style="color:red">' + o + '</i>';
                            first.push(nos[i]);
                            first_sum += Number(o);
                        }else if(ii%3 == 0 && ii <= 19 && ii > 1){
                            nos[i] = '<i style="color:green">' + o + '</i>';
                            second.push(nos[i]);
                            second_sum += Number(o);
                        }else if(ii%3 == 1 && ii <= 19 && ii > 1){
                            nos[i] = '<i style="color:orange">' + o + '</i>';
                            third.push(nos[i]);
                            third_sum += Number(o);
                        }else{
                            nos[i] = '<i style="color:gray">' + o + '</i>';
                        }
                    }

                })

                returnData['nos'] = nos.join(' ');
                returnData['first'] = first.join(',');
                returnData['second'] = second.join(',');
                returnData['third'] = third.join(',');
                returnData['first_sum'] = first_sum;
                returnData['second_sum'] = second_sum;
                returnData['third_sum'] = third_sum;
                first_value = getTail(first_sum);
                second_value = getTail(second_sum);
                third_value = getTail(third_sum);
                returnData['first_value'] = first_value;
                returnData['second_value'] = second_value;
                returnData['third_value'] = third_value;
                var numberArray = [first_value, second_value, third_value];
                var win = verdictBSDBZ(numberArray);
                returnData['win'] = win;
            }
            break;
    }
    return returnData;

}

/*获取尾数*/
function getTail(num){
    var num = num + '',
        len = num.length,
        tail = num[len-1];
    tail = Number(tail);

    return tail;

}
/**
 * 计算顺子、对子、半顺、豹子、杂六
 * @arguments array 数组
 * @returns 数组下标0 对应豹子、对子   数组下标1 对应顺子、半顺、杂六
 */
function verdictBSDBZ(array){
    array = toNumArray(array);
    array = sortAsc(array);

    if(array[0] == 0 && array[1] == 1 && array[2] == 9){
        var win = 2;//顺
    }else if(array[0] == 0 && array[1] == 8 && array[2] == 9){
        var win = 2;//顺
    }else{
        //存储计算结果
        var resultArray = new Array(2);
        //计算豹子、对子
        resultArray[0] = array[2] - array[1] == 0 ? 1 : 0;
        resultArray[0] = array[1] - array[0] == 0 ? ++resultArray[0] : resultArray[0];
        //计算顺子、半顺、杂六
        resultArray[1] = array[2] - array[1] == 1 ? 1 : 0;
        resultArray[1] = array[1] - array[0] == 1 ? ++resultArray[1] :  resultArray[1];

        if(resultArray[0] == 1){
            var win = 3;//对
        }else if(resultArray[0] == 2){
            var win = 1;//豹
        }else if(resultArray[1] == 1){
            var win = 4;//半
        }else if(resultArray[1] == 2){
            var win = 2;//顺
        }else{
            if(array[0] == 0 && array[2] == 9){
                var win = 4;//半
            }else{
                var win = 5;//杂
            }
        }
    }

    return win;
}

/**
 * 对整型数组进行升序排序
 * @arguments array 整型数组
 * @returns 排序后的数组
 */
sortAsc = function (array){
    for(var i  = 0;i < array.length;i++){
        for(var x = i;x < array.length;x++){
            if(array[i] > array[x]){
                var temp = array[x];
                array[x] = array[i];
                array[i] = temp;
            }
        }
    }
    return array;
}

/**
 * 将字符串数组转换为整型数组
 * @arguments strArray 字符串数组
 * @returns 整型数组
 */
toNumArray = function (strArray){
    var numArray = new Array(strArray.length);
    for(var i = 0;i < strArray.length;i++){
        numArray[i] = Number(strArray[i]);
    }
    return numArray;
}

function playsund() {
    soundv = (getCookie("soundv") == "")?"0":getCookie("soundv");
    if(soundv=="0"){
        var mp3Href = '/Public/home/images/2.mp3';
        var ua = navigator.userAgent.toLowerCase();
        if (ua.match(/msie ([\d.]+)/)) {
            $('#game_playsond_div').html('<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" style="display:none;"><param name="AutoStart" value="1" /><param name="Src" value="' + mp3Href + '" /></object>');
        }
        else if (ua.match(/firefox\/([\d.]+)/)||ua.match(/chrome\/([\d.]+)/)||ua.match(/version\/([\d.]+).*safari/)) {
            $('#game_playsond_div').html('<audio src="' + mp3Href + '" type="audio/mp3" autoplay="autoplay" hidden="true" style="display:none;"></audio>');
        }
        else if (ua.match(/opera.([\d.]+)/)) {
            $('#game_playsond_div').html('<embed src="' + mp3Href + '" hidden="true" loop="false" style="display:none;"><noembed><bgsounds src="/img/sound/2.mp3" style="display:none;"></noembed>');
        }
        else {
            $('#game_playsond_div').html('<embed src="' + mp3Href + '" type="audio/mp3" hidden="true" loop="false" mastersound style="display:none;"></embed>');
        }
    }
}

function changsound(v){

    soundv = (getCookie("soundv") == "")?"0":getCookie("soundv");
    var str='';
    if(v==1){
        if(soundv=="0"){
            setCookie("soundv","1");

            str=IMAGE+"/S_Close.gif?v=2";
            $('#sond_offon').attr("src", str);
        }else{
            setCookie("soundv","0");
            str=IMAGE+"/S_Open.gif?v=2";
            $('#sond_offon').attr("src",str );
        }
    }else{
        if(soundv=="0"){
            str=IMAGE+"/S_Open.gif?v=2";
            $('#sond_offon').attr("src", str);
        }else{
            str=IMAGE+"/S_Close.gif?v=2";
            $('#sond_offon').attr("src", str);
        }
    }

}



function setCookie(name,value,expiredays){
    var exp  = new Date();
    exp.setDate(exp.getDate() + expiredays);
    document.cookie = name + "="+ escape (value) + ((expiredays == null) ? "" : ";expires=" + exp.toGMTString());
}
function getCookie(name){
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
    if(arr != null){
        return (arr[2]);
    }else{
        return "";
    }
}
function delCookie(name){
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function getScResult(result){

    var html = '';
    if(result){
        result = result.split(',');
        var he = parseInt(result[0]) + parseInt(result[1]);
        var ds = he % 2 == 0 ? '双' : '单';
        var dx = he > 11 ? '大' : '小';
        var lh1 = parseInt(result[0]) > parseInt(result[9]) ? '龙' : '虎';
        var lh2 = parseInt(result[1]) > parseInt(result[8]) ? '龙' : '虎';
        var lh3 = parseInt(result[2]) > parseInt(result[7]) ? '龙' : '虎';
        var lh4 = parseInt(result[3]) > parseInt(result[6]) ? '龙' : '虎';
        var lh5 = parseInt(result[4]) > parseInt(result[5]) ? '龙' : '虎';
        html += '<td><span class="win_no_sc">' + he + '</span></td>';
        html += '<td><span class="win_no_sc">' + ds + '</span></td>';
        html += '<td><span class="win_no_sc">' + dx + '</span></td>';
        html += '<td><span class="win_no_sc">' + lh1 + '</span></td>';
        html += '<td><span class="win_no_sc">' + lh2 + '</span></td>';
        html += '<td><span class="win_no_sc">' + lh3 + '</span></td>';
        html += '<td><span class="win_no_sc">' + lh4 + '</span></td>';
        html += '<td><span class="win_no_sc">' + lh5 + '</span></td>';
    }else{
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
    }

    return html;
}



function getCqsscResult(result){

    var html = '';
    if(result){
        result = result.split(',');
        var he = parseInt(result[0]) + parseInt(result[1]) + parseInt(result[2]) + parseInt(result[3]) + parseInt(result[4]);
        var ds = he % 2 == 0 ? '双' : '单';
        var dx = he >= 23 ? '大' : '小';
        if(parseInt(result[0]) > parseInt(result[4])){
            var lh = '龙';
        }else if(parseInt(result[0]) < parseInt(result[4])){
            var lh = '虎';
        }else{
            var lh = '和';
        }
        var q3 = verdictBSDBZ([parseInt(result[0]), parseInt(result[1]), parseInt(result[2])]);
        var z3 = verdictBSDBZ([parseInt(result[1]), parseInt(result[2]), parseInt(result[3])]);
        var h3 = verdictBSDBZ([parseInt(result[2]), parseInt(result[3]), parseInt(result[4])]);

        html += '<td><span class="win_no_sc">' + he + '</span></td>';
        html += '<td><span class="win_no_sc">' + ds + '</span></td>';
        html += '<td><span class="win_no_sc">' + dx + '</span></td>';
        html += '<td><span class="win_no_sc">' + lh + '</span></td>';
        html += '<td><span class="win_no_sc">' + BSDBZTEXT[q3] + '</span></td>';
        html += '<td><span class="win_no_sc">' + BSDBZTEXT[z3] + '</span></td>';
        html += '<td><span class="win_no_sc">' + BSDBZTEXT[h3] + '</span></td>';
    }else{
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
    }

    return html;
}