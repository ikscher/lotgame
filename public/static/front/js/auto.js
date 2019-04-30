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

$('[role=changemodel]').on('change', function(){
    var type = $(this).attr('data-type'),
        save_mode_id = $(this).val(),
        mode_id = $(this).attr('data-modeid');
    $.ajax({
        url: '/games/auto_save_sy',
        type: 'post',
        dataType: 'json',
        data: {
            gid: GID,
            type: type,
            mode_id: mode_id,
            save_mode_id: save_mode_id
        },
        success: function(map){
            if(map.code == 200){
                alert('设置成功！');
            }
        }
    })
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
    var mode_type = 0,//自动投注方式
        mode_num = $('#startMode').val(),//开始模式
        start_period = $('#startNo').val(),//开始期号
        period = $('#times').val(),//期数
        upper_limit = parseInt($('#maxG').val()),//金币上限
        lower_limit = parseInt($('#minG').val()),//金币下限
        conve_id = $('#conveID').val(),//对号投注模式ID
        action = $(this).attr('data-action');//保存/取消
    if(action == 'save'){

        if(lower_limit < 100){
            alert('金币下限不能少于100');
            return;
        }
        if(lower_limit >= upper_limit){
            alert('金币上限必须大于金币下限');
            return;
        }

        if(period < 10){
            alert('投注期数至少不少于10期');
            return;
        }

        if(mode_type == 0 && !mode_num){
            alert('没有选择开始模式');
            return;
        }

        $.ajax({
            url: '/games/auto_save',
            type: 'post',
            dataType: 'json',
            data: {
                gid: GID,
                mode_type: mode_type,
                mode_num: mode_num,
                start_period: start_period,
                period: period,
                conve_id: conve_id,
                upper_limit: upper_limit,
                lower_limit: lower_limit
            },
            success: function(map){
                if(map.code == 200){
                    alert('设置成功!');
                    $('select').prop('disabled',true);
                    $('input').prop('disabled',true);
                    $('#auto-submit').attr('data-action','cancel').html('取消自动投注');

                }else{
                    alert(map.msg);
                }
            }
        })
    }else{
        $.ajax({
            url: '/games/auto_cancel',
            type: 'post',
            dataType: 'json',
            data: {
                gid: GID
            },
            success: function(map){
                if(map.code == 200){
                    $('select').prop('disabled',false);
                    $('input').prop('disabled',false);
                    $('#auto-submit').attr('data-action','save').html('确定提交');

                }else{
                    alert('取消失败，请稍后重试！');
                }
            }
        })
    }

})