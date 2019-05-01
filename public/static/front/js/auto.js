// $('#sltAutoType').on('change', function(){
//     var val = $(this).val();
//     if(val == 0){
//         $('#toSY').show();
//         $('#toNO').hide();
//         $('#spanStartMode').show();
//     }else{
//         $('#toSY').hide();
//         $('#toNO').show();
//         $('#spanStartMode').hide();
//     }
// })
layui.use(['layer','form'],function(){
    var layer=layui.layer,form=layui.form;
})
$('[role=changemodel]').on('change', function(){
    var bidmoney =  $(this).children('option:selected').val();
    // console.log(bidmoney)
    $('#bidmoney').text(bidmoney);
    
})



// $('[role=changeduihaomodel]').on('change', function(){
//     var offset = $(this).attr('data-offset'),
//         conve_id = $('#conveID').val(),
//         mode_id = $(this).val();
//     $.ajax({
//         url: '/games/auto_save_dh',
//         type: 'post',
//         dataType: 'json',
//         data: {
//             gid: GID,
//             offset: offset,
//             conve_id: conve_id,
//             mode_id: mode_id
//         },
//         success: function(map){
//             if(map.code == 200){
//                 alert('设置成功！');
//             }
//         }
//     })
// })

$('#auto-submit').on('click', function(){
    var mode_id = $('#startMode').children('option:selected').attr('data-id'),//开始模式
        start_period = $('#startNo').val(),//开始期号
        period = $('#times').val(),//期数
        upper_limit = parseInt($('#maxG').val()),//金币上限
        lower_limit = parseInt($('#minG').val()),//金币下限
        action = $(this).attr('data-action');//保存/取消
    if(action == 'save'){

        if(lower_limit < 100){
            layer.alert('金币下限不能少于100');
            return;
        }
        if(lower_limit >= upper_limit){
            layer.alert('金币上限必须大于金币下限');
            return;
        }

        if(period < 10){
            layer.alert('投注期数至少不少于10期');
            return;
        }

        if(!mode_id){
            layer.alert('没有选择模式');
            return;
        }

        $.ajax({
            url: '/game/save_autobet',
            type: 'post',
            dataType: 'json',
            data: {
                gid: GID,
                mode_id: mode_id,
                start_period: start_period,
                period: period,
                upper_limit: upper_limit,
                lower_limit: lower_limit
            },
            success: function(map){
                layer.alert(map.msg);
                if(map.code == 200){
                    $('select').prop('disabled',true);
                    $('input').prop('disabled',true);
                    $('#auto-submit').attr('data-action','cancel').html('取消自动投注');
                }
            }
        })
    }else{
        $.ajax({
            url: '/game/del_autobet',
            type: 'post',
            dataType: 'json',
            data: {
                gid: GID
                // mode_id: mode_id
            },
            success: function(map){
                layer.alert(map.msg);
                if(map.code == 200){
                    $('select').prop('disabled',false);
                    $('input').prop('disabled',false);
                    $('#auto-submit').attr('data-action','save').html('确定提交');
                }
            }
        })
    }

})