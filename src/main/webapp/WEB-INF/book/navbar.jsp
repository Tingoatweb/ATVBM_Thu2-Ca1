<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    button#toggle-dark-mode{
        background: none;
        color: inherit;
        border: none;
        position: absolute;
        font: inherit;
        cursor: pointer;
        outline: inherit;
        top: 12px;





    }
    .fa-regular.fa-sun{
        font-size: 20px;
        color: #f5f56d;

    }
    .fa-regular.fa-moon{
        font-size: 20px;

    }

</style>

<!DOCTYPE html>
<nav>
    <jsp:useBean id="wishlistDAO" class="database.WishListDAO" scope="session" />
    <c:set var="wishCount" value="0" />

    <c:if test="${not empty sessionScope.userC}">
        <c:set var="userId" value="${sessionScope.userC.userId}" />
        <c:set var="wishCount" value="${wishlistDAO.countByUserId(userId)}" />
        <c:set var="wishCount" value="${wishCount}" scope="request" />
    </c:if>
    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>2</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> </a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <c:choose>
            <c:when test="${not empty sessionScope.userC.name}">
                <p style="position:relative;top:8px">Chào ${sessionScope.userC.name}/<a href="LogOutForm"
                                                                                        style="text-decoration:none">LogOut</a>
                </p>
            </c:when>
            <c:otherwise>
            <div class="header__top__right__auth">
                <a href="./Login"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        </c:otherwise>
        </c:choose>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./Index">Home</a></li>
                <li><a href="./Shopgrid">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./Shop details">Shop Details</a></li>
                        <li><a href="./Cart">Shoping Cart</a></li>
                        <li><a href="./Checkout">Check Out</a></li>
                        <li><a href="./Blog details">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="Vnpay.jsp">Blog</a></li>
                <li><a href="./contact.jsp">Contact</a></li>
                <li><a href="/AdminIndex">Admin</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
</nav>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header" style="position: fixed;z-index: 999;;background:white;top:0;width: 100%">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                            <li>Free Shipping for all Order of $99</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">

                        </div>
                        <c:choose>
                            <c:when test="${not empty sessionScope.userC.name || not empty sessionScope.admin.name}">
                                <div class="header__top__right__auth">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.userC.name}">
                                            <!-- Phần của người dùng đã đăng nhập -->
                                            Chào, ${sessionScope.userC.name}
                                            <!-- Các thao tác khác -->
                                        </c:when>
                                        <c:when test="${not empty sessionScope.admin.name}">
                                            <!-- Phần của admin đã đăng nhập -->
                                            Chào admin, ${sessionScope.admin.name}
                                            <!-- Các thao tác khác -->
                                        </c:when>
                                    </c:choose>
                                    <div class="header__top__right__language">
                                        <img style="margin-left: 40px" src="img/blog/blog-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                                        <span class="arrow_carrot-down"></span>
                                        <ul>
                                            <li><a href="./Profile">Hồ sơ của tôi</a></li>
                                            <li><a href="./ChangePass">Thay đổi mật khẩu</a></li>
                                            <li><a href="./ChangeInf">Thay đổi thông tin</a></li>
                                            <li><a href="./Register">Trợ giúp</a></li>
                                            <li><a href="./Order">Đơn đặt hàng</a></li>
                                            <li><a href="./Logout">Đăng xuất</a></li>
                                        </ul>
                                    </div>
                                    <button id="toggle-dark-mode">
                                        <i class="fa-regular fa-moon" id="icontype"></i>
                                    </button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="header__top__right__language">
                                    <div>Đăng nhập</div>
                                    <span class="arrow_carrot-down"></span>
                                    <ul>
                                        <li><a href="./Login">Đăng nhập</a></li>
                                        <li><a href="./Register">Đăng kí</a></li>
                                        <li><a href="./ForgotPass">Quên mật khẩu</a></li>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="index.jsp"><img src="img/logobook.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <c:choose>
                            <c:when test="${not empty sessionScope.admin}">
                                <li class="active"><a href="./Index">Trang chủ</a></li>
                                <li><a href="./Shopgrid">Shop</a></li>

                                <li><a href="./BankAccount">Blog</a></li>
                                <li><a href="./Contact">Contact</a></li>
                                <li><a href="/AdminIndex">Admin</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="active"><a href="./Index">Trang chủ</a></li>
                                <li><a href="./Shopgrid">Shop</a></li>
                                <li><a href="./Coupon">Ưu đãi <i style="color: #ff0018" class="fa-solid fa-gift"></i></a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="header__menu__dropdown">
                                        <li><a href="./RatingPage">Rating</a></li>
                                        <li><a href="./CommentPage">Comment</a></li>

                                    </ul>
                                </li>
                                <li><a href="./Contact">Contact</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </div>

            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li>
                            <a href="MyCoupon">
                                <img height="30" width="50" src="/img/coupon.png" alt="">
                                <span class="coupon-item-count" style="background-color: red; right: 5px"></span>
                            </a>
                        </li>
                        <li>
                            <a href="WishListPage">
                                <img height="30" width="30" src="/img/wistList.png" alt="">
                                <span style="background-color: #26a1e5" class="wishlist-item-count">${requestScope.wishCount == null ? '0' :requestScope.wishCount}</span>
                            </a>
                        </li>
                        <li>
                            <a href="Shoppingcart">
                                <img height="30" width="30" src="/img/cartIcon.png" alt="">
                                <span style="background-color: #26a1e5" class="cart-item-count">${empty sessionScope.cart ? '0' : sessionScope.cart.calculateTotalQuantity()}</span>
                            </a>
                        </li>
                    </ul>
                    <div class="header__cart__price">item: <span>$150.00</span></div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>

    </div>

    <%--    <div>--%>
    <%--        <ul class="navbar-nav w-100">--%>
    <%--            <li class="nav-item w-100">--%>
    <%--                <form action="${pageContext.request.contextPath}/search"--%>
    <%--                      class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">--%>
    <%--                    <input type="text" id="productName" name="productName"--%>
    <%--                           class="form-control-search"--%>
    <%--                           placeholder="search"/>">--%>
    <%--                    <button type="submit" class="button-search">--%>
    <%--                        <img src="/image/icons8-find-30.png" alt="Search">--%>
    <%--                    </button>--%>
    <%--                </form>--%>


    <%--            </li>--%>
    <%--        </ul>--%>
    <%--    </div>--%>
</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->

<!-- Hero Section Begin -->

<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All departments</span>
                    </div>
                    <ul>
                        <li><a href="#">Fresh Meat</a></li>
                        <li><a href="#">Vegetables</a></li>
                        <li><a href="#">Fruit & Nut Gifts</a></li>
                        <li><a href="#">Fresh Berries</a></li>
                        <li><a href="#">Ocean Foods</a></li>
                        <li><a href="#">Butter & Eggs</a></li>
                        <li><a href="#">Fastfood</a></li>
                        <li><a href="#">Fresh Onion</a></li>
                        <li><a href="#">Papayaya & Crisps</a></li>
                        <li><a href="#">Oatmeal</a></li>
                        <li><a href="#">Fresh Bananas</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="/search">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" oninput="searchByName(this)" id="productName" name="productName" placeholder="What do you need?" list="datalist1">


                            <datalist id="datalist1">
                                <c:forEach items="${listProducts}" var="p">
                                    <option value="${p.product_name}"></option>
                                </c:forEach>
                            </datalist>
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+65 11.188.888</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- Hero Section End -->
</nav>

