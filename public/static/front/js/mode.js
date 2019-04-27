layui.use(['layer','form'],function(){
    var layer=layui.layer,form=layui.form;
})
$('#mode-submit').on('click', function(){

    var totalScore = parseInt($("#bet-total").html());
    var data = PRESSNUM.split(",");

    if(totalScore > MAX_SCORE){
        layer.alert("您的投注额已大于最大限制" + MAX_SCORE);
        return;
    }
    if(totalScore < MIN_SCORE){
        layer.alert("您的投注额小于最小限制" + MIN_SCORE);
        return;
    }
    var betting = {};
    for(var i = 0; i < data.length; i++){
        if($("input[name=chk]").eq(i).prop("checked")){
            betting[$("input[name=chk]").eq(i).attr('role')] = parseInt($("input[name='tbNum[]']").eq(i).val()==""?"0":$("input[name='tbNum[]']").eq(i).val());
        }
    }
    var modelid = $('#sltMode').val();
    var modelname = $('#txtModelName').val();

    if(modelname == ''){
        layer.alert("请填写模式名称");
        return;
    }

    $.ajax({
        url: '/games/mode_save',
        type: 'post',
        dataType: 'json',
        data: {
            gid: GID,
            betting: betting,
            mid: modelid,
            mname: modelname
        },
        success: function(map){
            if(map.code == 200){
                var option = '<option value="0">--新建模式--</option>';
                $.each(map.data, function(i,o){
                    option += '<option value="'+ o.id+'">'+ o.mode_name+'</option>';
                });
                $('#sltMode').html(option);
                $('#txtModelName').val('模式1');
                layer.alert('保存成功！');
            }else{
                layer.alert(map.msg);
            }
        }
    })
})

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
    $("input[name='tbNum[]']").each(function(){
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
    $("input[name='tbNum[]']").val('');
    $("#hidTimes").val(1);
    $("#bet-total").html(0);
}

function useModel(o) {
    var istart = 0;
    var imore = 0;
    var tmpscore = 0;
    if (GTYPE == 22) {
        istart = 6;
        imore = 6;
    }
    if (GTYPE == 17) {
        istart = 3;
        imore = 6;
    }
    if (GTYPE == 16) {
        istart = 3;
        imore = 5;
    }
    if (GTYPE == 10) {
        istart = 1;
        imore = 1;
    }
    if (GTYPE == 11) {
        istart = 2;
        imore = 2;
    }

    if (GTYPE == 7) {
        istart = 1;
        imore = 1;
    }
    if (GTYPE == 5) {
        istart = 1;
        imore = 1;
    }
    if (GTYPE == 2) {
        istart = 1;
        imore = 1;
    }
    init();
    var data = PRESSNUM.split(",");
    var cc = parseInt(data.length);
    //全
    if (o == 0) {
        $("[name = 'chk']:checkbox").prop("checked", true);
        for (var i = 0; i < cc; i++) {
            $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
        }
    }
    //双
    if (o == 1) {
        for (var i = 0; i < cc; i++) {
            if((i + istart) % 2 == 0)
            {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }
        }
    }
    //单
    if (o == 2) {
        for (var i = 0; i < cc; i++) {
            if((i + istart) % 2 == 1)
            {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }
        }
    }
    //小
    if (o == 3) {
        var num = data.length / 2;
        for (var i = 0; i < cc; i++) {
            if(GTYPE == 11 || GTYPE == 7 || GTYPE == 5)
            {
                if (i < num - 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);

                }
            }
            else {
                if (i < num) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
        }
    }
    //大
    if (o == 4) {
        var num = data.length / 2;
        for (var i = 0; i < cc; i++) {
            if (GTYPE == 11 || GTYPE == 7) {
                if (i >= num - 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);

                }
            }
            else {
                if (i >= num) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);

                }
            }

        }
    }
    //中
    if (o == 5) {
        var num = data.length / 3;
        for (var i = 0; i < cc; i++) {
            if (GTYPE == 16 || GTYPE == 17) {
                if (i >= num - 1 & i < 2 * num) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }

            }
            else if (GTYPE == 10 || GTYPE == 7) {
                if (i >= num - 1 & i <= 2 * num) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }

            }
            else if (GTYPE == 22) {
                if (i > num - 1 && i < 2 * num) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else if (GTYPE == 11) {
                if (i > num - 1 && i < 2 * num) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else {
                if (i >= num & i < 2 * num - 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
        }
    }
    //边
    if (o == 6) {
        var num = data.length / 4;
        for (var i = 0; i < cc; i++) {
            if (GTYPE == 10 || GTYPE == 7) {
                if (i < num || i >= 3 * num - 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else if (GTYPE == 5) {
                if (i < num - 1 || i > 3 * num ) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else if (GTYPE == 16 || GTYPE == 17) {
                if (i <= num || i >= 3 * num - 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else if (GTYPE == 11) {
                if (i <= num || i > 2 * num + 2) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else if (GTYPE == 22) {
                if (i <= num + 1 || i >= 3 * num - 2) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else {
                if (i < num + 3 || i > 3 * num - 4) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }

        }
    }
    //大单
    if (o == 7) {
        var num = (data.length + imore) / 2;
        for (var i = 0; i < cc; i++) {
            if (GTYPE == 22) {
                if ((i + istart) > num + 2 && (i + istart) % 2 == 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else {
                if ((i + istart) > num && (i + istart) % 2 == 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }

        }
    }
    //小单
    if (o == 8) {
        var num = (data.length + imore) / 2;
        for (var i = 0; i < cc; i++) {

            if (GTYPE == 22) {
                if ((i + istart) < num + 2 && (i + istart) % 2 == 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else {
                if ((i + istart) < num && (i + istart) % 2 == 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }

        }
    }
    //大双
    if (o == 9) {
        var num = (data.length + imore) / 2;
        for (var i = 0; i < cc; i++) {
            if (GTYPE == 22) {
                if ((i + istart) > num + 3 && (i + istart) % 2 == 0) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else {
                if ((i + istart) >= num && (i + istart) % 2 == 0) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }

        }
    }
    //小双
    if (o == 10) {
        var num = (data.length + imore) / 2;
        for (var i = 0; i < cc; i++) {
            if (GTYPE == 22) {
                if ((i + istart) < num + 4 && (i + istart) % 2 == 0) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else {
                if ((i + istart) < num && (i + istart) % 2 == 0) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }

        }
    }
    //大边
    if (o == 11) {
        var num = (data.length + imore) / 3;
        if (GTYPE == 10 || GTYPE == 7) {
            istart--;
        }
        for (var i = 0; i < cc; i++) {
            if (GTYPE == 22) {
                if ((i + istart) > 2 * num + 2) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else if (GTYPE == 11) {
                if ((i + istart) > 2 * num + 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else {
                if ((i + istart) > 2 * num - 1) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }

        }
    }
    //小边
    if (o == 12) {
        var num = (data.length + imore) / 3;
        for (var i = 0; i < cc; i++) {
            if (GTYPE == 22) {
                if ((i + istart) <= num + 3) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }
            else {
                if ((i + istart) <= num) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }
            }

        }
    }
    //0尾
    if (o == 13) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 0) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //1尾
    if (o == 14) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 1) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //2尾
    if (o == 15) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 2) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //3尾
    if (o == 16) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 3) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //4尾
    if (o == 17) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 4) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //小尾
    if (o == 18) {
        if (GTYPE == 10) {
            for (var i = 0; i < cc; i++) {
                if ((i + istart) % 10 < 5 && (i + istart) % 10 >= 0) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }

            }
        } else {
            for (var i = 0; i < cc; i++) {
                if ((i + istart) % 10 < 5) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }

            }
        }
    }
    //5尾
    if (o == 19) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 5) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //6尾
    if (o == 20) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 6) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //7尾
    if (o == 21) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 7) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //8尾
    if (o == 22) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 8) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //9尾
    if (o == 23) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 10 == 9) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //大尾
    if (o == 24) {
        if (GTYPE == 10) {
            for (var i = 0; i < cc; i++) {
                if ((i + istart) % 10 >= 5) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }

            }
        }
        else {
            for (var i = 0; i < cc; i++) {
                if ((i + istart) % 10 >= 5) {
                    $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                    $('input[name=chk]').eq(i).prop("checked", true);
                }

            }
        }
    }
    //3余0
    if (o == 25) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 3 == 0) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //3余1
    if (o == 26) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 3 == 1) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //3余2
    if (o == 27) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 3 == 2) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //4余0
    if (o == 28) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 4 == 0) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //4余1
    if (o == 29) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 4 == 1) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //4余2
    if (o == 30) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 4 == 2) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //4余3
    if (o == 31) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 4 == 3) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //5余0
    if (o == 32) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 5 == 0) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //5余1
    if (o == 33) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 5 == 1) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //5余2
    if (o == 34) {

        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 5 == 2) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //5余3
    if (o == 35) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 5 == 3) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    //5余4
    if (o == 36) {
        for (var i = 0; i < cc; i++) {
            if ((i + istart) % 5 == 4) {
                $("input[name='tbNum[]']").eq(i).val(parseInt(data[i]));
                $('input[name=chk]').eq(i).prop("checked", true);
            }

        }
    }
    Count_Total();
}

