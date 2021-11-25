<%--
  Created by IntelliJ IDEA.
  User: Dream
  Date: 2021/9/28
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <%--    ${pageContext.request.contextPath}绝对路径写法--%>
    <link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"  type="text/javascript"></script>
    <script src="https://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
    <script>
        $(function(){
            $('a[href*=#],area[href*=#]').click(function() {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                    var $target = $(this.hash);
                    $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
                    if ($target.length) {
                        var targetOffset = $target.offset().top;
                        $('html,body,.div1').animate({
                                scrollTop: targetOffset
                            },
                            1000);
                        return false;
                    }
                }
            });
        })
    </script>

    <style>
        .logo{float:left;width: 127px;height: 46px;left: 200px;position: absolute; background:url(${pageContext.request.contextPath}/images/index/blog.jpg) no-repeat;margin:38px 0px 0 0}
        .logo a{display:inline-block;width:415px;height:80px;}
        .search{left:500px; position: absolute}
        .idx02 dl dt{color:#0087cc;font-weight:bold;background:url(${pageContext.request.contextPath}/images/index/ico16.png) no-repeat left center;padding-left:25px;border-bottom:4px solid #0087cc;font-size:20px;line-height:45px}
    </style>
    <style>
        /*播放时的按钮不单独显示*/
        .dis{display:none}
        .mainContent{width:1000px;margin:0 auto;position:relative;z-index:1}
        /*背景浅蓝色底板*/
        .mainContent .contentBg{width:100%;float:left;background:#e6f4ff}
        /*图片放置在背景底板右侧*/
        .mainContent .contentBg .rightContent{width:786px;float:right;position:relative;padding:23px 8px 23px 0}
        /*显示图片元素*/
        .picContent{width:100%;height:auto}
        .picContent img{width:786px;height:460px;display:none}
        .picContent .showImg{display:block}
        /*控制台按钮*/
        .playDiv{width:100%;height:36px;background:#043567;line-height:36px}
        .playDiv .btnDiv{width:36px;height:36px;float:left;margin-right:5px}
        .playDiv .playBtn{margin-top:5px;margin-left:5px;height:25px;width:25px;background-position:-85px 0}
        .playDiv .stopBtn{margin-top:6px;margin-left:5px;height:25px;width:25px;background-position:-60px 0}
        .playDiv .infoDiv{height:36px;float:left;color:#fff;margin-right:10px;font-size:12px}
        /*三个长方形按钮*/
        .playDiv .playStaLi a{height:6px;float:left;margin-top:15px;_margin-top:8px;background:#5a82ab;cursor:pointer}
        /*鼠标移动到按钮上的时候为白色*/
        .playDiv .playStaLi a:hover{background:#fff}
        .playDiv .playStaLi .cur{background:#f29143!important}
        .playDiv .playStaLi02 a{margin-left:10px;width:40px}
        .playDiv .playStaLi03 a{margin-right:4px;width:36px}
        .playDiv .playStaLi24 a{margin-left:3px;width:21px}
        /*播放键*/
        .imgBtns{background-image:url(http://i.tq121.com.cn/i/product_2016/imgBtns.png);background-repeat:no-repeat}
    </style>
</head>
<body class="index">
<div class="top">
    <div class="w1200">

        <div class="left">
            <c:if test="${account==null}">
                微博，带你走近世界！
                <a href="${pageContext.request.contextPath}/login.jsp">[登录]</a>
                <a href="${pageContext.request.contextPath}/register.jsp">[注册]</a>
            </c:if>

            <c:if test="${account!=null}">
                您好${account.userName}，欢迎光临
                <a href="${pageContext.request.contextPath}/user/exit">[退出登录]</a
            </c:if>

        </div>
        <div class="right"><a href="${pageContext.request.contextPath}/center.jsp">个人中心</a>|<a href="#">收藏夹</a>|<a href="#">在线客服</a></div>
        <div class="clear"></div>

    </div>
    <div class="logo"><img src="${pageContext.request.contextPath}/images/index/blog.jpg"></div>

</div>

<div class="head">
    <div class="w1200">
<%--        <div class="logo"><img src="${pageContext.request.contextPath}/images/index/blog.jpg"></div>--%>
        <div class="search">
            <form action="#" class="form">
                <input type="text" value="输入查询微博的关键字" name="keyword" class="txt" onfocus="if(value=='输入商品关键字') {value=''}" onblur="if(value=='') {value='输入商品关键字'}"/>
                <input type="submit" value="搜索" class="sub"/>
            </form>
            <p><a href="#">坦克</a>|<a href="#">飞机</a>|<a href="#">特朗普</a>|<a href="#">普金</a>|<a href="#">真皮沙发</a>|<a href="#">月饼</a>|<a href="#">iPhone13</a>|<a href="#">棒球</a></p>
        </div>
        <div class="s_r">
            <dl>
                <dt>
                    <p onclick="">进入客服</p>
                </dt>
                <dd>客服电话：<b>400-0139-038</b></dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div class="menu">
    <div class="w1200">
        <div class="item" id="nav"><a href="#" class="nav">全部分类</a>
            <div class="nav_son">
                <ul>
                    <li class="li01"><a href="#">军事</a></li>
                    <li class="li02"><a href="#">美食</a></li>
                    <li class="li03"><a href="#">服装</a></li>
                    <li class="li04"><a href="#">外交</a></li>
                    <li class="li05"><a href="#">阴谋论</a></li>
                    <li class="li08"><a href="#">家居</a></li>
                    <li class="li10"><a href="#">其他</a></li>
                </ul>
            </div>
        </div>
        <div class="item"><a href="${pageContext.request.contextPath}/blog/list" class="home">微博首页</a></div>
        <div class="item"><a href="#">视频</a></div>
        <div class="item"><a href="#">发现</a></div>
        <div class="item"><a href="#">热门</a></div>
        <div class="item"><a href="#">最新资讯</a></div>
        <div class="item"><a href="#">情感</a></div>

    </div>
</div>

<%--<div class="banner">--%>

<%--    <div class="w_auto">--%>
<%--        <div class="clearfix"></div>--%>
<%--        <div id="num" class="point"></div>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="w1201">
    <a name="a02"></a>
    <div class="idx02">
        <div class="rollBox">
            <dl>
                <dt>热点新闻</dt>
            </dl>
        </div>
    </div>
</div>

<div style="min-height:400px">
    <!-- 主体部分 start -->
    <div class="mainContent">
        <div class="contentBg">
            <!-- 右边内容部分 start -->
            <div class="rightContent">
                <!-- 雷达图展示 start-->
                <div class="picContent">
                    <a href="#" target="_blank">
                        <img src="${pageContext.request.contextPath}/images/index/2.jpg" class="showImg" style="width:600px;height:301px;"></a>
                    <a href="#" target="_blank">
                        <img src="${pageContext.request.contextPath}/images/index/3.jpg" style="width:600px;height:301px;"></a>
                    <a href="#" target="_blank">
                        <img src="${pageContext.request.contextPath}/images/index/4.jpg" style="width:600px;height:301px;"></a>
                </div>
                <!-- 雷达图展示 end-->
                <!-- 控制台 begin-->
                <div class="playDiv">
                    <div class="btnDiv imgBtns playBtn" id="playBtn"></div>
                    <div class="btnDiv imgBtns stopBtn dis"></div>
                    <div class="playStaLi playStaLi03">
                        <!-- 控制台文字 -->
                        <!-- 控制台按钮 -->
                        <div id="btn_group" style="overflow:hidden">
                            <a class="cur" data-type="0"></a>
                            <a data-type="1"></a>
                            <a data-type="2"></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 右边内容部分 end -->
        </div>
    </div>
    <!--主体部分end-->
    <!--轮播-->
    <script type="text/javascript" src="js/index.js"></script>
</div>

<%--<div class="w1201">--%>
<%--    <a name="a02"></a>--%>
<%--    <div class="idx02">--%>
<%--        <div class="rollBox">--%>
<%--            <dl>--%>
<%--                <dt>午间资讯</dt>--%>
<%--            </dl>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div style="min-height:400px">--%>
<%--    <!-- 主体部分 start -->--%>
<%--    <div class="mainContent">--%>
<%--        <div class="contentBg">--%>
<%--            <!-- 右边内容部分 start -->--%>
<%--            <div class="rightContent">--%>
<%--                <!-- 雷达图展示 start-->--%>
<%--                <div class="picContent">--%>
<%--                    <a href="#" target="_blank">--%>
<%--                        <img src="${pageContext.request.contextPath}/2.jpg" class="showImg" style="width:600px;height:301px;"></a>--%>
<%--                    <a href="#" target="_blank">--%>
<%--                        <img src="${pageContext.request.contextPath}/3.jpg" style="width:600px;height:301px;"></a>--%>
<%--                    <a href="#" target="_blank">--%>
<%--                        <img src="${pageContext.request.contextPath}/4.jpg" style="width:600px;height:301px;"></a>--%>
<%--                </div>--%>
<%--                <!-- 雷达图展示 end-->--%>
<%--                <!-- 控制台 begin-->--%>
<%--                <div class="playDiv">--%>
<%--                    <div class="btnDiv imgBtns playBtn" id="playBtn"></div>--%>
<%--                    <div class="btnDiv imgBtns stopBtn dis"></div>--%>
<%--                    <div class="playStaLi playStaLi03">--%>
<%--                        <!-- 控制台文字 -->--%>
<%--                        <!-- 控制台按钮 -->--%>
<%--                        <div id="btn_group" style="overflow:hidden">--%>
<%--                            <a class="cur" data-type="0"></a>--%>
<%--                            <a data-type="1"></a>--%>
<%--                            <a data-type="2"></a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- 右边内容部分 end -->--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!--主体部分end-->--%>
<%--    <!--轮播-->--%>
<%--    <script type="text/javascript" src="js/index.js"></script>--%>
<%--</div>--%>

<%--<div class="w1201">--%>
<%--    <a name="a02"></a>--%>
<%--    <div class="idx02">--%>
<%--        <div class="rollBox">--%>
<%--            <dl>--%>
<%--                <dt>最多访问</dt>--%>
<%--            </dl>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div style="min-height:400px">--%>
<%--    <!-- 主体部分 start -->--%>
<%--    <div class="mainContent">--%>
<%--        <div class="contentBg">--%>
<%--            <!-- 右边内容部分 start -->--%>
<%--            <div class="rightContent">--%>
<%--                <!-- 雷达图展示 start-->--%>
<%--                <div class="picContent">--%>
<%--                    <a href="#" target="_blank">--%>
<%--                        <img src="${pageContext.request.contextPath}/2.jpg" class="showImg" style="width:600px;height:301px;"></a>--%>
<%--                    <a href="#" target="_blank">--%>
<%--                        <img src="${pageContext.request.contextPath}/3.jpg" style="width:600px;height:301px;"></a>--%>
<%--                    <a href="#" target="_blank">--%>
<%--                        <img src="${pageContext.request.contextPath}/4.jpg" style="width:600px;height:301px;"></a>--%>
<%--                </div>--%>
<%--                <!-- 雷达图展示 end-->--%>
<%--                <!-- 控制台 begin-->--%>
<%--                <div class="playDiv">--%>
<%--                    <div class="btnDiv imgBtns playBtn" id="playBtn"></div>--%>
<%--                    <div class="btnDiv imgBtns stopBtn dis"></div>--%>
<%--                    <div class="playStaLi playStaLi03">--%>
<%--                        <!-- 控制台文字 -->--%>
<%--                        <!-- 控制台按钮 -->--%>
<%--                        <div id="btn_group" style="overflow:hidden">--%>
<%--                            <a class="cur" data-type="0"></a>--%>
<%--                            <a data-type="1"></a>--%>
<%--                            <a data-type="2"></a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- 右边内容部分 end -->--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!--主体部分end-->--%>
<%--    <!--轮播-->--%>
<%--    <script type="text/javascript" src="js/index.js"></script>--%>
<%--</div>--%>

<!--footer-->
<div class="footer">
    <div class="w1200">
        <div class="bottom">
            <a href="#">关于我们</a>|<a href="#">帮助中心</a>|<a href="#">法律声明</a>|<a href="#">用户协议</a>|<a href="#">联系我们</a>|<a href="#">人才招聘</a>|<a href="#">站点地图</a>

            <p>网络文化经营许可证：粤网文[2015]0295-065号<br />© 2015 微博网络有限公司. 粤ICP备15042543号</p>
            <p class="p02"><img src="${pageContext.request.contextPath}/images/home/ico25.jpg"/><img src="${pageContext.request.contextPath}/images/home/ico26.jpg"/><img src="${pageContext.request.contextPath}/images/home/ico27.jpg"/><img src="${pageContext.request.contextPath}/images/home/ico36.jpg"/><img src="${pageContext.request.contextPath}/images/home/ico37.jpg"/></p>
        </div>
    </div>
</div>
<!--float_left-->
<div class="float2">
    <ul>
        <li><a href="#a01" class="a01 on">热点新闻</a></li>
        <li><a href="#a02" class="a02"></a></li>
        <li><a href="#a03" class="a03"></a></li>
        <li><a href="#a04" class="a04"></a></li>
        <li><a href="#a05" class="a05"></a></li>
        <li><a href="#a06" class="a06"></a></li>
    </ul>
</div>
<script language="javascript" type="text/javascript">
    $(function () {
        var dv = $(".idx01").offset().top;
        var dv2 = $(".idx02").offset().top;
        var dv3 = $("#idx03").offset().top;
        var dv4 = $("#idx04").offset().top;
        var dv5 = $("#idx05").offset().top;
        var dv6 = $("#idx06").offset().top;
        window.onscroll=function(){
            if(dv<document.body.scrollTop)
            {
                $(".float2 a").removeClass("on");
                $(".float2 .a01").addClass("on");

            }
            if(dv2<document.body.scrollTop)
            {
                $(".float2 a").removeClass("on");
                $(".float2 .a02").addClass("on");
            }
            if(dv3<document.body.scrollTop)
            {
                $(".float2 a").removeClass("on");
                $(".float2 .a03").addClass("on");
            }
            if(dv4<document.body.scrollTop)
            {
                $(".float2 a").removeClass("on");
                $(".float2 .a04").addClass("on");
            }
            if(dv5<document.body.scrollTop)
            {
                $(".float2 a").removeClass("on");
                $(".float2 .a05").addClass("on");
            }
            if(dv6<document.body.scrollTop)
            {
                $(".float2 a").removeClass("on");
                $(".float2 .a06").addClass("on");
            }
        }
    });
</script>
<script language="javascript" type="text/javascript">
    <!--//--><![CDATA[//><!--
    //图片滚动列表 mengjia 070816
    var Speed = 10; //速度(毫秒)
    var Space = 10; //每次移动(px)
    var PageWidth = 404; //翻页宽度
    var fill = 0; //整体移位
    var MoveLock = false;
    var MoveTimeObj;
    var Comp = 0;
    var AutoPlayObj = null;
    GetObj("List2").innerHTML = GetObj("List1").innerHTML;
    GetObj('ISL_Cont').scrollLeft = fill;
    GetObj("ISL_Cont").onmouseover = function(){clearInterval(AutoPlayObj);}
    GetObj("ISL_Cont").onmouseout = function(){AutoPlay();}
    AutoPlay();
    function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval

    ('document.all.'+objName)}}
    function AutoPlay(){ //自动滚动
        clearInterval(AutoPlayObj);
        AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();',5000); //间隔时间
    }
    function ISL_GoUp(){ //上翻开始
        if(MoveLock) return;
        clearInterval(AutoPlayObj);
        MoveLock = true;
        MoveTimeObj = setInterval('ISL_ScrUp();',Speed);
    }
    function ISL_StopUp(){ //上翻停止
        clearInterval(MoveTimeObj);
        if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0){
            Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
            CompScr();
        }else{
            MoveLock = false;
        }
        AutoPlay();
    }
    function ISL_ScrUp(){ //上翻动作
        if(GetObj('ISL_Cont').scrollLeft <= 0){GetObj('ISL_Cont').scrollLeft = GetObj

        ('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth}
        GetObj('ISL_Cont').scrollLeft -= Space ;
    }
    function ISL_GoDown(){ //下翻
        clearInterval(MoveTimeObj);
        if(MoveLock) return;
        clearInterval(AutoPlayObj);
        MoveLock = true;
        ISL_ScrDown();
        MoveTimeObj = setInterval('ISL_ScrDown()',Speed);
    }
    function ISL_StopDown(){ //下翻停止
        clearInterval(MoveTimeObj);
        if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0 ){
            Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth + fill;
            CompScr();
        }else{
            MoveLock = false;
        }
        AutoPlay();
    }
    function ISL_ScrDown(){ //下翻动作
        if(GetObj('ISL_Cont').scrollLeft >= GetObj('List1').scrollWidth){GetObj('ISL_Cont').scrollLeft =

            GetObj('ISL_Cont').scrollLeft - GetObj('List1').scrollWidth;}
        GetObj('ISL_Cont').scrollLeft += Space ;
    }
    function CompScr(){
        var num;
        if(Comp == 0){MoveLock = false;return;}
        if(Comp < 0){ //上翻
            if(Comp < -Space){
                Comp += Space;
                num = Space;
            }else{
                num = -Comp;
                Comp = 0;
            }
            GetObj('ISL_Cont').scrollLeft -= num;
            setTimeout('CompScr()',Speed);
        }else{ //下翻
            if(Comp > Space){
                Comp -= Space;
                num = Space;
            }else{
                num = Comp;
                Comp = 0;
            }
            GetObj('ISL_Cont').scrollLeft += num;
            setTimeout('CompScr()',Speed);
        }
    }
    //--><!]]>
</script>
<%--jQuery语句--%>
<script>
    $(".idx02 div:first").addClass("big");
    //onClick才会调用function
    function showDetail(id){
        location.href="${pageContext.request.contextPath}/goods/detail/"+id;
    }

    function goToCar(){
        location.href="${pageContext.request.contextPath}/car/list";
    }
</script>

</body>
</html>
