easy-asp-demo
=============

	帮同学写的一个简单的ASP程序，貌似是毕业设计？几年没写ASP，感觉写的一塌糊涂。
	简单的完成题目中的要求，没有去做数据的前后端过滤。
	可以优化的点很多，不过感觉作为普通的毕设题，应该足够了。

使用说明：
=========
    - 本地测试请运行NetBox2.exe，ORACLE VM VIRTUAL BOX + WINXP测试通过。
    - 服务器环境如禁止FSO，则请直接使用 [install.asp?mode=ignore] 进行安装。[注意:FSO禁用可能会使检查是否安装失效.]
    - 测试重新安装请删除 /database.mdb 数据库文件。

运行截图:
    /snap/*.png

开发流程：
=========
    - 设计数据库结构
    - 搭建测试服务器环境
    - 设计API接口以及编写ASP后端代码
    - 编写前端页面模版以及JS相关业务代码
    - 测试应用各种接口

数据库结构:
==========
    +---------------------------------------+
    |id     |    AUTOINCREMENT(1,1)         |
    |name   |    VARCHAR( 30 ) NOT NULL     |
    |email  |    VARCHAR( 50 ) NOT NULL     |
    |phone  |    VARCHAR( 15 ) NOT NULL     |
    +---------------------------------------+

实现代码详见ASP程序文件:
=======================
    /extra_lib.asp
    /main.asp