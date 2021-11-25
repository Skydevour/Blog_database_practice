<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>快来分享吧</title>
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
      <a href="${pageContext.request.contextPath}/blog/list" class="m-item item m-mobile-hide">首页</a>
      <c:if test="${account==null}">
        <a href="${pageContext.request.contextPath}/login.jsp" class="m-item item m-mobile-hide">登录</a>
        <a href="${pageContext.request.contextPath}/register.jsp" class="m-item item m-mobile-hide">注册</a>
      </c:if>
      <c:if test="${account!=null}">
        <a class="m-item item m-mobile-hide" href="${pageContext.request.contextPath}/center.jsp">您好,${account.userName}</a>
        <a href="${pageContext.request.contextPath}/blog/myBlog" class="m-item item m-mobile-hide">我的微博</a>
        <a href="${pageContext.request.contextPath}/user/exit" class="m-item item m-mobile-hide">退出登录</a>
      </c:if>
    </div>
  </div>
</nav>
<br>

<!--中间内容-->
<div  class="m-container m-padded-tb-big animated fadeIn">
  <div class="ui container">
      <div class="ui form">
        <div class="field">
          <textarea name="content" id="content1" placeholder="快来发条微博吧..."></textarea>
          <p></p>
          <div class="field  m-margin-bottom-small m-mobile-wide">
            <button class="ui teal button m-mobile-wide" onclick="addBlog()"><i class="edit icon"></i>发布</button>
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
    $('#toTop-button').click(function () {
      $(window).scrollTo(0,500);
    });

    function addBlog(){
      var content=document.getElementById("content1").value;
      $.ajax({
        url:"${pageContext.request.contextPath}/blog/addBlog/"+content,
        success:function (data){
          if(data=="ok"){
            alert("发表成功");
            document.getElementById("content1").value="";
            location.href="${pageContext.request.contextPath}/blog/list"
          }else {
            alert("发表失败");
            location.href="${pageContext.request.contextPath}/blog/addBlog/"+content;
          }
        },error:function (e){
          console.log(e)
        }
      })
    }
  </script>
</body>
</html>