function chgAllTimes(times)
{
    var data = PRESSNUM.split(",");
    if(parseInt($("#bet-total").html()) * times > MAX_SCORE){
        alert('已超过最大上限' + MAX_SCORE);
        return;
    }
    $("#hidTimes").val($("#hidTimes").val() * times);
    for(var i = 0; i < data.length; i++){
        if(parseInt($("input[name='tbNum[]']").eq(i).val()) * times > 1){
            if($("input[name='tbNum[]']").eq(i).val() > 0){
                $("#bet-total").html( parseInt($("#bet-total").html()) + Math.floor(parseInt($("input[name='tbNum[]']").eq(i).val()) * times) - parseInt($("input[name='tbNum[]']").eq(i).val()) );
                $("input[name='tbNum[]']").eq(i).val( Math.floor(parseInt($("input[name='tbNum[]']").eq(i).val()) * times ));
                $('input[name=chk]').eq(i).prop("checked", true);
            }
        }
        else{
            if($("input[name='tbNum[]']").eq(i).val() > 0){
                $("#bet-total").html( parseInt($("#bet-total").html())  - parseInt($("input[name='tbNum[]']").eq(i).val()) );
                $("input[name='tbNum[]']").eq(i).val('');
                $('input[name=chk]').eq(i).prop("checked", false);
            }
        }
    }
}

