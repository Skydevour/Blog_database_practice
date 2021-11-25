<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>博客中国-发现世界之美</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="../static/css/me.css">
</head>
<body>

<!--导航-->
<nav class="ui inverted attached segment m-padded-tb-mini m-shadow-small" >
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">博客中国</h2>
            <div class="right m-item item m-mobile-hide">
                <div class="ui icon inverted transparent input m-margin-tb-tiny">
                    <form action="${pageContext.request.contextPath}/blog/search" name="searchName">
                        <input type="text" placeholder="快来搜搜吧" name="query">
                        <i class="search link icon" onclick="document.forms['searchName'].submit()"></i>
                    </form>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/blog/list" class="m-item item m-mobile-hide">返回上一级</a>
            <c:if test="${account==null}">
                <a href="${pageContext.request.contextPath}/login.jsp" class="m-item item m-mobile-hide">登录</a>
                <a href="${pageContext.request.contextPath}/register.jsp" class="m-item item m-mobile-hide">注册</a>
            </c:if>
            <c:if test="${account!=null}">
                <a class="m-item item m-mobile-hide" href="${pageContext.request.contextPath}/center.jsp">您好,${account.userName}</a>
                <a href="${pageContext.request.contextPath}/blog/myBlog" class="m-item item m-mobile-hide">我的微博</a>
                <a href="${pageContext.request.contextPath}/user/exit" class="m-item item m-mobile-hide">退出登录</a>
                <a href="${pageContext.request.contextPath}/addBlog.jsp" class="m-item item m-mobile-hide"><i class="edit icon"></i></a>
            </c:if>
        </div>
    </div>
</nav>
<br>
<!--中间内容-->
<div  class="m-container m-padded-tb-big animated fadeIn">
    <div class="ui container">
        <div class="ui stackable grid">
            <!--左边博客列表-->
            <div class="eleven wide column">
                <!--content-->
                <div class="ui attached  segment">
                    <c:forEach items="${myList}" var="my">
                        <div class="ui padded vertical segment m-padded-tb-large">
                            <div class="ui mobile reversed stackable grid">
                                <div class="five wide column">
                                    <a>
                                        <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg1.qunarzz.com%2Ftravel%2Fd3%2F1612%2F21%2Ff8b0de0c6f7270b5.jpg_r_720x480x95_4a6e447c.jpg&refer=http%3A%2F%2Fimg1.qunarzz.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636720294&t=845f1f9833056b810572291706ea2b7e/800/450" alt="" class="ui rounded image">
                                    </a>
                                </div>
                                <div class="eleven wide column">
                                    <h3 class="ui header" >
                                        <p class="m-black">
                                            <c:if test="${fn:length(my.content) >0}">
                                                <a href="${pageContext.request.contextPath}/blog/single/${my.vId}" class="item">
                                                        ${fn:substring(my.content, 0, 10)}...
                                                </a>
                                            </c:if>
                                        </p>
                                    </h3>
                                    <p class="m-text">
                                        <c:if test="${fn:length(my.content)>0 && fn:length(my.content)<=50}">
                                            ${fn:substring(my.content, 0, 50)}
                                        </c:if>
                                        <c:if test="${fn:length(my.content) >50}">
                                            ${fn:substring(my.content, 0, 50)}...
                                        </c:if>
                                    </p>
                                    <div class="ui grid">
                                        <div class="eleven wide column">
                                            <div class="ui mini horizontal link list">
                                                <div class="item">
                                                    <div class="content"><a href="#" class="header">${my.userName}</a></div>
                                                </div>
                                                <div class="item">
                                                    <i class="calendar icon"></i><fmt:formatDate value="${my.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ui grid">
                                            <h3 class="field  m-margin-bottom-small m-mobile-wide">
                                                <a onclick="deleteBlog(${my.vId})" class="header">删除</a>
                                            </h3>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>

<script>
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });
    function showSingleBlog(vId){
        location.href="${pageContext.request.contextPath}/blog/single/"+vId;
    }
    function findMyBlog(){
        location.href="${pageContext.request.contextPath}/blog/myBlog";
    }
    function deleteBlog(vId){
        $.ajax({
            url:"${pageContext.request.contextPath}/blog/delete/"+vId,
            success:function (data){
                if(data=="ok"){
                    alert("删除成功");
                    location.href="${pageContext.request.contextPath}/blog/myBlog";
                }
            },error:function (e){
                console.log(e)
            }
        })
    }
</script>
</body>
</html>
