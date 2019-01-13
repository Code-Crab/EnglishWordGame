<%--
  Created by IntelliJ IDEA.
  User: dormirr
  Date: 19-1-11
  Time: 上午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>英语单词游戏</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="rankassets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="rankassets/css/noscript.css"/>
    </noscript>
</head>

<body class="is-preload">
<div id="wrapper">
    <div id="bg"></div>
    <div id="overlay"></div>
    <div id="main">

        <!-- Header -->
        <header id="header">
            <h1>游戏积分排名</h1>
            <p>欢迎您 &nbsp;&bull;&nbsp; ${user.name }&nbsp;本次难度为${Difficulty }</p>
            <p>
                <a href="playServlet?type=oneMoreGame&&id=${user.id }">再来一局</a>&emsp;
                <a href="wordServlet?type=selectAll&&id=${user.id }">查看单词库</a>&emsp;
                <a href="userServlet?type=my&&id=${user.id }">查看个人游戏记录</a>
            </p>
            <p><a href=" userServlet?type=selectById&&id=${user.id }"><span class="label">修改密码</span></a></p>
            <table width="100%">
                <thead>
                <tr align="center">
                    <th>用户账号</th>
                    <th>游戏积分</th>
                    <th>积分排名</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="item">
                    <tr align="center">
                        <td>${item.name }</td>
                        <c:if test="${Difficulty == '简单'}">
                            <td>${item.simpleScore }</td>
                        </c:if>
                        <c:if test="${Difficulty == '中等'}">
                            <td>${item.mediumScore }</td>
                        </c:if>
                        <c:if test="${Difficulty == '困难'}">
                            <td>${item.hardScore }</td>
                        </c:if>
                        <c:if test="${Difficulty == '随机'}">
                            <td>${item.random }</td>
                        </c:if>
                        <td>${item.ranking }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </header>

        <!-- Footer -->
        <footer id="footer">
            <c:if test="${pageNos > 1 }">
                <a href="wordServlet?type=selectAll&&id=${user.id }&&pageNos=1">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="wordServlet?type=selectAll&&id=${user.id }&&pageNos=${pageNos-1 }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </c:if>
            <c:if test="${pageNos < countPage }">
                <a href="wordServlet?type=selectAll&&id=${user.id }&&pageNos=${pageNos+1 }">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="wordServlet?type=selectAll&&id=${user.id }&&pageNos=${countPage }">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </c:if>
            共${countPage }页
        </footer>

    </div>
</div>
<script>
    window.onload = function () {
        document.body.classList.remove('is-preload');
    }
    window.ontouchmove = function () {
        return false;
    }
    window.onorientationchange = function () {
        document.body.scrollTop = 0;
    }
</script>
</body>

</html>