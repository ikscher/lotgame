layui.use(['layer','form'],function(){
    var layer=layui.layer,form=layui.form;
})
$('#page-wrap').on('click', '[role=show]', function(){
    var id = $(this).attr('data-id');
    var oid = $(this).attr('data-oid');
    if(GTAG == 'sc'){
        $.ajax({
            url: '/game/get_bet_info',
            type: 'post',
            dataType: 'html',
            data: {
                gid: GID,
                id: id,
                oid:oid
            },
            success: function(map){
                renderModalSc(map);
                $('body').addClass('modal-open');
                $('#myModal').addClass('in');
                $('#myModal').find('.modal-backdrop').addClass('in');
            }
        })
    }else{
        $.ajax({
            url: '/game/get_bet_info',
            type: 'post',
            dataType: 'json',
            data: {
                gid: GID,
                id: id,
                oid:oid
            },
            success: function(map){
                console.log(map);
                if(map.code == 200){
                    renderModal(map.data);
                    $('body').addClass('modal-open');
                    $('#myModal').addClass('in');
                    $('#myModal').find('.modal-backdrop').addClass('in');
                }else{
                    layer.alert(map.msg);
                }
            }
        })
    }
})

function renderModalSc(data){
    $('#myModal').html(data);

    $('#myModal').find('.close').off('click').on('click', function(){
        $('#m-title').html('');
        $('#m-info').html('');
        $('#m-list').html('');
        $('body').removeClass('modal-open');
        $('#myModal').removeClass('in');
        $('#myModal').find('.modal-backdrop').removeClass('in');
    })
}

function renderModal(data){

    $('#m-title').html('第' + data.order_num + '期投注详细结果');
    $('#m-info').html('开奖时间:' + data.time + ' 投注:' + data.betting_num + ' 获得:' + data.win_num);
    var lists = '';
    console.log(data)
    $.each(data.nolists, function(i, o){
        var win_color = '';
        lists += '<tr>';
        if(GTAG == 'ww'){
            lists += '  <td><div class="fruit_f_ww">' + o.no + '</div></td>';
        }else{
            lists += '  <td><div class="finalbig">' + o.no + '</div></td>';
        }
        if(o.is_win){

            win_color = 'win_color';
        }
        lists += '  <td><span class="' + win_color + '">' + o.scale_prev + '</span></td>';
        lists += '  <td><span class="' + win_color + '">' + o.scale_draw + '</span></td>';
        lists += '  <td><span class="' + win_color + '">' + o.bet_num + '</span></td>';
        lists += '  <td><span class="' + win_color + '">' + o.win_num + '</span></td>';

        lists += '</tr>';
    })
    $('#m-list').html(lists);

    $('#myModal').find('.close').off('click').on('click', function(){
        $('#m-title').html('');
        $('#m-info').html('');
        $('#m-list').html('');
        $('body').removeClass('modal-open');
        $('#myModal').removeClass('in');
        $('#myModal').find('.modal-backdrop').removeClass('in');
    })
}

var page = 1;
var totalPage;

fetchList();

function fetchList(){
    $.ajax({
        url: '/game/get_record',
        type: 'post',
        dataType: 'json',
        data: {
            gid: GID,
            page: page
        },
        success: function(map){
            if(map.code == 200){
                var data = map.data;
                renderBox();
                renderList(data.list);//结果列表
                totalPage = data.total_page;
                renderPager();//分页
            }
        }
    })
}

function renderBox() {
    var html = '<div class="bet-record">';
    html += '            <table>';
    html += '                <thead>';
    html += '                <tr>';
    html += '                    <th>期号</th>';
    html += '                    <th>开奖时间</th>';
    html += '                    <th>开奖结果</th>';
    if(GTAG == 'ww'){
        html += '                    <th>中奖</th>';
    }
    html += '                    <th>投注数量</th>';
    html += '                    <th>获得数量</th>';
    html += '                    <th>赢取数量</th>';
    html += '                    <th>详情</th>';
    html += '                    <th>保存</th>';
    html += '                </tr>';
    html += '                </thead>';
    html += '                <tbody id="log-list"></tbody>';
    html += '            </table>';
    html += '        </div>';
    html += '        <div class="page" id="pager"></div>';
    $('#page-wrap').html(html);
}

function renderList(data){

    var html = '';

    $.each(data, function(i, o){
        if(parseInt(o.win_count) > 0){
            var win_count = '<span class="win_color">' + o.win_count + '</span>';
        }else{
            var win_count = '<span class="lose_color">' + o.win_count + '</span>';
        }
        var rest = fetchRest(o);

        html += '<tr>';
        html += '   <td>' + o.number + '</td>';
        html += '   <td>' + o.draw_time + '</td>';
        html += '   <td>' + rest + '</td>';
        if(GTAG == 'ww'){
            var ww_span = '';
            $.each(o.win_no_ww, function(i, o){
                ww_span += '<span class="win_no_ww">' + o + '</span>';
            })
            html += '   <td>' + ww_span + '</td>';
        }
        html += '   <td>' + o.total_money + '</td>';
        html += '   <td>' + o.win_money + '</td>';
        html += '   <td>' + win_count + '</td>';
        html += '   <td><button type="button" class="btn" role="show"  data-oid="'+o.times_id+'" data-id="' + o.id + '">查看</button></td>';
        if(GTAG != 'ww' && GTAG != 'sc') {
            html += '   <td><a href="/game/mode?gid=' + GID + '&oid=' + o.times_id + '&id='+o.id+'">保存</a></td>';
        }else{
            html += '   <td></td>';
        }
        html += '</tr>';

    })
    $('#log-list').html(html);
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
    fetchList();
}


function fetchRest(o){
    var html = '';
    switch(GTYPE){
        case 10:
            if(o.win_no != '') {
                if(GID == 34 || GID == 35 || GID == 36||GID == 45||GID==46){
                    html += '<i class="mh m' + o.win_no + '"></i>';
                }else {
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
                var res = dyeResult(o.result);
                html += '<i class="kj kj_' + res.first_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.second_value + '"></i>';
                html += '<i class="hja"></i>';
                html += '<i class="kj kj_' + res.third_value + '"></i>';
                html += '<i class="hdeng"></i>';
                html += '<i class="mh m' + o.win_no + '"></i>';

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

/*给开奖结果染色*/
function dyeResult(result){
    result = result.split(',');
    switch(GTYPE){
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
            if(GID == 7 || GID == 43){
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
                    if(GID == 8 || GID == 10 || GID == 27 || GID==29){//蛋蛋28
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
                    if(GID == 11){//蛋蛋36
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