<%-- 
    Document   : accountChange
    Created on : Feb 27, 2024, 8:36:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
                        :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }
            body {
                width: 30%;
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0 auto;
            }
            h1 {
                color: #333;
                text-align: center;
            }
            form {
                margin: 20px;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            input[type="text"],
            input[type="number"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 16px;
            }
            input[type="submit"] {
                background-color: var(--dark-green-color);
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: var(--green-color);
            }
        </style>
    </head>
    <body>
        <h1>Update Account</h1>
        <c:set var="a" value="${requestScope.accountChange}"/>
        <form action="profileAction" method="post">
            Name: <input type="text" name="name" value="${a.name}" readonly><br>
            Username: <input type="text" name="user" value="${a.userName}" readonly><br>
            Password: <input type="text" name="pass" value="${a.passWord}" required><br>
            Email: <input type="text" name="email" value="${a.email}" readonly><br>
            Role: <input type="number" name="role" value="${a.role}" required><br>
            
            <input type="submit" value="Save">
        </form>
    </body>
</html>
