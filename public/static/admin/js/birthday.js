layui.define(["jquery",'form'], function (exports) {
var $ = layui.jquery;
var form = layui.form;
// (function ($,form) {
// $.extend({
var obj= {  
            YearSelector: ".sel_year",
            MonthSelector: ".sel_month",
            DaySelector: ".sel_day",
            FirstText: "--",
            FirstValue: 0,
            
            ms_DatePicker:function () {
           
            // var opts = $.extend({}, defaults, options);
            var $YearSelector = $(this.YearSelector);
            var $MonthSelector = $(this.MonthSelector);
            var $DaySelector = $(this.DaySelector);
            var FirstText = this.FirstText;
            var FirstValue = this.FirstValue;
            // console.info($YearSelector instanceof jQuery);
            // 初始化
            var str = "<option value=\"" + FirstValue + "\">" + FirstText + "</option>";
            $YearSelector.html(str);
            $MonthSelector.html(str);
            $DaySelector.html(str);

            // 年份列表
            var yearNow = new Date().getFullYear();
            var yearSel = $YearSelector.attr("rel");
            for (var i = yearNow; i >= 1900; i--) {
                var sed = yearSel==i?"selected":"";
                var yearStr = "<option value=\"" + i + "\" " + sed+">" + i + "</option>";
                $YearSelector.append(yearStr);
            }


            // 月份列表
            var monthSel = $MonthSelector.attr("rel");
            for (var i = 1; i <= 12; i++) {
                var sed = monthSel==i?"selected":"";
                var monthStr = "<option value=\"" + i + "\" "+sed+">" + i + "</option>";
                $MonthSelector.append(monthStr);
            }

            // 日列表
            var daySel = $DaySelector.attr("rel");
            var dayStr = "<option value=\"" + daySel + "\" "+ " selected >" + daySel + "</option>";
            $DaySelector.append(dayStr);
            

            form.render('select');

            // 日列表(仅当选择了年月)
            function BuildDay() {
                if ($YearSelector.val() == 0 || $MonthSelector.val() == 0) {
                    // 未选择年份或者月份
                    $DaySelector.html(str);
                } else {
                    $DaySelector.html(str);
                    var year = parseInt($YearSelector.val());
                    var month = parseInt($MonthSelector.val());
                    var dayCount = 0;
                    switch (month) {
                        case 1:
                        case 3:
                        case 5:
                        case 7:
                        case 8:
                        case 10:
                        case 12:
                            dayCount = 31;
                            break;
                        case 4:
                        case 6:
                        case 9:
                        case 11:
                            dayCount = 30;
                            break;
                        case 2:
                            dayCount = 28;
                            if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
                                dayCount = 29;
                            }
                            break;
                        default:
                            break;
                    }
                    
                    var daySel = $DaySelector.attr("rel");
                    for (var i = 1; i <= dayCount; i++) {
                        var sed = daySel==i?"selected":"";
                        var dayStr = "<option value=\"" + i + "\" "+sed+">" + i + "</option>";
                        $DaySelector.append(dayStr);
                    }
                }
            }


            // $MonthSelector.change(function () {
            //     BuildDay();
            // });

            // $YearSelector.change(function () {
            //     BuildDay();
            // });
            form.on('select(birth)',function(data){
                BuildDay();
                form.render();
            })

            // if($DaySelector.attr("rel")!=""){
            //     BuildDay();
            // }


          }
        }; // End ms_DatePicker
// });
//          // End ms_DatePicker
// })($,form);
exports('birthday',obj);
});