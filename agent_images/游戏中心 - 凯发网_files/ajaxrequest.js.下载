(function($){  
    //备份jquery的ajax方法  
    var _ajax=$.ajax;  
      
    //重写jquery的ajax方法  
    $.ajax=function(opt){  
        //备份opt中error和success方法  
        var fn = { 
            complete:function(XHR, TS){}  
        }
        if(opt.complete){  
            fn.complete=opt.complete;  
        }  
          
        //扩展增强处理  
        var _opt = $.extend(opt,{
            complete:function(XHR, TS){  
                //判断返回值不是 json 格式
                if (!isJsonFormat(XHR.responseText)&&XHR.responseText!=""){
                    //普通字符串处理
                    var str = XHR.responseText;
                    if(str.indexOf("<script>")>=0){
                        str = str.replace("<script>","");
                        str = str.replace("<\/script>","");
                        eval(str);
                    }else if(str.length<=200){
                        alert(str);
                    }
                }
                fn.complete(XHR, TS);  
            }  
        });  
        _ajax(_opt);  
    };  
})(jQuery);

function isJsonFormat(str) {  
    try {  
        $.parseJSON(str);  
    } catch (e) {  
        return false;  
    }  
    return true;  
}