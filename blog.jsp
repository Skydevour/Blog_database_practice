<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>这是你的微博哟</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
  <link rel="stylesheet" href="../static/css/typo.css">
  <link rel="stylesheet" href="../static/css/animate.css">
  <link rel="stylesheet" href="../static/lib/prism/prism.css">
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
<div id="waypoint" class="m-container-small m-padded-tb-big animated fadeIn">
  <div class="ui container">
    <div class="ui top attached segment">
      <div class="ui horizontal link list">
        <div class="item">
          <div class="content"><a href="${pageContext.request.contextPath}/loginvalidate" class="header">${blog.userName}</a></div>
        </div>
        <div class="item">
          <i class="calendar icon"></i><fmt:formatDate value="${blog.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </div>
      </div>
    </div>
    <!--内容-->
    <div class="ui  attached padded segment">
      <div id="content" class="typo  typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">
        <br>${blog.content}</br>
        <!--点赞-->
        <div class="ui center aligned basic segment">
          <!--点赞-->
          <div class="ui labeled button" tabindex="0">
            <div class="ui red button" onclick="doLike(${blog.vId})">
              <i class="heart icon"></i> 点赞
            </div>
            <a class="ui basic red left pointing label">
              ${blog.likes}
            </a>
          </div>
        </div>
      </div>

      <div id="comment-container" class="ui bottom attached segment">
        <!--留言区域列表-->
        <div class="ui teal segment">
          <div class="ui threaded comments">
              <div>
                  <h3 class="ui dividing header">评论<a href="${pageContext.request.contextPath}/blog/single/${blog.vId}">(^-^)</a></h3>
              </div>
            <div class="comment">
              <div class="content">
                <c:forEach items="${commentList}" var="comment">
                  <a class="author">${comment.userName}</a>
                  <div class="metadata">
                    <span class="date">
                      <fmt:formatDate value="${comment.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </span>
                  </div>
                  <div class="text">
                    ${comment.content}
                  </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
        <!--留言版-->
        <div class="ui form">
          <div class="field">
            <textarea name="content" id="content1" placeholder="请输入评论信息..."></textarea>
            <p></p>
            <div class="field  m-margin-bottom-small m-mobile-wide">
              <button class="ui teal button m-mobile-wide" onclick="addReply(${blog.vId})"><i class="edit icon"></i>发布</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>
<script src="../static/lib/prism/prism.js"></script>
<script>
    $('.menu.toggle').click(function () {
      $('.m-item').toggleClass('m-mobile-hide');
    });

    $('#payButton').popup({
      popup : $('.payQR.popup'),
      on : 'click',
      position: 'bottom center'
    });

    $('#toTop-button').click(function () {
      $(window).scrollTo(0,500);
    });

    function addReply(cId){
      var content=document.getElementById("content1").value;
      $.ajax({
        url:"${pageContext.request.contextPath}/blog/addReply/"+content+"/"+cId,
        success:function (data){
          if(data=="ok"){
            alert("评论发表成功");
            document.getElementById("content1").value="";
            location.href="${pageContext.request.contextPath}/blog/single/"+cId;
          }else{
            alert("请先登录");
          }
        },error:function (e){
          console.log(e)
        }
      })
    }
    function doLike(vId){
      $.ajax({
        url:"${pageContext.request.contextPath}/blog/like/"+vId,
        success:function (data){
          if(data=="ok"){
            alert("点赞成功");
            location.href="${pageContext.request.contextPath}/blog/single/"+vId;
          }else {
            alert("点赞失败");
          }
        },error:function (e){
          console.log(e)
        }
      })
    }
  </script>
</body>
</html>