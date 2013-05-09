<%Option Explicit%>
<!--#include file="extra_lib.asp"-->
<%
Response.Addheader "Content-Type", "text/html; charset=utf-8"
Response.AddHeader "SOULTEARY", "2013/05/8"

Dim HASINSTALL
HASINSTALL = CheckIsInstall()


%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="soulteary">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="./js/jquery-1.9.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/app.js"></script>
    <!--[if lt IE 9]><script src="./js/html5shiv.js"></script><![endif]-->
</head>
<body>

<div class="container-narrow">
    <div class="masthead">
        <ul class="nav nav-pills pull-right">
        <%
            If HASINSTALL = False Then
        %>
        <li><a href="#CMD:INSTALL">安装</a></li>
        <%
            End If
        %>
            <li class="active"><a href="#CMD:HOME">首页</a></li>

            <li><a href="#CMD:ABOUT">关于</a></li>
        </ul>
        <h3 class="muted">客户管理系统</h3>
    </div>
    <hr>
    <div class="jumbotron">
        <h1>欢迎使用亿玛亿客客户管理系统!</h1>
        <p class="lead">系统支持对客户进行资料管理和查找，有任何意见以及建议欢迎联系管理员。</p>
        <%
            If HASINSTALL Then
        %>
        <a class="btn btn-large btn-success" href="#CMD:BEGIN">开始使用</a>
        <%
            Else
        %>
        <a class="btn btn-large btn-primary" href="#CMD:INSTALL">安装程序</a>
        <%
            End If
        %>
    </div>
    <hr>
    <div class="footer">
        <p>&copy; 亿玛亿客信息技术有限公司 2013</p>
    </div>

</div>
<!-- /container -->
</body>
</html>