page_size = 100;

function render(){
    $.ajax({
        url: '/game/get_chart',
        type: 'get',
        dataType: 'html',
        data: {
            gid: GID,
            page_size: page_size
        },
        success: function(map){
            $('#chart-table').html(map);
        }
    })
}

render();

$('#chart-table').on('change', '#sltNum', function(){
    val = $(this).val();
    page_size = val;
    render();
})