<%Option Explicit%>
<!--#include file="json.asp"-->
<!--#include file="extra_lib.asp"-->
<%
Response.AddHeader "SOULTEARY","2013/05/8"
Response.Addheader "Content-Type", "application/x-javascript; charset=utf-8"
Dim DBCONN, DBPATH, DBSQL, SQL

DBPATH = Server.MapPath("./database.mdb")
DBSQL = "Data Source=" & DBPATH & ";Provider=Microsoft.Jet.OLEDB.4.0;"
Set DBCONN = Server.CreateObject("ADODB.Connection")
DBCONN.Open DBSQL

Dim action, id, user, email, phone
If Request.QueryString("action") <> "" Then
    action = Request.QueryString("action")

    Dim result
    Set result = jsObject()

    If action = "del" Then
        id = Request.QueryString("id")
        If id = "" Then
            result("code") = 400
            result("message") = "ACTION NEED ID."
        Else
            DelDB(id)
            result("code") = 200
            result("message") = "DEL DONE."
        End If
    ElseIf action = "add" Then
        user = Request.QueryString("user")
        email = Request.QueryString("email")
        phone = Request.QueryString("phone")

        If user = "" OR email = "" OR phone = "" Then
            result("code") = 400
            result("message") = "ONE OR MORE REQUEST PARAMS ERROR."
        Else
            InsertDB user, email, phone
            result("code") = 200
            result("message") = "ADD DONE."
        End If
    ElseIf action ="edit" Then
        id = Request.QueryString("id")
        user = Request.QueryString("user")
        email = Request.QueryString("email")
        phone = Request.QueryString("phone")
        If id = "" OR user = "" OR email = "" OR phone = "" Then
            result("code") = 400
            result("message") = "ONE OR MORE REQUEST PARAMS ERROR."
        Else
            UpdateDB id, user, email, phone
            result("code") = 200
            result("message") = "EDIT DONE."
        End If
    End If
    result.Flush

Else

    Dim keyword
    If Request.QueryString("keyword") <> "" Then
        keyword = Request.QueryString("keyword")
        If Not IsNumeric(keyword) Then
            If IsValidEmail(keyword) Then
                SQL = "SELECT * FROM contact WHERE email LIKE '%" & keyword & "%'"
            Else
                SQL = "SELECT * FROM contact WHERE name LIKE '%" & keyword & "%'"
            End If
        Else
            SQL = "SELECT * FROM contact WHERE phone LIKE '%" & keyword & "%'"
        End If
    Else
        SQL = "SELECT * FROM contact"
    End If

    QueryToJSON(DBCONN, SQL).Flush

End If

DBCONN.Close
%>