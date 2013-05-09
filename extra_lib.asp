<%
Function CheckIsInstall()
    Dim objFSO
    Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
    If objFSO.FileExists(Server.MapPath("./database.mdb")) Then
        CheckIsInstall = True
    Else
        CheckIsInstall = False
    End If
End Function


Function InsertDB(name, email, phone)
    Dim DBCONN, DBSQL
    DBSQL = "Data Source=" & DBPATH & ";Provider=Microsoft.Jet.OLEDB.4.0;"
    Set DBCONN = Server.CreateObject("ADODB.Connection")
    DBCONN.Open DBSQL
    Dim RS, SQL
    Set RS = Server.CreateObject("ADODB.Recordset")
    SQL = "INSERT INTO contact (name, email, phone) VALUES ('" & Server.UrlEncode(name) & "', '" & Server.UrlEncode(email) & "', '" &  Server.UrlEncode(phone)& "')"
    DBCONN.execute(SQL)
    DBCONN.Close
End Function

Function DelDB(id)
    Dim DBCONN, DBSQL
    DBSQL = "Data Source=" & DBPATH & ";Provider=Microsoft.Jet.OLEDB.4.0;"
    Set DBCONN = Server.CreateObject("ADODB.Connection")
    DBCONN.Open DBSQL
    Dim RS, SQL
    Set RS = Server.CreateObject("ADODB.Recordset")
    SQL = "DELETE FROM contact WHERE id = " & id
    DBCONN.execute(SQL)
    DBCONN.Close
End Function

Function UpdateDB(id, name, email, phone)
    Dim DBCONN, DBSQL
    DBSQL = "Data Source=" & DBPATH & ";Provider=Microsoft.Jet.OLEDB.4.0;"
    Set DBCONN = Server.CreateObject("ADODB.Connection")
    DBCONN.Open DBSQL
    Dim RS, SQL
    Set RS = Server.CreateObject("ADODB.Recordset")
    SQL = "UPDATE contact SET name = '" & Server.UrlEncode(name) & "', email = '" & Server.UrlEncode(email) & "', phone = '" &  Server.UrlEncode(phone)& "' WHERE id=" & id
    DBCONN.execute(SQL)
    DBCONN.Close
End Function

Function IsValidEmail(email)
    Dim Rep
    Set Rep = new RegExp
    Rep.pattern="^([\.a-zA-Z0-9_-]){2,10}@([a-zA-Z0-9_-]){2,10}(\.([a-zA-Z0-9]){2,}){1,4}$"
    If Not Rep.Test(email) Then
        Set Rep= Nothing
        IsValidEmail=False
    Else
        Set Rep= Nothing
        IsValidEmail=True
    End If
End function


Function QueryToJSON(dbc, sql)
        Dim rs, jsa, col
        Set rs = dbc.Execute(sql)
        Set jsa = jsArray()
        While Not (rs.EOF Or rs.BOF)
                Set jsa(Null) = jsObject()
                For Each col In rs.Fields
                        jsa(Null)(col.Name) = col.Value
                Next
        rs.MoveNext
        Wend
        Set QueryToJSON = jsa
End Function
%>