$("input[name='tbNum[]']").on('blur', function(){
    var $this = $(this),
        role = $this.attr('role'),
        $chk = $('input[name=chk][role=' + role + ']');
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
        role = $this.attr('role'),
        $intpt = $("input[name='tbNum[]'][role='" + role + "']"),
        theNum = $intpt.attr('data-index'),
        data = PRESSNUM.split(",");

    if($this.prop("checked")){
        $intpt.val(data[theNum]);
        if($("#bet-total").html() == ""){
            $("#bet-total").html(0);
        }
        $("#bet-total").html(parseInt($("#bet-total").html()) + parseInt(data[theNum]));
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
    var data = PRESSNUM.split(",");
    for(var i = 0;i < data.length;i++){
        var $chk = $("input[name=chk]").eq(i),
            $input = $("input[name='tbNum[]']").eq(i);
        if(data[i] > 0){
            if($chk.prop("checked")){
                $chk.prop("checked",false);
                $("#bet-total").html(Math.floor(parseInt($("#bet-total").html()) - parseInt($input.val()) ));
                $input.val('');
            }
            else{
                $input.val(Math.floor(data[i] * $("#hidTimes").val()));
                $chk.prop("checked",true);
                $("#bet-total").html(Math.floor(parseInt($("#bet-total").html()) + parseInt(data[i]) * $("#hidTimes").val() ));
            }
        }
    }
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
    var data = PRESSNUM.split(",");
    for(var i = 0; i < data.length; i++)
    {
        if($("input[name=chk]").eq(i).prop("checked"))
        {
            totalScore += parseInt($("input[name='tbNum[]']").eq(i).val());
        }
    }
    for(var i= 0; i < data.length; i++)
    {
        if($("input[name=chk]").eq(i).prop("checked"))
        {
            if(MY_SCORE <= MAX_SCORE)
            {
                perScore = MY_SCORE / totalScore * parseInt($("input[name='tbNum[]']").eq(i).val());
            }
            else
            {
                perScore = MAX_SCORE / totalScore * parseInt($("input[name='tbNum[]']").eq(i).val());
            }
            $("input[name='tbNum[]']").eq(i).val(parseInt(perScore));
            totalPressScore += parseInt(perScore);
        }
    }
    $("#bet-total").html(totalPressScore);
})


$('#usefenpei').on('click', function(){
    var totalScore = 0;
    var perScore = 0;
    var totalPressScore = 0;
    var data = PRESSNUM.split(",");
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
        for(var i = 0; i < data.length; i++)
        {
            if($("input[name=chk]").eq(i).prop("checked"))
            {
                checked_num=checked_num+1;
            }
        }
        if(Input_Score<checked_num){
            alert('分配分不够!');
            return;
        }
        if(Input_Score>MAX_SCORE){
            $('#betsLeft').val(MAX_SCORE);
            return;
        }
    }

    for(var i = 0; i < data.length; i++)
    {
        if($("input[name=chk]").eq(i).prop("checked"))
        {
            totalScore += parseInt($("input[name='tbNum[]']").eq(i).val());
        }
    }
    for(var i= 0; i < data.length; i++)
    {
        if($("input[name=chk]").eq(i).prop("checked"))
        {
            if(Input_Score <= MAX_SCORE)
            {
                perScore = Input_Score / totalScore * parseInt($("input[name='tbNum[]']").eq(i).val());
            }
            else
            {
                perScore = MAX_SCORE / totalScore * parseInt($("input[name='tbNum[]']").eq(i).val());
            }
            $("input[name='tbNum[]']").eq(i).val(parseInt(perScore));
            totalPressScore += parseInt(perScore);
        }
    }
    $("#bet-total").html(totalPressScore);
})

