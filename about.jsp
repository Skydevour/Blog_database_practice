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
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
    <meta http-equiv="expires" content="0">
    <link href="css/style.css" type="text/css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"  type="text/javascript"></script>
    <meta charset="UTF-8">
    <title>我的故事</title>
    <link rel="shortcut icon" th:href="@{/images/favicon.ico}" th:src="@{/images/favicon.ico}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="../static/css/me.css" th:href="@{/css/me.css}">
    <link rel="stylesheet" href="../static/css/animate.css" th:href="@{/css/animate.css}">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="jquery.mCustomScrollbar.concat.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;

        }
        body {
            background-color: rgba(241,243,244,.7);
        }
        li {
            list-style: none;
        }
        .hide {
            display: block;
        }
        .m-text {
            /*大小*/
            font-size: 16px;
            /*字间距*/
            letter-spacing: 1px !important;
            /*行间距*/
            line-height: 1.8;

            font-family: 楷体;
        }



        .my-content {
            width: 90%;
            margin: 30px auto;

        }

        .my-container {
            width: 90%;

            margin: 0 auto;
            overflow: hidden;
        }

        .my-container .my-content_left {
            float: left;
            width: 35%;
            height: 100%;
        }
        .my-content_left .saying {
            width: 90%;
            position: relative;
            /*height: 100px;*/
            padding: 15px;
            background: url("./images/greek-vase.png") no-repeat 0 0;
            margin: 20px auto;
            border-radius: 5px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);

        }

        .my-content_left .my_saying {
            background: url("./images/geometric-leaves.png") no-repeat 0 0;
        }
        .my-content_left .saying .author {
            position: absolute;
            right: 10px;
            bottom: 10px;
        }
        .my-container .my-content_right {
            float: right;
            margin-top: 20px;
            width: 60%;

            text-align: center;
        }
        .my-content_right .main_info p{
            text-indent: 2em;
            margin: 20px auto;
        }
        .my-content_right .hobby ul{
            border-left: 4px #00B5AD solid;
            text-align: left!important;

        }
        .my-content_right .hobby p {
            text-indent: 0 !important;
            margin-left: 20px;
        }
        .my-content_right .skill ul{
            border-left: 4px #00B5AD solid;
            text-align: left!important;
        }
        .my-content_right .skill p {
            text-indent: 0 !important;
            margin-left: 20px;
        }
        .my-container .my-content_right p {
            font-size: 16px;
            font-weight: 300;
            line-height: 1.8;
            text-align: justify;
            text-indent: 2em;
        }

        .my-container .my-content_right img {
            width: 300px;
            height: 250px;
            border-radius: 5px;

        }
        .mood_my-container p {

            margin-left: 20px;
            font-family: 楷体;
            font-size: 18px;

        }
        ._mCS_1 .mCSB_scrollTools .mCSB_dragger_bar{
            width:11px;
        }
    </style>
    <script>
        $(function () {
            $("body").mCustomScrollbar();

        })
    </script>

    <style>


        #gradient-style
        {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 12px;
            margin: 45px;
            width: 480px;
            text-align: left;
            border-collapse: collapse;
        }
        #gradient-style th
        {
            font-size: 13px;
            font-weight: normal;
            padding: 8px;
            background: #b9c9fe url('/images/login/bg.jpg') repeat-x;
            border-top: 2px solid #d3ddff;
            border-bottom: 1px solid #fff;
            color: #039;
        }
        #gradient-style td
        {
            padding: 8px;
            border-bottom: 1px solid #fff;
            color: #669;
            border-top: 1px solid #fff;
            background: #e8edff url('/images/login/bg.jpg') repeat-x;
        }
        #gradient-style tfoot tr td
        {
            background: #e8edff;
            font-size: 12px;
            color: #99c;
        }
        #gradient-style tbody tr:hover td
        {
            background: #d0dafd url('/images/login/bg.jpg') repeat-x;
            color: #339;
        }

    </style>

    <style>
        .index
        {
            background-image: url("${pageContext.request.contextPath}/images/center/4.jpg");
            background-size: cover;
        }
    </style>
</head>

<body class="index">
<%--<body data-mcs-theme="minimal-dark">--%>

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
</div>

<nav th:replace="fragment :: menu(5)"></nav>
<div class="my-content ">
    <div class="my-container">
        <div class="my-content_left  animated slideInLeft">
            <div class="saying my_saying" style="text-align: center;">
                <p> 恰到好处的喜欢最舒服</p>
                <p>  你不用多好</p>
                <p> 我喜欢就好</p>
                <p>  我没有很好</p>
                <p>   你不嫌弃就好</p>
                <div class="author">---LHZ</div>
            </div>
            <div class="saying m-text" >
                <p>有什么就害怕失去它。一无所有，又担心会永远一无所有。每个人都一样</p>
                <div class="author">---村上春树</div>
            </div>
            <div class="saying m-text">
                <p>于千万人之中遇见你所要遇见的人，于千万年之中，时间的无涯的荒野里，没有早一步，也没有晚一步，刚巧赶上了，那也没有别的话可说，惟有轻轻地问一声：“噢，你也在这里吗？”</p>
                <div class="author">---张爱玲</div>
            </div>


            <div class="saying m-text">
                <p>你问我爱你值不值得，其实你应该知道，爱就是不问值得不值得</p>
                <div class="author">---张爱玲</div>
            </div>
            <div class="saying m-text">
                <p>也许每一个男子全都有过这样的两个女人，至少两个。 娶了红玫瑰，久而久之，红的变了墙上的一抹蚊子血，白的还是“床前明月光”； 娶了白玫瑰，白的便是衣服上的一粒饭粘子，红的却是心口上的一颗朱砂痣</p>
                <div class="author">---张爱玲</div>
            </div>
        </div>
        <div class="my-content_right  animated slideInRight ">
            <c:if test="${account==null}">
                <img src="images/face.jpg" height="200" width="200"/>
            </c:if>

            <c:if test="${account!=null}">
                <c:if test="${account.headPortrait==null}">
                    <img src="images/face.jpg" height="200" width="200"/>
                </c:if>

                <c:if test="${account.headPortrait!=null}">
                    <img src="images/center/${account.headPortrait}" alt="关于我" width="200" height="200">
                </c:if>
            </c:if>
            <div class="main_info">
                <p> 小杨，广东人，伪90后，一个不务“正业”的物联网专业学生，大三在读，喜欢Java，主攻后端，前端也略懂复制粘贴的精髓，网页审美水平有限！！！</p>

            </div>

            <div class="hobby">
                <h3 style="font-weight: 400">爱好</h3>
                <ul>
                    <li><p>喜欢听歌，玩吉他</p></li>
                    <li><p>看电影&电视剧（中日韩美英都可）</p></li>
                    <li><p>喜欢漫威</p></li>
                    <li><p>动漫（新海诚，宫崎骏）等等...</p></li>
                    <li><p>爱编程</p></li>
                </ul>
            </div>

            <div class="skill">
                <h3 style="font-weight: 400">技术栈</h3>
                <ul>
                    <li><p>后端：SSM+Springboot</p></li>
                    <li><p>前端：Html+Css+Js+Jquery</p></li>
                    <li><p>数据库：Mysql、redis</p></li>
                    <li><p>其他：Linux基础语法</p></li>
                </ul>
            </div>
            <a href="${pageContext.request.contextPath}/center.jsp">返回上一级</a>

            </div>


        </div>

    </div>
</div>
<br/>
<br/>
<br/>
<br/>
<footer th:replace="fragment :: footer"></footer>
</body>
</html>
