<%Option Explicit%>
<!--#include file="extra_lib.asp"-->
<%
Response.Addheader "Content-Type", "text/html; charset=utf-8"
Response.AddHeader "SOULTEARY", "2013/05/8"

Dim HASINSTALL
HASINSTALL = CheckIsInstall()

If HASINSTALL = False Then
    Response.Redirect "./"
End If

%><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>控制面板</title>
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
          <li class="active"><a href="#CMD:HOME">首页</a></li>
          <li><a href="#CMD:ABOUT">关于</a></li>
      </ul>
      <h3 class="muted">客户管理系统</h3>
  </div>
  <hr>
  <div class="row-fluid">
    <div class="pull-left" id="action-box">
        <a href="#CMD:ADD" class="btn btn-primary">添加</a>
    </div>
    <div class="pull-right" id="search-box">
        <input type="text" id="search" class="input-medium search-query">
        <a href="#CMD:SEARCH" class="btn">查询</a>
    </div>
  </div>
  <div class="row-fluid">
    <table class="table table-bordered" id="main-table">
      <thead>
        <tr>
          <th>#</th>
          <th>客户名称</th>
          <th>客户邮箱</th>
          <th>客户电话</th>
          <th>操作方式</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan=5><p style="text-align:center;margin:0;">加载中...</p></td>
        </tr>
      </tbody>
    </table>
  </div>
  <hr>
  <div class="footer">
      <p>&copy; 亿玛亿客信息技术有限公司 2013</p>
  </div>
</div>
<!-- /container -->
<div id="add-box" class="modal hide fade">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h3>添加记录</h3>
  </div>
  <div class="modal-body">
    <div class="form-horizontal">
        <div class="control-group">
          <label class="control-label" for="add-username">客户名称</label>
          <div class="controls">
            <input type="text" id="add-username" placeholder="客户名称">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="add-useremail">客户邮箱</label>
          <div class="controls">
            <input type="text" id="add-useremail" placeholder="客户邮箱">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="add-userphone">客户电话</label>
          <div class="controls">
            <input type="text" id="add-userphone" placeholder="客户电话">
          </div>
        </div>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#CMD:CANCEL" class="btn" data-dismiss="modal" aria-hidden="true">取消</a>
    <a href="#CMD:DO-ADD" class="btn btn-primary">添加记录</a>
  </div>
</div>

<div id="edit-box" class="modal hide fade">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h3>修改记录</h3>
  </div>
  <div class="modal-body">
    <div class="form-horizontal">
        <div class="control-group">
          <label class="control-label" for="edit-username">客户名称</label>
          <div class="controls">
            <input type="text" id="edit-username" placeholder="客户名称">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="edit-useremail">客户邮箱</label>
          <div class="controls">
            <input type="text" id="edit-useremail" placeholder="客户邮箱">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="edit-userphone">客户电话</label>
          <div class="controls">
            <input type="text" id="edit-userphone" placeholder="客户电话">
          </div>
        </div>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#CMD:CANCEL" class="btn" data-dismiss="modal" aria-hidden="true">取消</a>
    <a href="#CMD:DO-EDIT" class="btn btn-primary">修改记录</a>
  </div>
</div>

</body>
</html>