$('#sltMode').on('change', function(){
    var modelid = $(this).val();
    if(modelid == 0){
        $('#txtModelName').val('模式1');
    }else{
        $.ajax({
            url: '/games/get_mode',
            type: 'post',
            dataType: 'json',
            data: {
                mid: modelid,
                gid: GID
            },
            success: function(map){
                if(map.code == 200){
                    $('#txtModelName').val(map.data.mode_name);
                    init();
                    var totalPressScore = 0;
                    $("input[name='tbNum[]']").each(function(){
                        var key_name = $(this).attr('role'),
                            key_val = parseInt(map.data[key_name]);
                        key_val = key_val ? key_val : 0;
                        totalPressScore = totalPressScore + key_val;
                        if(key_val){
                            $(this).val(key_val);
                            $("input[name=chk][role="+key_name+"]").prop("checked", true);
                        }
                    })
                    $("#bet-total").html(totalPressScore);

                }
            }
        })
    }
})

$('#btnremove').on('click', function(){
    var modelid = $('#sltMode').val();
    if(modelid != 0){
        $.ajax({
            url: '/games/mode_del',
            type: 'post',
            dataType: 'json',
            data: {
                mid: modelid,
                gid: GID
            },
            success: function(map){
                if(map.code == 200){
                    var option = '<option value="0">--新建模式--</option>';
                    $.each(map.data, function(i,o){
                        option += '<option value="'+ o.id+'">'+ o.mode_name+'</option>';
                    });
                    $('#sltMode').html(option);
                    $('#txtModelName').val('模式1');
                    init();
                    alert('删除成功！')

                }else{
                    alert(map.msg);
                }
            }
        })
    }
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
                $("input[name='tbNum[]']").each(function(){
                    var key_name = $(this).attr('role'),
                        key_val = parseInt(map.data[key_name]);
                    key_val = key_val ? key_val : 0;
                    totalPressScore = totalPressScore + key_val;
                    if(key_val){
                        $(this).val(key_val);
                        $("input[name=chk][role="+key_name+"]").prop("checked", true);
                    }
                })
                $("#bet-total").html(totalPressScore);
            }else{
                alert(map.msg);
            }
        }
    })
});

c = 0;
function chips(num,i){
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