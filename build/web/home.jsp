<%-- 
    Document   : home
    Created on : Feb 18, 2024, 11:11:29 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BurgerKing</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            .wrapper {
                width: 100%;
                min-width: 1200px;
            }

            :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }

            .header {
                display: flex;
                box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.2);
                background: orange;
            }

            .header>div {
                width: 25%;
            }

            .header>nav {
                width: 50%;
                height: 10vh;
            }

            .logo {
                align-items: end;
            }

            .logo img {
                width: 169px;
                height: 100px;
                float: right;
            }

            .nav ul {
                width: 100%;
                display: flex;
                justify-content: center;
                list-style: none;
                padding: 0;
                padding-top: 8%;
            }


            .nav ul li {
                line-height: 22px;
                font-size: 22px;
                margin: 0 10px;
                font-weight: bold;
            }

            .nav a {
                text-decoration: none;
                color: white;
            }

            .nav li :hover {
                color: grey;
            }

            .header-right ul {
                list-style: none;
                display: flex;
                align-items: center;
                padding-top: 16%;
            }

            .header-right li {
                margin: 0 10px;
            }

            .header-right li :hover {
                color: var(--dark-green-color);
            }

            .header-right i {
                color: white;
            }

            .name {
                font-weight: bold;
                color: var(--green-color);
                text-decoration: none;
            }

            .main {
                margin-top: 30px;
            }

            .banner {
                text-align: center;
            }

            .introduction {
                padding: 50px 20%;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                width: 100%;
            }



            .contact{
                margin: 30px 0 20px;
                padding: 0 15%;
            }

            .contact input {
                line-height: 40px;
            }

            .contact input ,
            .contact textarea{
                width: 100%;
                margin-bottom: 30px;
                font-size: 18px;
                font-weight: 500;
                padding-left: 10px;
            }

            .contact label {
                font-weight: bold;
                font-size: 20px;
            }

            .send button{
                width: 100px;
                height: 40px;
                text-align: center;
                border: 1px solid black;
                border-radius: 4px;
                background-color: orange;
                color: white;
                font-weight: 700;
            }

            .send button:hover {
                background-color: var(--green-color);
            }

            .divided {
                padding: 100px 15%;
                text-align: center;
                height: auto;
                font-size: 18px;
                font-weight: 600;
                line-height: 30px;
                color: gray;
            }

            .divided img,
            .divided h3 {
                color: black;
                margin-bottom: 20px;
            }

            .divided div:nth-child(2) {
                border-left: 1px solid rgb(192, 192, 192);
                border-right: 1px solid rgb(192, 192, 192);
            }

            .footer {
                background-color: gray;
                color: white;
                height: auto;
                font-size: 18px;
                line-height: 70px;
                font-weight: 500;
            }

            .row{
                padding-top: 5%;
                margin: 0;
            }

            .second-footer a{
                text-decoration: none;
                color: white;
            }

            .second-footer p :hover{
                color: rgb(240, 241, 243);
            }

            .third-footer iframe {
                width: 200px;
                height: 300px;
            }

            .store{
                padding-top: 0;
                padding-left:15%;
                padding-right: calc(15% - 20px);
                margin: 50px 0;
            }

            .menu {
                padding: 0;
                list-style: none;
                font-size: 20px;
            }

            .menu a {
                text-decoration: none;
                color: black;
            }

            .menu a:hover {
                color: gray;
            }

            .right-store {
                display: flex;
                text-align: center;
                flex-wrap: wrap;
            }

            .right-store > div {
                margin: 20px;
                width: calc(33.33% - 40px);
                height: 450px;
            }

            .product img {
                width: 100%;
                height: auto;
                border: 1px solid #ccc;
            }

            .actions {
                width: 100%;
                display: flex;
                justify-content: space-evenly;

            }

            .action {
                display: flex;
                width: 80px;
                height: 40px;
                border: 1px solid black;
                background-color: orange;
                align-items: center;
            }
            .action:hover{
                background-color: orange;
            }
            .action a{
                margin: 0 auto;
                text-decoration: none;
                color: white;
            }

            .productById {
                margin: 30px 0;
                padding: 0 15%;
            }

            .productInfo {
                display: flex;
                justify-content: center;
                margin-bottom: 50px;
            }

            .productInfo > div {
                width: 50%;
            }

            .productInfo img {
                width: 90%;
            }

            .productByCid{
                display: flex;
                flex-wrap: wrap;
            }

            .productByCid > div {
                width: calc(33.33% - 40px);
                margin: 20px;
            }

            .selling {
                margin: 30px 0;
                padding: 0 15%;
            }

            .hot-selling-title p {
                font-size: 36px;
                font-weight: bold;
                color: black;
                text-align: center;
            }

            .hot-selling {
                display: flex;
                text-align: center;
                flex-wrap: wrap;
            }

            .hot-selling > div {
                width: calc(33.33% - 40px);
                margin: 20px;
            }
            * {
                box-sizing: border-box
            }
            body {
                font-family: Verdana, sans-serif;
                margin:0
            }
            .mySlides {
                display: none
            }
            img {
                vertical-align: middle;
            }

            /* Slideshow container */
            .slideshow-container {
                max-width: 1000px;
                position: relative;
                margin: auto;
            }

            /* Next & previous buttons */
            .prev, .next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                padding: 16px;
                margin-top: -22px;
                color: white;
                font-weight: bold;
                font-size: 18px;
                transition: 0.6s ease;
                border-radius: 0 3px 3px 0;
                user-select: none;
            }

            /* Position the "next button" to the right */
            .next {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
                background-color: rgba(0,0,0,0.8);
            }

            /* Caption text */
            .text {
                color: #f2f2f2;
                font-size: 15px;
                padding: 8px 12px;
                position: absolute;
                bottom: 8px;
                width: 100%;
                text-align: center;
            }

            /* Number text (1/3 etc) */
            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            /* The dots/bullets/indicators */
            .dot {
                cursor: pointer;
                height: 15px;
                width: 15px;
                margin: 0 2px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
            }

            .active, .dot:hover {
                background-color: #717171;
            }

            /* Fading animation */
            .fade {
                animation-name: fade;
                animation-duration: 5s;
                animation-fill-mode: forwards;
            }

            @keyframes fade {
                from {
                    opacity: .4
                }
                to {
                    opacity: 1
                }
            }
            .gioithieu{
                font-size: 30px ;
                font-family: "block-pro", "Helvetica Neue", Verdana, Arial, sans-serif;

            }
            .free-delivery{
                /*                position: -webkit-sticky;*/
                position: sticky;
                top: 0;
            }
        </style>
    </head>

    <body>
        <div class="wrapper">
            <div class="header">
                <div class="logo">
                    <a href="home" title="BurgerKing - Vua của các loại Burger trên thế giới"
                       rel="home"><img src="images/burrgerlogo.png" alt="images"></a>
                </div>
                <nav class="nav">
                    <ul>
                        <li><a href="Action?check=main">TRANG CHỦ</a></li>
                        <li><a href="Action?check=introduction">GIỚI THIỆU</a></li>
                        <li><a href="Action?check=store">CỬA HÀNG</a></li>
                            <c:if test="${sessionScope.role == 2}">
                            <li><a href="Action?check=contact">LIÊN HỆ</a></li>
                            </c:if>
                            <c:if test="${sessionScope.role == 1}">
                            <li><a href="Action?check=manage">QUẢN LÝ</a></li>
                            </c:if>
                    </ul>
                </nav>
                <div class="header-right">
                    <ul>
                        <li><a href="" title="shopping cart"><i class="fas fa-shopping-cart white-icon"></i></a></li>
                                <c:set var="a" value="${sessionScope.success}"/>
                                <c:if test="${a==null}">
                            <li><a href="logInLogOut?check=logIn" title="Log In"><i class="fas fa-sign-in-alt white-icon"></i></a></li>
                                </c:if>

                        <c:if test="${a!=null}">
                            <c:set var="user" value="${sessionScope.user}"/>
                            <li>
                                <a href="logInLogOut?check=logOut" title="Log Out"><i class="fas fa-sign-out-alt"></i></a>
                            </li>
                            <li>
                                <a href="Profile?user=${user}" class="name"><i class="fas fa-user"></i></a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>


            <!--962.4px-->
            <c:set var="main" value="${sessionScope.mainSuccess}"/>
            <c:if test="${main!=null}">
                <div class="main">
                    <div class="slideshow-container">

                        <div class="mySlides fade">
                            <div class="numbertext">1 / 5</div>
                            <img src="images/slide1.jpg" style="width:100%">
                        </div>

                        <div class="mySlides fade">
                            <div class="numbertext">2 / 5</div>
                            <img src="images/slide2.jpg" style="width:100%">
                        </div>

                        <div class="mySlides fade">
                            <div class="numbertext">3 / 5</div>
                            <img src="images/slide3.jpg" style="width:100%">
                        </div>
                        <div class="mySlides fade">
                            <div class="numbertext">4 / 5</div>
                            <img src="images/slide4.jpg" style="width:100%">
                        </div>
                        <div class="mySlides fade">
                            <div class="numbertext">5 / 5</div>
                            <img src="images/slide5.jpg" style="width:100%">
                        </div>
                        <a class="prev" onclick="plusSlides(-1)">❮</a>
                        <a class="next" onclick="plusSlides(1)">❯</a>

                    </div>
                    <br>

                    <div style="text-align:center">
                        <span class="dot" onclick="currentSlide(1)"></span> 
                        <span class="dot" onclick="currentSlide(2)"></span> 
                        <span class="dot" onclick="currentSlide(3)"></span> 
                        <span class="dot" onclick="currentSlide(4)"></span> 

                        <span class="dot" onclick="currentSlide(5)"></span> 

                    </div>
                    <div class="selling">
                        <div class="hot-selling-title">
                            <hr>
                            <p>SẢN PHẨM NỔI BẬT</p>
                            <hr>
                        </div>
                        <div class="hot-selling">
                            <c:forEach items="${sessionScope.products}" var="p">
                                <c:if test="${p.category.id == 2}">
                                    <div class="product">
                                        <img src="${p.image}" alt="${p.image}"/>
                                        <p>${p.category.name}</p>
                                        <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; ">${p.name}</a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                </div>

            </c:if>

            <c:set var="intro" value="${sessionScope.introductionSuccess}"/>
            <c:if test="${intro!=null}">
                <div class="introduction">

                    <div>
                        <h3 style="color:red">GIỚI THIỆU</h3>
                        <hr>
                        <p class="gioithieu">BURGER KING®</p><!-- comment --> 
                        <p style="text-align: justify;">Được thành lập vào năm 1954, BURGER KING® hiện là chuỗi nhà hàng thức ăn nhanh lớn nhất thế giới. Mỗi ngày, có hơn 11 triệu thực khách đến với các nhà hàng BURGER KING® trên khắp thế giới để thưởng thức các món ăn chất lượng cao, hương vị tuyệt hảo và giá cả phải chăng.

                            Dù ở đâu, BURGER KING® cũng luôn giữ đúng tinh thần Taste is King, làm hài lòng khẩu vị của thực khách khó tính nhất khi đến thưởng thức tại nhà hàng. Các cửa hàng của BURGER KING® cũng sẽ giữ vững phương châm phục vụ của BURGER KING® “những bữa ăn thân thiện với gia đình”, thể hiện qua đội ngũ nhân viên phục vụ được đào tạo chuyên nghiệp, nhanh chóng và thân thiện, không gian thoải mái, thiết kế nội thất hiện đại, những món ăn tươi ngon và nóng sốt, thức uống mát lạnh và an toàn vệ sinh tuyệt đối.

                            Phương châm của BURGER KING® là bất cứ ở đâu, vào thời điểm nào, chúng tôi đều phục vụ những chiếc bánh WHOPPER® ngon nhất thế giới cho đông đảo khách hàng sành điệu.</p>


                        <p class="gioithieu">Lịch sử BURGER KING®</p><!-- comment --> 
                        <p style="text-align: justify;">Tiền thân của BURGER KING® là Insta-Burger King, do Matthew Burns và Keith J. Kramer thành lập tại Florida, Mỹ vào năm 1953. Cách thức nấu ăn với chiếc vỉ Insta-Broiler cho ra những viên thịt có hương vị tuyệt hảo.

                            Năm 1954, David Edgerton và James McLamore mua lại chuỗi cửa hàng Insta- Burger King, đổi tên thành Burger King of Miami và sau đó là Tập đoàn Burger King. Họ vẫn dùng cách nướng lửa, nhưng thay chiếc vỉ Insta-Broiler bằng vỉ nướng lửa Flame-Broiler – tức là chiếc vỉ nướng ga được cơ giới hóa.

                            BURGER KING® hiện là chuỗi nhà hàng thức ăn nhanh lớn nhất thế giới. Mỗi ngày, có hơn 11 triệu thực khách đến với các nhà hàng BURGER KING® trên khắp thế giới để thưởng thức các món ăn chất lượng cao, hương vị tuyệt hảo và giá cả phải chăng.</p>



                        <p class="gioithieu">Giới thiệu BKV</p><!-- comment --> 
                        <p style="text-align: justify;">BURGER KING® đã chọn Công ty TNHH DV Thực phẩm và Giải khát Việt Nam (thuộc Tập đoàn Imexpan Pacific) làm đối tác kinh doanh nhượng quyền chính thức tại VN. Nhiều năm qua, VFBS và BURGER KING®đã phát triển mạng lưới phân phối, nhà cung ứng vững chắc. Đồng thời huấn luyện họ các tiêu chuẩn nghiêm ngặt về chất lượng, an toàn vệ sinh thực phẩm. Nhân sự làm việc tại nhà hàng BURGER KING® phải qua khóa huấn luyện các cửa hàng BURGER KING® tại Mỹ và khu vực Đông Nam Á. Sau đó, phải đạt được giấy chứng nhận đào tạo loại ưu trở lên.

                            Tin rằng với chiến lược dài hạn đúng đắn, tư duy kinh doanh nhạy bén, VFBS có thể góp sức vào nhiều lĩnh vực như đào tạo, phát triển nhân sự, tìm địa điểm chiến lược, tiếp thị… Ngược lại, BURGER KING® sẽ hỗ trợ về chuyên môn, phát triển cơ cấu tổ chức và hệ thống điều hành.VFBS sẽ đầu tư vốn dự kiến cho hoạt động kinh doanh của BURGER KING® tại Việt Nam dự kiến khoảng 40 triệu USD và sẽ tăng hơn nữa nếu tìm được nhiều mặt bằng chiến lược.</p>

                    </div>
                </div>
            </div>    
        </c:if>

        <c:set var="store" value="${sessionScope.storeSuccess}"/>
        <c:if test="${store!=null}">
            <div class="row store">
                <div class="left-store col-md-3">
                    <h4>Tìm kiếm</h4><br>
                    <ul class="menu">
                        <li><a href="Products?cid=0">Tất Cả Sản Phẩm</a></li>
                        <hr>
                        <c:forEach var="c" items="${sessionScope.data}">
                            <li><a href="Products?cid=${c.id}">${c.name}</a></li><hr>
                            </c:forEach>
                    </ul>
                    <h4>Search</h4>
                    <%@include file="search.jsp" %>

                </div>
                <div class="right-store col-md-9">
                    <c:if test="${sessionScope.listByPrice == null && sessionScope.listByName == null && sessionScope.listBySort == null}">
                        <c:if test="${requestScope.products == null}">
                            <c:forEach items="${sessionScope.products}" var="p">
                                <div class="product">
                                    <img src="${p.image}" alt="${p.image}"/>
                                    <p>${p.category.name}</p>
                                    <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; ">${p.name}</a>
                                    <h5 style="font-weight: bold;">Price: ${p.price}00₫</h5>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:forEach items="${requestScope.products}" var="p">
                            <div class="product">
                                <img src="${p.image}" alt="${p.image}"/>
                                <p>${p.category.name}</p>
                                <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; ">${p.name}</a>
                                <h5 style="font-weight: bold;">Price: ${p.price}00₫</h5>
                            </div>
                        </c:forEach>
                    </c:if>

                    <c:if test="${sessionScope.listByPrice!=null}">
                        <c:forEach items="${sessionScope.listByPrice}" var="p">
                            <div class="product">
                                <img src="${p.image}" alt="${p.image}"/>
                                <p>${p.category.name}</p>
                                <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; ">${p.name}</a>
                                <h5 style="font-weight: bold;">Price: ${p.price}00₫</h5>
                            </div>
                        </c:forEach>
                    </c:if>

                    <c:if test="${sessionScope.listByName!=null}">
                        <c:forEach items="${sessionScope.listByName}" var="p">
                            <div class="product">
                                <img src="${p.image}" alt="${p.image}"/>
                                <p>${p.category.name}</p>
                                <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; ">${p.name}</a>
                                <h5 style="font-weight: bold;">Price: ${p.price}00₫</h5>
                            </div>
                        </c:forEach>
                    </c:if>

                    <c:if test="${sessionScope.listBySort!=null}">
                        <c:forEach items="${sessionScope.listBySort}" var="p">
                            <div class="product">
                                <img src="${p.image}" alt="${p.image}"/>
                                <p>${p.category.name}</p>
                                <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; ">${p.name}</a>
                                <h5 style="font-weight: bold;">Price: ${p.price}00₫</h5>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </c:if>

        <c:if test="${requestScope.productById!=null}">
            <c:set var="p" value="${requestScope.productById}"/>
            <div class="productById">
                <div class="productInfo">
                    <div>
                        <img src="${p.image}" alt="image"/>
                    </div>
                    <div>
                        <h2>${p.name}</h2>
                        <p style="font-size: 18px; margin: 40px 0;">${p.describe}</p>
                        <h3>Price: ${p.price}00₫</h3><br><br>
                        <div class="actions" style="justify-content: left">
                            <div class="action">
                                <a href="bill?id=${p.id}">Buy</a>
                            </div>
                        </div>
                    </div>
                </div>

                <h3>Sản Phẩm Tương Tự<h3>

                        <div class="productByCid">
                            <c:forEach items="${requestScope.productByCid}" var="p">
                                <div class="product">
                                    <img src="${p.image}" alt="${p.image}"/>
                                    <a href="productInfo?id=${p.id}&cid=${p.category.id}" style="color: black; font-size: 18px;">${p.name}</a>
                                    <h5 style="font-weight: bold;">Price: ${p.price}00₫</h5>
                                </div>
                            </c:forEach>
                        </div>
                        </div>
                    </c:if>

                    <c:set var="contact" value="${sessionScope.contactSuccess}"/>
                    <c:if test="${contact!=null}">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-4">
                                    <h2 style="margin-bottom: 15px;">Contact Info</h2>
                                    <p><i class="fas fa-map-marker-alt"></i><strong>Address:</strong>5th Floor,91 Pasteur, Ward. Ben Nghe, District 1, Ho Chi Minh City</p>
                                    <p><i class="fas fa-phone-alt"></i><strong>Phone:</strong><span style="color: orange;">1900 6960</span></p>
                                    <p><i class="far fa-envelope"></i><strong>Email:</strong><span style="color: orange;">bi.pp-marketing@vfbs.vn</span></p>
                                </div>
                                <div class="col-lg-8 contact">
                                    <form>
                                        <div>
                                            <label for="name">Name</label><br>
                                            <input type="text" name="name" id="name">
                                        </div>
                                        <div>
                                            <label for="email">Email</label><br>
                                            <input type="text" name="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                                        </div>
                                        <div>
                                            <label for="content">Content</label><br>
                                            <textarea name="content" id="content" rows="5"></textarea>
                                        </div>
                                        <div class="send">
                                            <button type="button" onclick="sendFeedback()">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row contact-us-bottom"><iframe height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.4466078960722!2d106.69744886480805!3d10.777065892321081!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6cd92f1a65c52108!2sSaigon+Royal+Building!5e0!3m2!1svi!2s!4v1521606453941" style="border: 0; margin-bottom: 20px; width: 100%;" width="320"></iframe></div>

                    </c:if>

                    <div class="footer">
                        <div class="row">
                            <div class="col-lg-1"></div>
                            <div class="first-footer col-lg-4">
                                <h3>Liên hệ</h3>
                                <p><i class="fas fa-phone-alt"></i> 0393377251</p>
                                <p><i class="fas fa-map-marker-alt"></i> 5th Floor, 91 Pasteur, Ward. Ben Nghe , District 1, Ho Chi Minh City</p>
                                <p><i class="far fa-envelope"></i> bi.pp-marketing@vfbs.vn</p>
                            </div>
                            <div class="col-lg-1"></div>
                            <div class="second-footer col-lg-2">
                                <h3>Liên Hệ</h3>
                                <p><a href="https://www.facebook.com/BurgerKingVN.FP/" target="_blank"><i class="fab fa-facebook-f"></i> Facebook</a></p>
                                <p><a href="https://www.instagram.com/burgerking.vn/" target="_blank"><i class="fab fa-tiktok"></i> Instagram</a></p>
                                <p><a href="https://tuyendung.vfbs.vn/"><i class='bx bxs-meteor'></i>  Tuyển Dụng</a></p>
                            </div>
                            <div class="col-lg-1"></div>
                            <div class="third-footer col-lg-3">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31356.543324852573!2d106.6533942743164!3d10.76774560000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3d8631adaf%3A0x3c65e5b4ad01bd8d!2sBurger%20King!5e0!3m2!1sen!2ssg!4v1709711632226!5m2!1sen!2ssg" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
                                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                                    referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                    </div>
                    <div class="free-delivery active">
                        <a href="tel:19006960"><img src="https://burgerking.vn/skin/frontend/bk2/default/images/Burgerking-Delivery-Desktop.png" alt="delivery"></a>
                    </div>
                    </div>


                    <script>
                        function sendFeedback() {
                            var nameValue = document.getElementById('name').value;
                            var emailValue = document.getElementById('email').value; // Fix variable name here
                            var contentValue = document.getElementById('content').value; // Fix variable name here
                            var mailtoLink = 'mailto:hoangnhhe172374@fpt.edu.vn?subject=' + encodeURIComponent(emailValue) + '&body=Tôi là ' + encodeURIComponent(nameValue + '\n') + encodeURIComponent(contentValue);
                            window.location.href = mailtoLink;
                        }
                    </script>   
                    <script>
                        let slideIndex = 1;
                        showSlides(slideIndex);

                        function plusSlides(n) {
                            showSlides(slideIndex += n);
                        }

                        function currentSlide(n) {
                            showSlides(slideIndex = n);
                        }

                        function showSlides(n) {
                            let i;
                            let slides = document.getElementsByClassName("mySlides");
                            let dots = document.getElementsByClassName("dot");
                            if (n > slides.length) {
                                slideIndex = 1
                            }
                            if (n < 1) {
                                slideIndex = slides.length
                            }
                            for (i = 0; i < slides.length; i++) {
                                slides[i].style.display = "none";
                            }
                            for (i = 0; i < dots.length; i++) {
                                dots[i].className = dots[i].className.replace(" active", "");
                            }
                            slides[slideIndex - 1].style.display = "block";
                            dots[slideIndex - 1].className += " active";
                        }
                    </script>
                    </body>

                    </html>