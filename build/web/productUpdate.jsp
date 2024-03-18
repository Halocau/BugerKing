<%-- 
    Document   : studentUpdate
    Created on : Jan 25, 2024, 10:38:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <h1>Update Product</h1>
        <c:set var="x" value="${sessionScope.productUpdate}"/>
        <c:set var="cid" value="${sessionScope.cid}"/>
        <form action="manageAction" method="post">
            Id: <input type="text" name="id" value="${x.id}"  readonly><br>
            Name: <input type="text" name="name" value="${x.name}" required><br>
            Quantity: <input type="number" name="quantity" value="${x.quantity}" required><br>
            Price: <input type="text" name="price" value="${x.price}" required><br>
            Describe: <input type="text" name="describe" value="${x.describe}" required><br>
            Image: <input type="text" name="image" value="${x.image}" required><br>
            
            Cid : <input type="text" name="cid" value="${cid}" readonly><br>
            <input type="submit" value="Update">
        </form>
    </body>
</html>
