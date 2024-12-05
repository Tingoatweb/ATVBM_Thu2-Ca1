
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<%@ page import="util.FormatCurrency"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<style>


    .coupon{
        display: grid;
        grid-template-columns: repeat(3, 430px);
        /*gap: 5px;*/
        background-color: #ffffff;
    }

    .card-coupon{
        width: 400px;
        height: 180px;
        border-radius: 5px;
        box-shadow: 0 9px 8px 0 rgba(0, 0, 0, 0.5);
        background-color: #ff4343;
        padding: 10px 10px;
        position: relative;
        margin-right: 5px;
        margin-bottom: 20px;
    }
    .copy-button {
        border: none;
    }
    .main-coupon,
    .copy-button {
        display: flex;
        justify-content: space-between;
        padding: 0 10px;
        align-items: center;
        border: none;
    }
    .card-coupon::after {
        position: absolute;
        content: "";
        height: 40px;
        right: -20px;
        border-radius: 40px;
        z-index: 1;
        top: 70px;
        background-color: #ffffff;
        width: 40px;
    }

    .card-coupon::before {
        position: absolute;
        content: "";
        height: 40px;
        left: -20px;
        border-radius: 40px;
        z-index: 1;
        top: 70px;
        background-color: #ffffff;
        width: 40px;
    }

    .co-img img {
        width: 100px;
        height: 100px;
        margin-left: 10px;
    }
    .vertical {
        border-left: 5px dotted #ffea00;
        height: 100px;
        position: absolute;
        left: 40%;
    }

    .content h1 {
        font-size: 35px;
        margin-left: -20px;
        color: #ffea00;
        font-weight: bold;
        text-shadow:
                -4px -1px 0 #000,
                1px -1px 0 #000,
                -3px 1px 0 #000,
                1px 1px 0 #000;
    }

    .content h1 span {
        font-size: 18px;
        font-weight: bold;
    }
    .content h2 {
        font-size: 18px;
        margin-left: -20px;
        color: #000000;
        text-transform: uppercase;
        font-weight: bold;
    }

    .content p {
        font-size: 16px;
        color: #ffffff;
        margin-left: -30px;
        font-weight: bold;
    }

    .copy-button {
        margin: 12px 0 -5px 0;
        height: 45px;
        border-radius: 4px;
        padding: 0 5px;
        border: 1px solid #c7c7c7;
    }

    .copy-button input {
        width: 100%;
        height: 100%;
        border: none;
        outline: none;
        font-size: 15px;
        border-radius: 3px;
    }

    .copy-button button {
        margin-left: 3px;
        padding: 5px 20px;
        background-color: #ffea00;
        color: #000000;
        font-weight: bold;
        border: 1px solid transparent;
    }
    .coupon__news__title{
        margin-left: -1130px;
        margin-top: 10px;
    }
</style>
<body>

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<jsp:include page="navbar.jsp"/>

<!-- Categories Section Begin -->
<%--<section class="categories">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="categories__slider owl-carousel">--%>
<%--                <div class="col-lg-3">--%>
<%--                    <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg">--%>
<%--                        <h5><a href="#">Fresh Fruit</a></h5>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Categories Section End -->
<jsp:useBean id="couponOfUserDAO" class="database.CouponOfUserDAO"/>

<section class="breadcrumb-section set-bg" data-setbg="img/hinhnen.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Mã giảm giá</h2>
                    <div class="breadcrumb__option">
                        <a href="Index">Trang chủ</a>
                        <span>Mã giảm giá</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="section-title coupon__news__title">
    <h2>Mới nhất</h2>
</div>
<section>
    <div class="container">
        <div class="coupon">
            <c:set var="id" value="${sessionScope.userC.userId}"/>
            <c:forEach var="couponOfUser" items="${couponOfUserDAO.selectByUserId(id)}">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="card-coupon">
                        <div class="main-coupon">
                            <div class="co-img">
                                <img
                                        src="https://i.pinimg.com/originals/c7/84/67/c78467db9ff497393cb548a48f02d451.png"
                                        alt=""
                                />
                            </div>
                            <div class="vertical"></div>
                            <div class="content">
                                <h2>Mcdonalds</h2>
                                <h1>10% <span>Coupon</span></h1>
                                <p>Valid till 30 April 2021</p>
                            </div>
                        </div>
                        <div class="copy-button">
                               <input id="copyvalue${couponOfUser.coupon.code}" type="text" readonly value="${couponOfUser.coupon.code}" />
                               <button onclick="copyIt('copyvalue${couponOfUser.coupon.code}')" class="copybtn">COPY</button>
                        </div>
                    </div></div>
            </c:forEach>

        </div>
    </div>
</section>

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/banner-1.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/banner-2.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Footer Section Begin -->
<footer class="footer spad">

    <jsp:include page="footer.jsp" />
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/darkreader@4.9.80/darkreader.min.js"></script>
<script>
    function copyIt(elementId) {
        var copyText = document.getElementById(elementId);
        copyText.select();
        document.execCommand("copy");

        var copyButton = copyText.nextElementSibling;
        copyButton.textContent = "COPIED";

        setTimeout(function() {
            copyButton.textContent = "COPY";
        }, 2000);
    }
</script>
<script>
    const toggleDarkModeButton = document.getElementById("toggle-dark-mode");
    const icondarklight = document.getElementById('icontype');

    // Initially disable Dark Reader
    DarkReader.disable();

    toggleDarkModeButton.addEventListener("click", () => {
        if (DarkReader.isEnabled()) {
            DarkReader.disable();
            icondarklight.classList.replace("fa-sun", "fa-moon");
        } else {
            DarkReader.enable({
                brightness: 100,
                contrast: 90,
                sepia: 10
            });
            icondarklight.classList.replace("fa-moon", "fa-sun");
        }
    });

    // Set the initial button text and Font Awesome icon


    // Enable Dark Reader when the page loads

</script>
<script src="https://cdn.botpress.cloud/webchat/v2/inject.js"></script>
<script src="https://mediafiles.botpress.cloud/1d0997ec-87ba-4ea8-8a5c-c2fba00d5019/webchat/v2/config.js"></script>

</body>

</html>