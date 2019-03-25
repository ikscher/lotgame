// JavaScript Document
function reloadcode() {
    var verify = document.getElementById('safecode');
    verify.setAttribute('src', '/AJAX/ValidateCode.aspx?' + Math.random());
//这里必须加入随机数不然地址相同我发重新加载
}
$.fn.ComProOnChange = function (obj) {
    var modeid = $(obj).find("option:selected").attr("value");
    if (modeid != 0) {
        $("#thebg").removeClass();
        if ($(".mlink input:hidden[value=" + modeid + "]").length > 0) {
            $(".mlink input:hidden[value=" + modeid + "]").parent("tr").css("show");
        } else {
            var otr = $(".mlink tr:first").clone();
            $(otr).removeClass();
            $(otr).find(".mn").text($(obj).find("option:selected").text());
            $(otr).find("input:hidden").attr("name", "i" + modeid).attr("id", "i" + modeid).attr("value", modeid);
            var osel1 = $(otr).find("select:first");
            $(osel1).attr("name", "w" + modeid).attr("id", "w" + modeid);
            $.each($(osel1).find("option"), function (i, n) {
                if ($(n).attr("value") == modeid) {
                    $(n).attr("selected", "selected");
                } else {
                    $(n).removeAttr("selected");
                }
            });

            var osel2 = $(otr).find("select:last");
            $(osel2).attr("name", "l" + modeid).attr("id", "l" + modeid);
            $.each($(osel2).find("option"), function (i, n) {
                if ($(n).attr("value") == modeid) {
                    $(n).attr("selected", "selected");
                } else {
                    $(n).removeAttr("selected");
                }
            });

            $(".mlink").append(otr);
        }
    }
}
$.fn.IsZhengInt = function (var1) {
    var patrn = /^[0-9]*[1-9][0-9]*$/;
    if (!patrn.exec(var1)) {
        return false;
    } else {
        return true;
    }
}
$.fn.Isemail = function (var1) {
    var patrn = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if (!patrn.exec(var1)) {
        return false;
    } else {
        return true;
    }
}
$.fn.FormatMoney = function (var1) {
    var1 = var1 + "";
    var res = "";
    var t = var1.length % 3;
    res += var1.substring(0, t);
    for (i = t; i < var1.length - t; i += 3) {
        res += "," + var1.substring(i, i + 3);
    }
    if (res.indexOf(",") == 0) {
        res = res.substring(1, res.length);
    }
    return res;
}
$.fn.UnFormatMoney = function (var1) {
    var res = var1.replace(new RegExp(",", "gm"), "");
    return res;
}
$.fn.AUpdateMoney = function () {
    var countmoney = 0;
    for (i = 0; i < anum.length; i++) {
        if ($("#" + cbids[i]).attr("checked")) {
            countmoney += parseInt($("#" + tbids[i]).attr("value"));
        }
    }
    var res = $.fn.FormatMoney(countmoney);
    $("#tbTotalG1").text(res);
}

var isinit;
$.fn.AUpdateTbMoney = function () {
    var countmoney = 0,i=0;
		if(anum.length == 0){
			 isinit = 1;	
			}else{
			 isinit = 0;
			}
	while(1){
	
		if($("#tbNum"+i).length > 0){
			if(isinit == 1){
				anum.push(i);
				cbids.push('tbChk'+i);
				tbids.push('tbNum'+i);
			}
			if ($("#tbChk"+i ).attr("checked")) {
            countmoney += parseInt($("#tbNum"+i ).attr("value"));
			}
		}else{
			break;
		}
		i++
	}
    var res = $.fn.FormatMoney(countmoney);
    $("#tbTotalG1").text(res);
}

