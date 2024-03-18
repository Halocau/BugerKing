<%-- 
    Document   : profileChange
    Created on : Feb 24, 2024, 9:20:34 PM
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



            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f4;
                margin: 0;
            }

            .wrapper {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            h2 {
                color: var(--dark-green-color);
                text-align: center;
            }



            input {
                margin-bottom: 15px;
                width: 100%;
                padding: 10px;
                font-size: 16px;
                box-sizing: border-box;
            }

            .choose {
                display: flex;
                justify-content: space-between;
            }

            .back,
            .submit input {
                color: white;
                border: 0;
                height: 35px;
                padding: 0 15px;
                border-radius: 4px;
                cursor: pointer;
            }

            .back {
                background-color:orange;
            }

            .submit input {
                background-color:orange;
            }

            .back:hover {
                background-color:orange;
            }

            .submit input:hover {
                background-color:orange;
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
            <form action="changeProfile" method="post">
                <c:if test="${profileNew!=null}">
                    <div class="profile">
                        <div>
                            Name: <input type="text" placeholder="Name *" name="name" value="${profileNew.name}" required />
                            Email: <input type="email" placeholder="Email *" name="email" value="${profileNew.email}" required />
                            Username: <input type="text" placeholder="Username *" name="user" value="${profileNew.userName}" readonly />
                            Password: <input type="password" placeholder="Password *" name="pass" value="${profileNew.passWord}" required />
                            Confirm Password: <input type="password" placeholder="Confirm Password *" name="confirmPass" required />
                            <div class="choose">
                                <div class="submit">
                                    <input type="submit" value="Save">
                                </div>
                                <div class="back">
                                    <a href="profile.jsp">Back</a>
                                </div>

                            </div>
                            <h4 style="color: red;"><c:out value="${requestScope.passwordNotMatch}"/></h4>
                        </div>

                    </div>
                </c:if>
                <c:if test="${profileNew==null}">
                    <div class="profile">
                        <div>
                            Name: <input type="text" placeholder="Name *" name="name" value="${profile.name}" required />
                            Email: <input type="email" placeholder="Email *" name="email" value="${profile.email}" required />
                            Username: <input type="text" placeholder="Username *" name="user" value="${profileNew.userName}" readonly />
                            Password: <input type="password" placeholder="Password *" name="pass" value="${profileNew.passWord}" required />
                            Confirm Password: <input type="password" placeholder="Confirm Password *" name="confirmPass" required />
                            <div class="choose">
                                <div class="submit">
                                    <input type="submit" value="Save">
                                </div>
                                <div class="back">
                                    <a href="profile.jsp">Back</a>
                                </div>

                            </div>
                            <h4 style="color: red;"><c:out value="${requestScope.passwordNotMatch}"/></h4>
                        </div>
                    </div>
                </c:if>
            </form>
        </div>
    </body>
</html>

