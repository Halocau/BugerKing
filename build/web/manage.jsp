<%-- 
    Document   : manage
    Created on : Feb 23, 2024, 1:40:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
            #wrapper{
                font-family: arial;
                margin-left: 30px;
                width: 90%;
            }
            .clr {
                clear: both;
            }
            #menu_tab {
                width: 100%;
                display: flex;
                justify-content: space-around
            }
            ul.menu{
                float: left;
                background-color: orange;
                display: block;
                list-style-type: none;
                font-weight: bold;
                height: 30px;
                padding: 12px;
                width: 100%;
            }
            ul.menu li {
                display: inline;
                font-size: 14px;
                padding-top: 15px;
                text-align: center;
                line-height: 30px;
                color: white;
            }
            ul.menu li a {
                margin: 10px;
                padding-left: 0px;
                text-decoration: none;
                text-align: center;
                color: #E2D9BC;
                position: relative;
            }
            ul.menu li a img {
                float: left;
                margin-left: 10px;
            }
            ul.menu li a:hover {
                color: #F90;
            }
            ul.menu li a:active {
                color:#FF0;
            }
            ul.meny li a:focus {
                color: #96F;
            }
            #content{
                margin-left: 20px;
            }
            table{
                width: 100%;
                border-collapse: collapse;
                table-layout: fixed;
            }
            td{
                text-align: center;
            }
            a {
                text-decoration: none;
                color: var(--green-color);
                font-weight: bold;
            }
            .add {
                background-color: orange;
                color: white;
                margin: 10px;
                height: 40px;
            }

            .add:hover {
                background-color: var(--green-color);
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <div id="menu_tab">
                <ul class="menu">
                    <li><a href="home">Home</a></li>
                    <!--home-->
                    <c:forEach var="c" items="${sessionScope.data}">
                        <li><a href="manage?cid=${c.id}">${c.name}</a></li>
                        </c:forEach>
                </ul>
            </div>
            <div class="clr"></div>
            <div id="content">
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Describe</th>
                        <th>Category Name</th>
                        <th colspan="2">Action</th>
                    </tr>

                    <c:set var="cid" value="${null}"/>
                    <!--Products-->
                    <c:forEach items="${requestScope.products}" var="p">
                        <c:set var="cid" value="${p.category.id}"/>
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.name}</td>
                            <td><img src="${p.image}" alt="${p.image}" width="80px" height="80px"/></td>
                            <td>${p.quantity}</td>
                            <td>${p.price}00₫</td>
                            <td>${p.describe}</td>
                            <td>${p.category.name}</td>
                            <td><a href="manageAction?action=edit&id=${p.id}&cid=${p.category.id}">Edit</a></td>
                            <td><a href="manageAction?action=delete&id=${p.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                    <c:if test="${cid!=null}">
                        <form action="checkAdd" method="post">
                            <input type="hidden" name="cid" value="${cid}">
                            <input type="submit" value="+ Thêm sản phẩm" class="add">
                        </form>
                    </c:if>

                </table>
            </div>
            <div>
                <h2>Danh Sách Tài Khoản Đăng Ký</h2>
                <div id="content">
                    <table border="1">
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>role</th>
                            <th colspan="2">Action</th>
                        </tr>

                        <!--home-->
                        <c:forEach items="${sessionScope.account}" var="a">
                            <tr>
                                <td>${a.name}</td>
                                <td>${a.userName}</td>
                                <td>${a.passWord}</td>
                                <td>${a.email}</td>
                                <td>${a.role}</td>
                                <td><a href="profileAction?action=edit&user=${a.userName}">Edit</a></td>
                                <td><a href="profileAction?action=delete&user=${a.userName}">Delete</a></td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>
            <div>
                <h2>Danh Sách Bill</h2>
                <div id="content">
                    <table border="1">
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Quantity</th>
                            <th>Money</th>
                            <th>Name Product</th>
                            <th>Action</th>
                        </tr>

                        <!--home-->
                        <c:forEach items="${sessionScope.bill}" var="b">  
                            <tr>
                                <td>${b.name}</td>
                                <td>${b.username}</td>
                                <td>${b.phone}</td>
                                <td>${b.email}</td>
                                <td>${b.address}</td>
                                <td>${b.quantity}</td>
                                <td>${b.sumprice}00₫</td>
                                <td>${b.product.name}</td>
                                <td><a href="checkBill?user=${b.username}&pid=${b.product.id}&quantity=${b.quantity}&sumprice=${b.sumprice}00">Accept</a></td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
                <c:set var="money" value="${sessionScope.money}"/>
                <h3 style="color: red;">
                    Tiền thu được: + <c:out value="${money}00VNĐ"/>
                </h3>
            </div>
        </div>
    </body>
</html>
