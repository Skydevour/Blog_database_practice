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
    <title>个人资料</title>
    <link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"  type="text/javascript"></script>

</head>
<body class="index">
<%--<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>--%>

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



<div class="w1200">
    <div class="position"><a href="index.jsp">首页</a> > <a href="#">个人中心</a> > <a href="#">个人资料</a></div>

    <div class="m_d">
        <div class="left">
            <dl><dt>个人中心</dt>
                <dd>
                    <a href="${pageContext.request.contextPath}/center.jsp" class="on">个人资料</a>
                    <a href="${pageContext.request.contextPath}/pwd.jsp">修改密码</a>
                    <a href="${pageContext.request.contextPath}/blog/single/${account.id}">评论查看</a>
                    <a href="${pageContext.request.contextPath}/about.jsp">我的收藏</a>
                    <a href="#">我的关注</a>
                    <a href="${pageContext.request.contextPath}/blog/single/${account.id}">我的点赞</a>
                    <a href="${pageContext.request.contextPath}/blog/single/${account.id}">我的粉丝</a>
                    <a href="${pageContext.request.contextPath}/blog/list">热点资讯</a>

                </dd>
            </dl>

        </div>
        <div class="right">
            <dl class="dl01">
                <dt><img src="${pageContext.request.contextPath}/images/ico04.jpg"/></dt>
                <dd>
                    <table width="725" border="0" cellpadding="0" cellspacing="0">
                        <c:if test="${account!=null}">
                        <tr>
                            <td width="416" class="td01">尊敬的，<font>${account.name}</font> 您好！<span>(普通会员)</span></td>
                            <td width="44">虚拟币：</td>
                            <td width="122"><span>${account.virtualBalance}元</span></td>
                            <td width="56" align="right">已提现：</td>
                            <td width="87"><span>${account.balance}元</span></td>
                        </tr>
                        </c:if>
                        <tr>
<%--                            <c:if test="${account==null}">--%>
<%--                                <img src="images/face.jpg" height="100" width="100"/>--%>
<%--                                <td>还没有上传头像？ 点击<a href="#">上传头像</a><a class="save" href="#">保存</a></td>--%>

<%--                            </c:if>--%>

<%--                            <c:if test="${account!=null}">--%>
<%--                        <td>更换头像？ 点击<a href="#">上传头像</a><a class="save" href="#">保存</a></td>--%>
                        <img src="${pageContext.request.contextPath}/images/center/${account.headPortrait}" height="100" width="100"/>

<%--                            </c:if>--%>
                        </tr>
                    </table>
                </dd>
            </dl>
            <dl class="dl02">
                <dt>
                    <span>个人资料</span>
                </dt>
                <dd>
                    <form action="${pageContext.request.contextPath}/user/save" method="post" enctype="multipart/form-data">
<%--                        <div class="item"><span><font>*</font>需要修改的账户为：</span><input type="tex" class="txt" name="userName"/></div>--%>
                        <div class="item"><span><font>*</font>用户身份证号码：</span><input type="tex" class="txt" name="identify"/></div>
                        <div class="item"><span><font>*</font>性别：</span><input type="tex" class="txt" name="sex"/></div>
                        <div class="item"><span><font>*</font>银行卡号：</span><input type="tex" class="txt" name="bankCard"/></div>
                        <div class="item"><span><font>*</font>电子邮箱：</span><input type="tex" class="txt" name="mail"/> <em>请输入邮箱地址，邮箱将用于找回密码。</em></div>
                        <div class="item"><span><font>*</font>联系地址：</span><input type="tex" class="txt" name="address"/></div>
                        <div class="item">
                            <input type="submit" class="sub" value="保存"/>
                        </div>
                    </form>
                </dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>

<!--footer-->
<div class="footer">

    <div class="f_nav">
        <div class="w1200">
            <dl>
                <dt>新手指南</dt>
                <dd>
                    <a href="#">注册新用户</a>
                    <a href="#">会员注册协议</a>
                </dd>
            </dl>
            <dl>
                <dt>付款方式</dt>
                <dd>
                    <a href="#">支付宝支付</a>
                    <a href="#">网上银行支付</a>
                </dd>
            </dl>
            <dl>
                <dt>常见问题</dt>
                <dd>
                    <a href="#">评论审核状态</a>
                    <a href="#">黑名单</a>
                </dd>
            </dl>
            <dl>
                <dt>客服中心</dt>
                <dd>
                    <a href="#">常见问题</a>
                    <a href="#">联系客服</a>
                    <a href="#">投诉与建议</a>
                </dd>
            </dl>
            <div class="ewm"><img src="${pageContext.request.contextPath}/images/home/ico35.png"/></div>
            <div class="ewm"><img src="${pageContext.request.contextPath}/images/home/ico38.png"/></div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="w1200">
        <div class="bottom">
            <a href="#">关于我们</a>|<a href="#">帮助中心</a>|<a href="#">法律声明</a>|<a href="#">用户协议</a>|<a href="#">联系我们</a>|<a href="#">人才招聘</a>|<a href="#">站点地图</a>

            <p>网络文化经营许可证：粤网文[2015]0295-065号<br />© 2015 深圳微博网络有限公司. 粤ICP备15042543号</p>
            <p class="p02"><img src="${pageContext.request.contextPath}/images/home/ico25.jpg"/><img src="${pageContext.request.contextPath}/images/home/ico26.jpg"/><img src="${pageContext.request.contextPath}/images/home/ico27.jpg"/><img src="${pageContext.request.contextPath}/images/home/ico36.jpg"/><img src="${pageContext.request.contextPath}/images/home/ico37.jpg"/></p>
        </div>
    </div>
</div>

</body>
</html>
