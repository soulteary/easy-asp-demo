<%Option Explicit%>
<!--#include file="extra_lib.asp"-->
<%
Response.Addheader "Content-Type", "text/html; charset=utf-8"
Response.AddHeader "SOULTEARY", "2013/05/8"

Dim DBPATH, DBVERSION
DBVERSION = 2000 
DBPATH = Server.MapPath("./database.mdb")
Dim InstallReport

Function CreateDatabase(FilePath, Ver)

    Dim FileSystemObject, Mode
    If Request.QueryString("mode") = "ignore" Then
        Mode = False
    Else
        Set FileSystemObject = Server.CreateObject("Scripting.FileSystemObject")
        If FileSystemObject.FileExists(FilePath) = True Then
            Mode = True
        Else
            Mode = False
        End If
    End If
    If Mode = True Then
        InstallReport = False
    Else
        Dim CatalogObject, DBVer
        Select Case Ver
            Case 97
                DBVer = "3.51"
            Case 2000
                DBVer = "4.0"
        End Select

        If DBVer Then
            Set CatalogObject = Server.CreateObject("ADOX.Catalog")
            Call CatalogObject.Create("Provider=Microsoft.Jet.OLEDB." & DBVer & ";Data Source=" & FilePath)
        End If


        Dim DBCONN, DBSQL
        DBSQL = "Data Source=" & DBPATH & ";Provider=Microsoft.Jet.OLEDB.4.0;"
        Set DBCONN = Server.CreateObject("ADODB.Connection")
        DBCONN.Open DBSQL

        Dim CreateTable
        CreateTable = "CREATE TABLE contact("
        CreateTable = CreateTable & "id AUTOINCREMENT(1,1),"
        CreateTable = CreateTable & "name VARCHAR( 30 ) NOT NULL,"
        CreateTable = CreateTable & "email VARCHAR( 50 ) NOT NULL,"
        CreateTable = CreateTable & "phone VARCHAR( 15 ) NOT NULL"
        CreateTable = CreateTable & ")"
        DBCONN.execute(CreateTable)

        DBCONN.Close

            InsertDB "SOULTEARY", "soulteary@qq.com", "1310123456"
            InsertDB "customs1", "customs1@163.COM", "1320234567"
            InsertDB "customs2", "customs2@126.COM", "1330345678"
            InsertDB "customs3", "customs3@vip.COM", "1340013803"
            InsertDB "customs4", "customs4@netease.COM", "1350013804"
            InsertDB "customs5", "customs5@test.COM", "1360013806"
            InsertDB "customs6", "customs6@domain.COM", "1370013807"
            InsertDB "customs7", "customs7@a.COM", "1380013805"
            InsertDB "customs8", "customs8@b.COM", "1390013805"
            InsertDB "customs9", "customs9@cc.COM", "1880013805"
            InsertDB "customs110", "customs110@sina.COM", "1890013805"

        InstallReport = True

    End If
    Set FileSystemObject = Nothing
End Function 

Call CreateDatabase(DBPATH, DBVERSION)
%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>安装程序</title>
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
<body data-page="MAIN">

<div class="container-narrow">
<div class="masthead">
    <ul class="nav nav-pills pull-right">
        <li class="active"><a href="#CMD:INSTALL">安装</a></li>
        <li><a href="#CMD:HOME">首页</a></li>
        <li><a href="#CMD:ABOUT">关于</a></li>
    </ul>
    <h3 class="muted">客户管理系统</h3>
</div>
<hr>
<div class="row-fluid">
<%
If InstallReport = True Then
%>
  <div class="alert alert-info">
    <p>程序已经顺利安装完毕，示例数据也已经添加完毕。</p>
    <p><a href='#CMD:HOME' class='btn btn-mini'>开始使用</a>客户管理系统</p>
  </div>
<%
Else
%>
  <div class="alert alert-notice">
    <p>程序已经被安装过了。</p>
    <p><a href='#CMD:HOME' class='btn btn-mini'>返回首页</a></p>
  </div>
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