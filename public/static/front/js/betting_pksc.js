$('#bet-submit').on('click', function(){

    var totalScore = parseInt($("#bet-total").html());

    if(totalScore > MAX_SCORE){
        alert("投注额已大于最大限制" + MAX_SCORE);
        return;
    }
    if(totalScore < MIN_SCORE){
        alert("投注额小于最小限制" + MIN_SCORE);
        return;
    }
    if(!confirm("您确定投注 " + totalScore + " 吗?")){
        return;
    }

    var data = {
        gid: GID,
        oid: OID
    };

    $("input.bet_input").each(function(){
        if($(this).val() != '' && $(this).val() != 0){
            var name = 'betting_' + $(this).attr('data-name'),
                key = $(this).attr('role');
            if(typeof(data[name]) == 'undefined'){
                data[name] = {}
            }
            data[name][key] = $(this).val();
        }
    })


    $.ajax({
        url: '/games/betting_submit',
        type: 'post',
        dataType: 'json',
        data: data,
        success: function(map){
            if(map.code == 200){
                alert('投注成功！');
                window.location.href = '/games?gid=' + GID;
            }else if(map.code == 302){
                alert('未登录，或登录超时，请重新登录！');
                window.location.href = '/user/login';
            }else if(map.code == 501){
                alert(map.msg);
                window.location.href = '/games?gid=' + GID;
            }else{
                alert(map.msg);
            }
        },
        error: function(){
            alert('投注失败,请重试!');
        }
    })
})

c = 0;
function chips(num,i){
    $("#yushe").attr("checked",false);
    var best=parseInt($("#betsLeft").val())?parseInt($("#betsLeft").val()):0;
    if(c==i && best>0 && best%parseInt(num)==0){
        best=parseInt(num)+best;
    }else{
        best=num;
    }
    c=i;

    $("#betsLeft").val(best);
    $("#usefenpei").trigger('click');
}

function chkInt(int,minLength,maxLength,pattern){
    pattern = typeof(pattern) == 'undefined' ? '^-?[1-9]+[0-9]*$' : pattern;
    pattern = new RegExp(pattern);
    if(pattern.test(int)==false){
        return false;
    }
    return chkStrLen(int,minLength,maxLength);
}

function chkStrLen(str,minLength,maxLength){
    if(str.length < minLength) {
        return false;
    }
    if(maxLength != null && str.length > maxLength) {
        return false;
    }
    return true;
}

//算计总数
function Count_Total(){
    var tmpMoney = 0;
    $("input.bet_input").each(function(){
        if($(this).val() != "")
            tmpMoney += parseInt($(this).val());
    });
    $("#bet-total").html(tmpMoney);
}

//判断正整数
function checkRate(val)
{
    var re = /^[0-9]*[1-9][0-9]*$/;
    if (!re.test(val))
    {
        return false;
    }else{
        return true;
    }
}

function init(){
    $("input[name=chk]").prop('checked',false);
    $("input.bet_input").val('');
    $("#bet-total").html(0);
}

function useModel(o) {
    init();
    //全
    if (o == 0) {
        $("input[name=chk]").trigger('click').prop("checked", true);
    }
    Count_Total();
}

function chgAllTimes(times)
{
    if(parseInt($("#bet-total").html()) * times > MAX_SCORE){
        alert('已超过最大上限' + MAX_SCORE);
        return;
    }

    $.each($("input[name=chk]"), function(){
        var $tr = $(this).parent().parent(),
            $intpt = $tr.find('input[type=text]');
        if(parseInt($intpt.val()) * times > 1){
            if($intpt.val() > 0){
                $("#bet-total").html( parseInt($("#bet-total").html()) + Math.floor(parseInt($intpt.val()) * times) - parseInt($intpt.val()) );
                $intpt.val( Math.floor(parseInt($intpt.val()) * times ));
                $(this).prop("checked", true);
            }
        }
        else{
            if($intpt.val() > 0){
                $("#bet-total").html( parseInt($("#bet-total").html())  - parseInt($intpt.val()) );
                $intpt.val('');
                $(this).prop("checked", false);
            }
        }
    })
}

$("input.bet_input").on('blur', function(){
    var $this = $(this),
        $tr = $this.parent().parent(),
        $chk = $tr.find('input[name=chk]');
    if($this.val() <= 0){
        $this.val('');
    }
    if($this.val() != ""){
        if(chkInt($this.val()) == false){
            $this.val('');
        }
        if($this.val() != 0){
            $chk.prop("checked",true);
        }
        else{
            $chk.prop("checked",false);
        }
    }
    else{
        $chk.prop("checked",false);
    }
    Count_Total();
})

$("input[name=chk]").on('click', function(){

    var $this = $(this),
        $tr = $this.parent().parent(),
        $intpt = $tr.find('input[type=text]');

    if($this.prop("checked")){
        $intpt.val(10);
        if($("#bet-total").html() == ""){
            $("#bet-total").html(0);
        }
        $("#bet-total").html(parseInt($("#bet-total").html()) + 10);
    }
    else{
        if($("#bet-total").html() == ""){
            $("#bet-total").html(0);
        }
        $("#bet-total").html(parseInt($("#bet-total").html()) - parseInt($intpt.val()));
        $intpt.val('');
    }

})