$.fn.AMakeit = function (varabool) {
    for (i = 0; i < varabool.length; i++) {
        if (varabool[i]) {
            $("#" + cbids[i]).attr("checked", 'true');
            $("#" + tbids[i]).attr("value", astandmoney[i]);
			if(isWWstyle != 1){
			$("#" + tbids[i]).parent().parent().parent().css('background', '#F4F4F4');
            $("#" + tbids[i]).parent().parent().prev().find('.numb').css('background', '#e64047');
            $("#" + tbids[i]).parent().next().css('display', 'block');
			}
            
        } else {
            $("#" + cbids[i]).removeAttr("checked");
            $("#" + tbids[i]).attr("value", "");
			if(isWWstyle != 1){
            $("#" + tbids[i]).parent().parent().parent().css('background', '#FFF');
            $("#" + tbids[i]).parent().parent().prev().find('.numb').css('background', '#fb9800');
            $("#" + tbids[i]).parent().next().css('display', 'none');
			}
        }
    }
    $.fn.AUpdateMoney();
}

$.fn.APreIssue = function () {
    $.fn.AClearAll();
    for (i = 0; i < apreactionnum.length; i++) {

        for (j = 0; j < anum.length; j++) {
            if (anum[j] == apreactionnum[i]) {
                $("#" + cbids[j]).attr("checked", 'true');
                $("#" + tbids[j]).attr("value", apreactionmoney[i]);
                break;
            }
        }
    }

    $.fn.AUpdateMoney();
}
//梭哈
$.fn.APutAll = function () {
    var tnum = new Array(anum.length);
    var tmoney = new Array(anum.length);
    var tcountmoney = 0;
    if (mymoney > maxtz) {
        mymoney = maxtz;
    }
    for (i = 0; i < anum.length; i++) {
        if ($("#" + cbids[i]).attr("checked")) {
            tmoney[i] = parseInt($("#" + tbids[i]).attr("value"));
            tcountmoney += tmoney[i];
        }
    }
    for (i = 0; i < anum.length; i++) {
        if ($("#" + cbids[i]).attr("checked")) {
            thisnummoney = parseInt(mymoney * (tmoney[i] / tcountmoney));
            $("#" + tbids[i]).attr("value", thisnummoney);
        }
    }
    $.fn.AUpdateMoney();
}
//反选
$.fn.AOpside = function () {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if ($("#" + cbids[i]).attr("checked") && $("#" + tbids[i]).val() != '0') {
            abool.push(false);
        } else {
            abool.push(true);
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.AClearAll = function () {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        abool.push(false);
    }
    $.fn.AMakeit(abool);
}
$.fn.ASelectAll = function () {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        abool.push(true);
    }
    $.fn.AMakeit(abool);
}
$.fn.AOddEven = function (var1) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (anum[i] % 2 == 0) {
            abool.push(var1 == "odd" ? false : true);
        } else {
            abool.push(var1 == "odd" ? true : false);
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.ABigLittle = function (var1) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (i < parseInt(anum.length / 2)) {
            abool.push(var1 == "big" ? false : true);
        } else {
            abool.push(var1 == "big" ? true : false);
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.ACenSide = function (var1, var2) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (i >= beg && i <= end) {
            abool.push(var1 == "side" ? false : true);
        } else {
            abool.push(var1 == "side" ? true : false);
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.ABigLittleOdd = function (var1) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (anum[i] % 2 == 0) {
            abool.push(false);
        } else {
            if (i < parseInt(anum.length / 2)) {
                abool.push(var1 == "big" ? false : true);
            } else {
                abool.push(var1 == "big" ? true : false);
            }
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.ABigLittleEven = function (var1) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (anum[i] % 2 == 0) {
            if (i < parseInt(anum.length / 2)) {
                abool.push(var1 == "big" ? false : true);
            } else {
                abool.push(var1 == "big" ? true : false);
            }
        } else {
            abool.push(false);
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.ASideOddEvenBigLittle = function (var1, var2, var3) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (i >= beg && i <= end) {
            abool.push(false);
        } else {
            if (var3 == "biglittle") {
                if (i < parseInt(anum.length / 2)) {
                    abool.push(var1 == "big" ? false : true);
                } else {
                    abool.push(var1 == "big" ? true : false);
                }
            } else {
                if (anum[i] % 2 == 0) {
                    abool.push(var1 == "odd" ? false : true);
                } else {
                    abool.push(var1 == "odd" ? true : false);
                }
            }
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.AEnd = function (var1) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (anum[i] >= 10) {
            if ((anum[i] - parseInt(anum[i] / 10) * 10) == var1) {
                abool.push(true);
            } else {
                abool.push(false);
            }
        } else {
            if (anum[i] == var1) {
                abool.push(true);
            } else {
                abool.push(false);
            }
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.AEndBigLittle = function (var1) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (anum[i] >= 10) {
            if ((anum[i] - parseInt(anum[i] / 10) * 10) < 5) {
                abool.push(var1 == "little" ? true : false);
            } else {
                abool.push(var1 == "little" ? false : true);
            }
        } else {
            if (anum[i] < 5) {
                abool.push(var1 == "little" ? true : false);
            } else {
                abool.push(var1 == "little" ? false : true);
            }
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.AAC = function (var1, var2) {
    var abool = new Array();
    for (i = 0; i < anum.length; i++) {
        if (anum[i] % var1 == var2) {
            abool.push(true);
        } else {
            abool.push(false);
        }
    }
    $.fn.AMakeit(abool);
}
$.fn.ATimes = function (var1, var2) {
	
    for (i = 0; i < anum.length; i++) {
		console.log(i);
        if ($("#" + cbids[i]).attr("checked")) {
            $("#" + tbids[i]).val(parseInt($("#" + tbids[i]).val() * var1));
        } else {
            $("#" + tbids[i]).val("");
        }
        if ($("#" + tbids[i]).val() == 0) {
           if(isWWstyle != 1){
			    $("#" + tbids[i]).parent().parent().parent().css('background', '#FFF');
            $("#" + tbids[i]).parent().parent().prev().find('.numb').css('background', '#fb9800');
            $("#" + tbids[i]).parent().next().css('display', 'none');
		   }
        }
    }
    $.fn.AUpdateMoney();
}
$.fn.ATimesOne = function (var1, var2) {
    var oin = $(var2).parent().prev().find("input:text");
    $(oin).attr("value", parseInt($(oin).attr("value") * var1));
    $.fn.AUpdateMoney();
}


$.fn.ACheckTbChange = function (obj, var1) {
   
     
			var i = var1;
            if ($("#tbNum"+i).val() != '0' && $("#tbNum"+i).val() != '') {
                $("#tbChk"+i).removeAttr("checked");
                $("#tbNum"+i).attr("value", '');
               // $(obj).parent().css('background', '#FFF');
                //$(obj).find('div').css('background', '#fb9800');
               // $(obj).next().find('span').css('display', 'none');
            } else {
                $("#tbChk"+i).attr("checked", 'true');
				$("#tbNum"+i).attr("value", 100);   
              //  $(obj).parent().css('background', '#F4F4F4');
              //  $(obj).find('div').css('background', '#e64047');
               // $(obj).next().find('span').css('display', 'block');
            }
         
        
    
    $.fn.AUpdateTbMoney();
}


$.fn.ACheckBoxChange = function (obj, var1) {
    for (var i = 0; i < anum.length; i++) {
        if (anum[i] == var1) {
            if ($("#" + tbids[i]).val() != '0' && $("#" + tbids[i]).val() != '') {
                $("#" + cbids[i]).removeAttr("checked");
                $("#" + tbids[i]).attr("value", 0);
                $(obj).parent().css('background', '#FFF');
                $(obj).find('div').css('background', '#fb9800');
                $(obj).next().find('span').css('display', 'none');
            } else {
                $("#" + cbids[i]).attr("checked", 'true');
				$("#" + tbids[i]).attr("value", astandmoney[i]);   
                $(obj).parent().css('background', '#F4F4F4');
                $(obj).find('div').css('background', '#e64047');
                $(obj).next().find('span').css('display', 'block');
            }
            break;
        }
    }
    $.fn.AUpdateMoney();
}



$.fn.ATextTbChange = function (obj, var1) {
			if ($.fn.IsZhengInt(obj.value)) {
                if (parseInt(obj.value) > 0) {
                    $("#tbChk" + var1).attr("checked", 'true');
                //    $("#tbChk" + var1).parent().parent().parent().css('background', '#F4F4F4');
                //    $("#tbChk" + var1).parent().parent().prev().find('.numb').css('background', '#e64047');
                //    $(obj).parent().next().css('display', 'block');
                } else {
                    $("#tbChk" + var1).removeAttr("checked");
                    obj.value = '';
                  //  $("#" + tbids[i]).parent().parent().parent().css('background', '#FFF');
                  //  $("#" + tbids[i]).parent().parent().prev().find('.numb').css('background', '#fb9800');
                  //  $(obj).parent().next().css('display', 'none');
                }
            } else {
                $("#tbChk" + var1).removeAttr("checked");
                obj.value = '';
               // $("#tbChk" + var1).parent().parent().parent().css('background', '#FFF');
               // $("#tbChk" + var1).parent().parent().prev().find('.numb').css('background', '#fb9800');
               // $(obj).parent().next().css('display', 'none');
            }
            $.fn.AUpdateMoney();
}



$.fn.ATextChange = function (obj, var1) {
    for (var i = 0; i < anum.length; i++) {
        if (anum[i] == var1) {
            if ($.fn.IsZhengInt(obj.value)) {
                if (parseInt(obj.value) > 0) {
                    $("#" + cbids[i]).attr("checked", 'true');
                    $("#" + tbids[i]).parent().parent().parent().css('background', '#F4F4F4');
                    $("#" + tbids[i]).parent().parent().prev().find('.numb').css('background', '#e64047');
                    $(obj).parent().next().css('display', 'block');
                } else {
                    $("#" + cbids[i]).removeAttr("checked");
                    obj.value = 0;
                    $("#" + tbids[i]).parent().parent().parent().css('background', '#FFF');
                    $("#" + tbids[i]).parent().parent().prev().find('.numb').css('background', '#fb9800');
                    $(obj).parent().next().css('display', 'none');
                }
            } else {
                $("#" + cbids[i]).removeAttr("checked");
                obj.value = 0;
                $("#" + tbids[i]).parent().parent().parent().css('background', '#FFF');
                $("#" + tbids[i]).parent().parent().prev().find('.numb').css('background', '#fb9800');
                $(obj).parent().next().css('display', 'none');
            }
            $.fn.AUpdateMoney();
            break;
        }
    }
}
$.fn.CompareTime = function (var1, var2) {
    return Date.parse(var1.replace(/-/g, "/")) > Date.parse(var2.replace(/-/g, "/"));
}
$.fn.GetTimeCSecond = function (var1, var2) {
    return parseInt((Date.parse(var1.replace(/-/g, "/")) - Date.parse(var2.replace(/-/g, "/"))) / 1000);
}
$.fn.ShowMeOnly = function (obj) {
    $(".gtable table tr").filter(function (index) {
        return $(this).find("td:eq(6) font:first").text() == "0";
    }).attr("style", "display:none;");
    $(obj).attr("style", "display:none;");
    $(obj).next().attr("style", "display:block-inline;");
}
$.fn.ShowAllIssue = function (obj) {
    $(".gtable table tr").attr("style", "display:table-row;");
    $(obj).attr("style", "display:none;");
    $(obj).prev().attr("style", "display:block-inline;");
}
function setCookie(c_name, value, expiredays) {
    var exdate = new Date()
    exdate.setDate(exdate.getDate() + expiredays)
    document.cookie = c_name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
}
function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=")
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1
            c_end = document.cookie.indexOf(";", c_start)
            if (c_end == -1) c_end = document.cookie.length
            return unescape(document.cookie.substring(c_start, c_end))
        }
    }
    return ""
}


