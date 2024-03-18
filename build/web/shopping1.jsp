<%-- 
    Document   : shopping1
    Created on : Feb 27, 2024, 2:33:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            .wrapper {
                padding: 0 15%;
                
            }
            .bill {
                margin-top: 100px;
                display: flex;
            }
            
            .bill > div{
                width: 50%;
            }
            
            .right-bill img,
            .right-bill h3{
                width: 80%;
            }
            .info input {
                width: 50%;
                height: 30px;
                font-size: 18px;
            }
            
            .buy {
                border: 0;
                border-radius: 4px;
                color: white;
                margin-top: 30px;
                height: 35px;
                width: 60px;
                background-color: orange;
            }
            
            .buy:hover {
                background-color: var(--green-color);
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <c:set var="p" value="${sessionScope.pid}"/>
            <c:set var="u" value="${sessionScope.success}"/>
            <form action="bill" method="post">
                <div class="bill">
                    <div class="right-bill">
                        <div>
                            <img src="${p.image}" alt="image"/>
                            <h3>${p.name}</h3>
                            <h3 style="color: orange;">Price: ${p.price}00 vnđ</h3>
                        </div>
                    </div>
                    <div class="left-bill">
                        <div class="info">
                            <h4>Name:</h4> 
                            <input type="text" value="<c:out value="${u.name}"/>" name="name" readonly>
                            <h4>Email:</h4> 
                            <input type="email" value="${u.email}" name="email" required>
                            <h4>Phone:</h4> 
                            <input type="number" value="${param.phone}" name="phone" required>
                            <h4>Address:</h4>
                            <input type="text" value="${param.address}" name="address" required>
                            <input type="hidden" name="Pquantity" value="${p.quantity}">
                            <input type="hidden" name="Pid" value="${p.id}">
                            <input type="hidden" name="username" value="${u.userName}">
                        </div>
                        <div>
                            <h4>Quantity:</h4> 
                            <button type="button" onclick="decrement()">-</button>
                            <input type="text" id="quantity" value="1" name="quantity" style="width: 30px;">
                            <button type="button" onclick="increment()">+</button> (còn : ${p.quantity})<br>
                            
                            <h3 style="color: red"><c:out value="${requestScope.quantityFail}"/></h3>
                            
                            <c:if test="${p.quantity > 0}">
                                <input type="submit" value="Buy" class="buy">
                            </c:if>
                            <c:if test="${p.quantity == 0}">
                                <h3 style="color: red">Hết hàng</h3>
                            </c:if>
                        </div>
                        
                    </div>
                    
                </div>
            </form>
        </div>



        <script>
            var quantity = 0;

            function increment() {
                quantity++;
                updateQuantity();
            }

            function decrement() {
                if (quantity > 0) {
                    quantity--;
                    updateQuantity();
                }
            }

            function updateQuantity() {
                document.getElementById('quantity').value = quantity;
            }
        </script>

    </body>
</html>