$('.beilv').on('click', function(){
    var times = $(this).attr('data-num'),
        role = $(this).attr('role'),
        $input = $("input[name='tbNum[]'][role='" + role + "']");
    if(parseInt($input.val() * times) > 0)
    {
        $("#bet-total").html(parseInt($("#bet-total").html()) + parseInt($input.val() * times) - parseInt($input.val()));
        $input.val(parseInt($input.val() * times));
    }
})

$('#init').on('click', function(){
    init();
})


$('#subSelect').on('click', function(){
    $("input[name=chk]").trigger('click');
})

$('[role=userModel]').on('click', function(){
    var m = $(this).attr('data-m');
    useModel(m);
})

$('[role=chgAllTimes]').on('click', function(){
    var m = $(this).attr('data-m');
    chgAllTimes(m);
})

$('#useSuoha').on('click', function(){
    var totalScore = 0;
    var perScore = 0;
    var totalPressScore = 0;

    $.each($("input[name=chk]"), function(){
        if($(this).prop("checked")){
            var $tr = $(this).parent().parent(),
                $intpt = $tr.find('input[type=text]');
            totalScore += parseInt($intpt.val());
        }
    })
    $.each($("input[name=chk]"), function(){
        if($(this).prop("checked")){

            var $tr = $(this).parent().parent(),
                $intpt = $tr.find('input[type=text]');
            if(MY_SCORE <= MAX_SCORE) {
                perScore = MY_SCORE / totalScore * parseInt($intpt.val());
            }
            else
            {
                perScore = MAX_SCORE / totalScore * parseInt($intpt.val());
            }
            $intpt.val(parseInt(perScore));
            totalPressScore += parseInt(perScore);
        }
    })
    $("#bet-total").html(totalPressScore);
})


$('#usefenpei').on('click', function(){
    var totalScore = 0;
    var perScore = 0;
    var totalPressScore = 0;
    var Input_Score = $('#betsLeft').val();
    if(isNaN(Input_Score) ){
        $('#betsLeft').val('');
        alert('分配分必须为数字!');
        return;
    }else{
        if(  Input_Score<1){
            $('#betsLeft').val('');
            alert('分配分必须大于0!');
            return;
        }
        if(checkRate(Input_Score)==false){
            $('#betsLeft').val('');
            alert('分配分必须正整数!');
            return;
        }
        var checked_num=0;
        $.each($("input[name=chk]"), function(){

            if($(this).prop("checked")){
                checked_num=checked_num+1;
            }
        })
        if(Input_Score<checked_num){
            alert('分配分不够!');
            return;
        }
        if(Input_Score>MAX_SCORE){
            $('#betsLeft').val(MAX_SCORE);
            return;
        }
    }

    $.each($("input[name=chk]"), function(){
        if($(this).prop("checked")){
            var $tr = $(this).parent().parent(),
                $intpt = $tr.find('input[type=text]');
            totalScore += parseInt($intpt.val());
        }
    })
    $.each($("input[name=chk]"), function(){
        if($(this).prop("checked")){
            var $tr = $(this).parent().parent(),
                $intpt = $tr.find('input[type=text]');
            if(Input_Score <= MAX_SCORE)
            {
                perScore = Input_Score / totalScore * parseInt($intpt.val());
            }
            else
            {
                perScore = MAX_SCORE / totalScore * parseInt($intpt.val());
            }
            $intpt.val(parseInt(perScore));
            totalPressScore += parseInt(perScore);
        }
    })
    $("#bet-total").html(totalPressScore);
})

/*上次投注*/
$('#prevBetting').on('click', function(){
    $.ajax({
        url: '/games/betting_prev',
        type: 'post',
        dataType: 'json',
        data: {
            gid: GID
        },
        success: function(map){
            if(map.code == 200){
                init();
                var totalPressScore = 0;

                $.each(map.data, function(i, o){
                    $("input[data-name='" + i + "']").each(function(){
                        var key_name = $(this).attr('role'),
                            key_val = parseInt(o[key_name]);
                        key_val = key_val ? key_val : 0;
                        totalPressScore = totalPressScore + key_val;
                        if(key_val){
                            $(this).val(key_val);
                            $(this).parent().parent().find('input[name=chk]').prop("checked", true);
                        }
                    })
                })

                $("#bet-total").html(totalPressScore);
            }else{
                alert(map.msg);
            }
        }
    })
});



//剩余时间倒计时
(function(){
    var number = NUMBER,
        stop_time = STOP_TIME;
    setInterval(function(){
        if(stop_time > 0){
            $('#liTimer').html('第<b>' + number + '</b>期 还有<b>' + stop_time + '</b>秒停止下注!');
        }else{
            $('#liTimer').html('第<b>' + number + '</b>期 停止下注 请选择其他期!');
        }
        stop_time--;
    },1000);
})()