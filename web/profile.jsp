<%-- 
Document   : profile
Created on : Feb 24, 2024, 1:40:06 AM
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
                font-family: 'Arial', sans-serif; /* Change the font family */
                margin: 0;
                padding: 0;
                background-color: #f4f4f4; /* Set a light background color */
            }

            .wrapper {
                padding: 20px;
            }

            h2 {
                text-align: center;
                color: var(--dark-green-color);
            }

            .profile {
                margin-top: 30px;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap; /* Allow content to wrap on smaller screens */
            }

            .profile > div {
                width: 100%;
                box-sizing: border-box;
                padding: 15px;
            }

            .profile-img {
                text-align: center;
            }

            img {
                max-width: 100%; /* Ensure the image does not exceed its container */
                height: auto;
            }

            input {
                margin-bottom: 15px;
                width: 100%;
                padding: 10px;
                font-size: 16px;
                color: #333;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .choose {
                display: flex;
                justify-content: space-between;
            }

            .choose > div {
                flex: 1;
                margin: 0 5px;
                padding: 10px;
                background-color:orange;
                text-align: center;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .choose > div:hover {
                background-color: orange;
            }

            a {
                color: white;
                text-decoration: none;
            }

        </style>
    </head>
    <body>
        <c:set var="profile" value="${sessionScope.profile}"/>
        <c:set var="profileNew" value="${sessionScope.profileNew}"/>
        <div class="wrapper">
            <h2>PROFILE</h2>
            <c:if test="${profileNew!=null}">
                <div class="profile">
                    <div>
                        Name: <input type="text" value="${profileNew.name}" readonly>
                        Email: <input type="text" value="${profileNew.email}" readonly>
                        Username: <input type="text" value="${profileNew.userName}" readonly>
                        Password: <input type="password" value="${profileNew.passWord}" readonly>
                        <div class="choose">
                            <div>
                                <a href="home.jsp">home</a>
                            </div>
                            <div>
                                <a href="profileChange.jsp">Change Profile</a>
                            </div>
                        </div>
                    </div>

                </div>
            </c:if>
            <c:if test="${profileNew==null}">
                <div class="profile">
                    <div>
                        Name: <input type="text" value="${profile.name}" readonly>
                        Email: <input type="text" value="${profile.email}" readonly>
                        Username: <input type="text" value="${profile.userName}" readonly>
                        Password: <input type="password" value="${profile.passWord}" readonly>
                        <div class="choose">
                            <div>
                                <a href="home.jsp">home</a>
                            </div>
                            <div>
                                <a href="profileChange.jsp">Change Profile</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>


        </div>
    </body>
</html>
