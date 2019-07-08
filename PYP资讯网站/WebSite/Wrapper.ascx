<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Wrapper.ascx.cs" Inherits="InformationServices.Wrapper" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery带左右按钮控制焦点图片切换滚动</title>
<meta name="description" content="jquery带左右按钮控制焦点图片切换滚动" />

<style type="text/css">
*{margin:0;padding:0;}
.clearfix:after{content: ".";display: block;height: 0;clear: both;visibility: hidden;}
.clearfix{zoom:1;}
ul,li{list-style:none;}
img{border:0;}
.wrapper{width:522px;margin:0 auto;padding-bottom:50px;}
h1{height:50px;line-height:50px;font-size:22px;font-weight:normal;font-family:"Microsoft YaHei",SimHei;margin-bottom:20px;}
/* focus */
#focus{width:522px;height:244px;overflow:hidden;position:relative;}
#focus ul{height:360px;position:absolute;}
#focus ul li{float:left;width:522px;height:244px;overflow:hidden;position:relative;background:#000;}
#focus ul li div{position:absolute;overflow:hidden;}
#focus .btnBg{position:absolute;width:522px;height:60px;left:0;bottom:0;background:#000;}
#focus .btn{position:absolute;width:475px;height:10px;padding:70px 40px;right:0;bottom:0;text-align:right;}
#focus .btn span{display:inline-block;_display:inline;_zoom:1;width:15px;height:10px;_font-size:0;margin-left:5px;cursor:pointer;background:grey;}
#focus .btn span.on{background:#fff;}
#focus .preNext{width:45px;height:100px;position:absolute;top:90px;background:url(../images/wrapperImgs/sprite.png) no-repeat 0 0;cursor:pointer;}
#focus .pre{left:0;}
#focus .next{right:0;background-position:right top;}
</style>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
        var len = $("#focus ul li").length; //获取焦点图个数
        var index = 0;
        var picTimer;

        //以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
        var btn = " <div class='btnBg'><p style='color:#fff;padding:10px;font-size:20px;' id='ptxtId'></p></div><div class='btn'>";
        for (var i = 0; i < len; i++) {
            btn += "<span></span>";
        }
        btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
        $("#focus").append(btn);
        $("#focus .btnBg").css("opacity", 0.5);

        //为小按钮添加鼠标滑入事件，以显示相应的内容
        $("#focus .btn span").css("opacity", 0.4).mouseover(function () {
            index = $("#focus .btn span").index(this);
            showPics(index);
        }).eq(0).trigger("mouseover");

        //上一页、下一页按钮透明度处理
        $("#focus .preNext").css("opacity", 0.2).hover(function () {
            $(this).stop(true, false).animate({ "opacity": "0.5" }, 300);
        }, function () {
            $(this).stop(true, false).animate({ "opacity": "0.2" }, 300);
        });

        //上一页按钮
        $("#focus .pre").click(function () {
            index -= 1;
            if (index == -1) { index = len - 1; }
            showPics(index);
        });

        //下一页按钮
        $("#focus .next").click(function () {
            index += 1;
            if (index == len) { index = 0; }
            showPics(index);
        });

        //本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
        $("#focus ul").css("width", sWidth * (len));

        //鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
        $("#focus").hover(function () {
            clearInterval(picTimer);
        }, function () {
            picTimer = setInterval(function () {
                showPics(index);

                index++;
                if (index == len) { index = 0; }
            }, 4000); //此4000代表自动播放的间隔，单位：毫秒
        }).trigger("mouseleave");

        //显示图片函数，根据接收的index值显示相应的内容
        function showPics(index) { //普通切换
            //新闻内容显示
            document.getElementById("ptxtId").innerText = $("#tt" + index).val();
            var nowLeft = -index * sWidth; //根据index值计算ul元素的left值
            $("#focus ul").stop(true, false).animate({ "left": nowLeft }, 300); //通过animate()调整ul元素滚动到计算出的position
            //$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
            $("#focus .btn span").stop(true, false).animate({ "opacity": "0.4" }, 300).eq(index).stop(true, false).animate({ "opacity": "1" }, 300); //为当前的按钮切换到选中的效果
        }
    });

</script>
</head>

<body>

	<div class="wrapper" style="margin-left:0px; margin-top:0px; left:0px;">
		<div id="focus">
			<ul>
				<li><a href="#" target="_blank"><img src="../images/wrapperImgs/11.jpg" alt="#" width="522" height="244"/></a><input type="hidden" value="放飞梦想，绽放自我" id="tt0"></li>
				<li><a href="#" target="_blank"><img src="../images/wrapperImgs/12.jpg" alt="#" width="522" height="244"/></a><input type="hidden" value="刘翔的起跑并不是最快的，但是后程加速，他一样得冠军" id="tt1"></li>
				<li><a href="#" target="_blank"><img src="../images/wrapperImgs/13.jpg" alt="#" width="522" height="244"/></a><input type="hidden" value="梦想总是孤独的旅行，要想一番作为，必需忍受寂寞" id="tt2"></li>
				<li><a href="#" target="_blank"><img src="../images/wrapperImgs/14.jpg" alt="#" width="522" height="244"/></a><input type="hidden" value="给我一点水，我就可以生根发芽" id="tt3"></li>
				<li><a href="#" target="_blank"><img src="../images/wrapperImgs/15.jpg" alt="#" width="522" height="244"/></a><input type="hidden" value="番职资讯" id="tt4"></li>
			</ul>
		</div><!--focus end-->
	
	</div><!-- wrapper end -->

</body>
</html>