<%-- 
    Document   : changepasswordform
    Created on : 27-set-2016, 15.36.43
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Reimposta la password da qui</h2>
        <form action="ChangePasswordQuery" method="POST" >
            <table>
                <tr>
                    <td>Password:</td>
                    <td><input required type="password" name="password" maxlength="255" pattern= "(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" ></td>
                </tr>
                <td>
                    <input type="submit" value="Reimposta"></td>
                </tr>
            </table>

            <input type="text" name="id" value='<%=request.getAttribute("id")%>' hidden>
        </form>
    </body>
</html>
