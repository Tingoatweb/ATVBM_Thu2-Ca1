<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="util.FormatCurrency"%>
<%@ page import="database.RatingDAO"%>
<%@page isELIgnored="false" %>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <style>

        .submit-button {
            border: none;
            background: none;
            padding: 0;
            font-size: 0; /* Ẩn văn bản trong nút */
            cursor: pointer;
        }

        .submit-button .fa {
            font-size: 24px; /* Kích thước biểu tượng */
            color: #000; /* Màu của biểu tượng */
        }
        .product__item__pic.set-bg img{
            width: 200px;
            height: 250px;
            object-fit: cover;

        }
        .product__item__pic.set-bg{
            margin-top: -25px;
        }
        .col-lg-9.col-md-7 .row{
            margin-left: 30px;
        }
        .col-lg-4.col-md-6.col-sm-6{

        }
        .product__item {
            background-color: white;
            height: 360px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            box-shadow: 0 0 5px #212121;
            border-radius: 10px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .product__item:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px #000000;
        }
        .product__item__text h6{
            margin-top: -30px;
            font-weight: 400;
            font-size: 13px;
            color: rgba(39,39,42);
            word-break: break-word;
            margin-right: auto;
        }
        .product__item__text a{
            margin-left: 10px;
        }
        .product__item__pic__hover {
            position: absolute;
            left: 0;
            bottom: -70px;
            width: 100%;
            text-align: center;
            -webkit-transition: all, 0.5s;
            -moz-transition: all, 0.5s;
            -ms-transition: all, 0.5s;
            -o-transition: all, 0.5s;
            transition: all, 0.5s;
        }
        .product__item__pic__hover:hover{
            position: absolute;
            bottom: 120px;
        }
        .product__item__pic__hover li:hover a {
            background: #25a6d5;
            border-color: #25a6d5;
        }
        .product__item__pic__hover li:hover a i {
            color: #ffffff;

        }
        .product__item__pic__hover li a {
            height: 50px;
            width: 50px;
            border: 1px solid #000000;
            background: white;
            box-shadow: 0 0 8px #000000;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .fa-star{
            font-size: 10px;
            color: #e39509;
        }
        .Ratestar{
            list-style-type: none;
            margin-left: 20px;
            display: flex;
            justify-content: flex-start;
            gap:3px;
            width: 67px;
            position: absolute;
            left:20px;
            margin-top: -5px;

        }
        .Ratestar::after{

        }
        .Productnotsell{
            /*border-left: 1px solid gray;*/
            width: 100px;
            font-size: 12px;
            color: rgba(39,39,42);
            white-space: nowrap;
            margin-top: 5px;
            margin-left: 1px;

        }
        .product__item__text h5{
            padding-top: 25px;
        }

        .Stick{
            border-right: 1px solid gray;
            height: 15px;
            margin-top: 5px;

        }
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

        .Ratestar img{
            margin-top:4px;
        }
        .product__pagination a {
            border: 2px solid black;
            color: black;
            transition: background-color 0.3s, color 0.3s, transform 0.5s;
        }
        .product__pagination a:hover {
            background-color: orange;
            color: black;
            transform: scale(1.1);
            border: none;
        }
        .product__pagination a.active {
            background-color: orange;
            color: black;
            border: none;
        }
        .strikethrough {
            position: relative;
            display: inline-block;
        }

        .strikethrough::after {
            content: "";
            position: absolute;
            left: 0;
            right: 0;
            top: 50%;
            height: 2px; /* Thickness of the strikethrough line */
            background-color: red; /* Red color for the strikethrough line */
            transform: translateY(-50%);
        }
        #searchForm {
            display: flex;
            align-items: center;
            gap: 0; /* Đảm bảo không có khoảng cách giữa các phần tử */
        }

        #searchInput {
            flex: 1; /* Cho phép input chiếm không gian còn lại */
            margin-right: 0; /* Loại bỏ margin mặc định bên phải */
        }

        #searchForm button {
            flex: 0 0 auto; /* Đảm bảo button không mở rộng ra */
            margin-left: 0; /* Loại bỏ margin mặc định bên trái */
        }


    </style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<jsp:useBean id="rating" class="database.RatingDAO"></jsp:useBean>

<jsp:include page="navbar.jsp"/>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/hinhnen.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Organi Shop</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <br><br>
                <div class="sidebar">
                    <jsp:useBean id="productDAO" class="database.ProductDAO" />
                    <c:set var="listProductTop" value="${productDAO.topNBestProduct(6)}"/>
                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Sách bán chạy <i style="color: red" class="fa-solid fa-fire"></i></h4>
                            <div class="latest-product__slider owl-carousel">

                                <!-- Slider 1: Top 3 sản phẩm đầu tiên -->
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="entry" items="${listProductTop.entrySet()}" varStatus="status">
                                        <c:if test="${status.index < 3}">
                                            <c:set var="productIdTop" value="${entry.key}" />
                                            <c:set var="quantityTop" value="${entry.value}" />
                                            <c:set var="productTop" value="${productDAO.selectById(productIdTop)}" />
                                            <a href="#" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="/image/${productTop.image}" alt="${productTop.product_name}">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${productTop.product_name}</h6>
                                                    <span>${productTop.price}</span>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <!-- Slider 2: Top 3 sản phẩm tiếp theo -->
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="entry" items="${listProductTop.entrySet()}" varStatus="status">
                                        <c:if test="${status.index >= 3 && status.index < 6}">
                                            <c:set var="productIdTop" value="${entry.key}" />
                                            <c:set var="quantityTop" value="${entry.value}" />
                                            <c:set var="productTop" value="${productDAO.selectById(productIdTop)}" />
                                            <a href="#" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="/image/${productTop.image}" alt="${productTop.product_name}">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${productTop.product_name}</h6>
                                                    <span>${productTop.price}</span>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <h4>Tìm kiếm</h4>
                        <form action="search" class="form-inline my-2 my-lg-0" id="searchForm" onsubmit="searchByName(); return false;">
                            <input class="form-control mr-sm-2" type="search" placeholder="Từ khóa" aria-label="Search" id="productName" name="productName" oninput="searchByName(this)" list="datalist1">
                            <datalist id="datalist1">
                                <c:forEach items="${listProducts}" var="p">
                                    <option value="${p.product_name}"></option>
                                </c:forEach>
                            </datalist>
                            <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                    </div>
                    <div class="sidebar__item">
                        <h4>Price</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" data-min="10000" data-max="500000">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount" name="minamount">
                                    <input type="text" id="maxamount" name="maxamount">
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="sidebar__item">
                            <h4>Thể loại</h4>
                            <ul>
                                <li><a id="all-category" href="#" class="category-link" data-category="">Tất cả</a>
                                </li>
                                <c:forEach var="ca" items="${list}">
                                    <li><a href="#" data-category="${ca.categoryName}" class="category-link">${ca.categoryName}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <br><br>
<%--                <div class="product__discount">--%>
<%--                    <div class="section-title product__discount__title">--%>
<%--                        <h2>Sale Off</h2>--%>
<%--                    </div>--%>
<%--                    <div class="row">--%>
<%--                        <div class="product__discount__slider owl-carousel">--%>
<%--                            <div class="col-lg-4">--%>
<%--                                <div class="product__discount__item">--%>
<%--                                    <div class="product__discount__item__pic set-bg"--%>
<%--                                         data-setbg="img/product/discount/pd-1.jpg">--%>
<%--                                        <div class="product__discount__percent">-20%</div>--%>
<%--                                        <ul class="product__item__pic__hover">--%>
<%--                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>--%>
<%--                                            <li><a href="#"><i class="fa-info-circle"></i></a></li>--%>
<%--                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                    <div class="product__discount__item__text">--%>
<%--                                        <span>Dried Fruit</span>--%>
<%--                                        <h5><a href="#">Raisin’n’nuts</a></h5>--%>
<%--                                        <div class="product__item__price">$30.00 <span>$36.00</span></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-7 col-md-5">
                            <div class="filter__sort">
                                <span>Giá:</span>
                                <select name="sort" id="sortSelect" onchange="applySort()">
                                    <option value="">Chọn</option>
                                    <option value="desc" ${sortOrder == 'desc' ? 'selected' : ''}>Giá giảm dần</option>
                                    <option value="asc" ${sortOrder == 'asc' ? 'selected' : ''}>Giá tăng dần</option>
                                </select>
                                <span>Thể loại:</span>
                                <select name="category" id="categorySelect" onchange="applySort()">
                                    <option value="">Tất cả</option>
                                    <c:forEach var="ca" items="${list}">
                                        <option value="${ca.categoryName}">${ca.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div class="filter__found">
                                <h6><span id="productCount">${sessionScope.listProducts.size()}</span> kết quả tìm được</h6>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-1">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <c:set var="isSearch" value="${not empty param.productName}" />

                <c:set var="page" value="${sessionScope.page}" />
                <c:set var="num" value="${sessionScope.num}" />
                <c:set var="selectedCategory" value="${sessionScope.selectedCategory}" />

                <c:set var="displayPages" value="3" />
                <c:set var="halfDisplay" value="${displayPages / 2}" />
                <c:set var="startPage" value="${page - halfDisplay}" />
                <c:set var="endPage" value="${page + halfDisplay}" />

                <c:if test="${startPage < 1}">
                    <c:set var="startPage" value="1" />
                    <c:set var="endPage" value="${startPage + displayPages - 1}" />
                </c:if>

                <c:if test="${endPage > num}">
                    <c:set var="endPage" value="${num}" />
                    <c:set var="startPage" value="${endPage - displayPages + 1}" />
                    <c:if test="${startPage < 1}">
                        <c:set var="startPage" value="1" />
                    </c:if>
                </c:if>

                <div class="product__pagination" style="padding-left: 300px">
                    <c:if test="${not isSearch}">
                        <!-- Nút về trang đầu -->
                        <c:if test="${page > 1}">
                            <a style="background-color: #000000; border: none; color: white" href="javascript:void(0);" class="pagination-link" data-page="1"><<</a>
                        </c:if>

                        <!-- Nút trang trước -->
                        <c:if test="${page > 1}">
                            <a style="background-color: #000000; border: none; color: white" href="javascript:void(0);" class="pagination-link" data-page="${page - 1}"><</a>
                        </c:if>

                        <!-- Hiển thị các trang giữa -->
                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                            <a href="javascript:void(0);" class="pagination-link" data-page="${i}" <c:if test="${i == page}">class="active"</c:if>>${i}</a>
                        </c:forEach>

                        <!-- Dấu ba chấm -->
                        <c:if test="${endPage < num}">
                            <a class="pagination-link disabled">...</a>
                        </c:if>

                        <!-- Hiển thị trang cuối cùng nếu cần -->
                        <c:if test="${endPage < num}">
                            <a href="javascript:void(0);" class="pagination-link" data-page="${num}">${num}</a>
                        </c:if>

                        <!-- Nút trang tiếp theo -->
                        <c:if test="${page < num}">
                            <a style="background-color: #000000; border: none; color: white" href="javascript:void(0);" class="pagination-link" data-page="${page + 1}">></a>
                        </c:if>

                        <!-- Nút về trang cuối -->
                        <c:if test="${page < num}">
                            <a style="background-color: #000000; border: none; color: white" href="javascript:void(0);" class="pagination-link" data-page="${num}">>></a>
                        </c:if>
                    </c:if>
                </div>
                <br>
                <div class="row" id="row">

                    <c:forEach var="p" items="${listProduct}">
                        <c:set var="productId" value="${p.getProductId()}" />
                        <c:set var="quantity" value="${productDAO.inventoryProduct(Integer.parseInt(productId))}" />
                        <div class="col-lg-4 col-md-6 col-sm-6 product__form">
                            <div class="product__item">

                                <div class="product__item__pic">
                                    <img class="product-image" lazy data-src="/image/${p.image}" width="180px" height="250px" alt="${p.product_name}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="Shopdetails?id=${p.productId}"><i style="color: black" class="fa-solid fa-circle-info"></i></a></li>
                                        <li>
                                            <form class="add-to-wishlist-form" action="AddToWishList" method="post" id="addToWishListForm">
                                                <input type="hidden" name="productId" value="${p.productId}">
                                                <button class="submit-button" type="submit">
                                                    <c:choose>
                                                        <c:when test="${not empty sessionScope.userC.name || not empty sessionScope.admin.name}">
                                                            <a href=""><i class="fa fa-heart"></i></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="Login"><i class="fa fa-heart"></i></a>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </button>
                                            </form>
                                        </li>
                                        <c:choose>
                                            <c:when test="${quantity > 0}">
                                                <li>
                                                    <form class="add-to-cart-form" action="AddToCart" method="post" id="addToCartForm">
                                                        <input type="hidden" name="productId" value="${p.productId}">
                                                        <button class="submit-button" type="submit">
                                                            <c:choose>
                                                                <c:when test="${not empty sessionScope.userC.name || not empty sessionScope.admin.name}">
                                                                    <a href=""><i class="fa fa-shopping-cart"></i></a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="Login"><i class="fa fa-shopping-cart"></i></a>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </button>
                                                    </form>
                                                </li>
                                            </c:when>
                                            <c:otherwise>

                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6>${p.product_name}</h6>


                                    <ul class="Ratestar">
                                        <c:set var="averageRating" value="${rating.getAverageRatingByProductId(p.productId)}" />
                                        <c:set var="integerPart" value="${averageRating.intValue()}" />
                                        <c:set var="decimalPart" value="${averageRating - integerPart}" />
                                        <c:choose>
                                            <c:when test="${averageRating == 0}">
                                                <c:forEach var="digit" begin="1" end="5">
                                                    <img data-src="img/image/number not rating.png" lazy width="16px" height="16px">
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${integerPart >= 1 && integerPart <= 5 && decimalPart == 0}">
                                                    <c:forEach var="digit" begin="1" end="${integerPart}">
                                                        <img data-src="img/image/number.0 rating.png" lazy width="16px" height="16px">
                                                    </c:forEach>
                                                    <c:forEach var="digit" begin="${integerPart + 1}" end="5">
                                                        <img data-src="img/image/number not rating.png" lazy width="16px" height="16px">
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${integerPart >= 1 && integerPart <= 5 && decimalPart != 0}">
                                                    <c:forEach var="digit" begin="1" end="${integerPart}">
                                                        <img data-src="img/image/number.0 rating.png" lazy width="16px" height="16px">
                                                    </c:forEach>
                                                    <c:set var="decimalPartRounded" value="${Math.round(decimalPart * 10)}" />
                                                    <img data-src="img/image/number.${decimalPartRounded} rating.png" lazy width="16px" height="16px" alt="">
                                                    <c:forEach var="digit" begin="${integerPart + 2}" end="5">
                                                        <img data-src="img/image/number not rating.png" lazy width="16px" height="16px">
                                                    </c:forEach>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <li class="Stick"></li>
                                        <c:choose>
                                        <c:when test="${quantity > 0}">
                                        <li class="Productnotsell">Còn lại ${quantity}</li>
                                    </ul>
                                    <h5 style="font-size: 24px; color: #e30404">${FormatCurrency.formatCurrency(p.price)}</h5>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="Productnotsell">Hết hàng</li>
                                        </ul>
                                        <h5>
                                            <span style="font-size: 24px;" class="strikethrough">${FormatCurrency.formatCurrency(p.price)}</span>
                                            <span style="color: #e30404">HẾT HÀNG</span>
                                        </h5>
                                    </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>



                <div class="product__pagination" style="padding-left: 300px">
                    <c:if test="${not isSearch}">
                        <!-- Nút về trang đầu -->
                        <c:if test="${page > 1}">
                            <a style="background-color: #000000; border: none; color: white" href="javascript:void(0);" class="pagination-link" data-page="1"><<</a>
                        </c:if>

                        <!-- Nút trang trước -->
                        <c:if test="${page > 1}">
                            <a style="background-color: #000000; border: none; color: white" href="javascript:void(0);" class="pagination-link" data-page="${page - 1}"><</a>
                        </c:if>

                        <!-- Hiển thị các trang giữa -->
                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                            <a href="javascript:void(0);" class="pagination-link" data-page="${i}" <c:if test="${i == page}">class="active"</c:if>>${i}</a>
                        </c:forEach>

                        <!-- Dấu ba chấm -->
                        <c:if test="${endPage < num}">
                            <a class="pagination-link disabled">...</a>
                        </c:if>

                        <!-- Hiển thị trang cuối cùng nếu cần -->
                        <c:if test="${endPage < num}">
                            <a href="javascript:void(0);" class="pagination-link" data-page="${num}">${num}</a>
                        </c:if>

                        <!-- Nút trang tiếp theo -->
                        <c:if test="${page < num}">
                            <a style="background-color: #000000; border: none; color: white" href="javascript:void(0);" class="pagination-link" data-page="${page + 1}">></a>
                        </c:if>

                        <!-- Nút về trang cuối -->
                        <c:if test="${page < num}">
                            <a style="background-color: #000000; border: none; color: white" href="javascript:void(0);" class="pagination-link" data-page="${num}">>></a>
                        </c:if>
                    </c:if>
                </div>

            </div>

        </div>
    </div>
    </div>
</section>

<!-- Product Section End -->

<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
                    </div>
                    <ul>
                        <li>Address: 60-49 Road 11378 New York</li>
                        <li>Phone: +65 11.188.888</li>
                        <li>Email: hello@colorlib.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Useful Links</h6>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">About Our Shop</a></li>
                        <li><a href="#">Secure Shopping</a></li>
                        <li><a href="#">Delivery infomation</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Our Sitemap</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">Who We Are</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Innovation</a></li>
                        <li><a href="#">Testimonials</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Join Our Newsletter Now</h6>
                    <p>Get E-mail updates about our latest shop and special offers.</p>
                    <form action="#">
                        <input type="text" placeholder="Enter your mail">
                        <button type="submit" class="site-btn">Subscribe</button>
                    </form>
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                </div>
            </div>
        </div>
    </div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    let currentCategory = '';
    function applySort() {
        currentCategory = $('#categorySelect').val();
        loadProducts(1);
    }

    function loadProducts(page) {
        const sort = $('#sortSelect').val();
        const category = $('#categorySelect').val();
        console.log("Loading products with page:", page, "category:", currentCategory, "sort:", sort);
        $.ajax({
            url: 'Shopgrid',
            type: 'GET',
            data: {
                page: page,
                category: currentCategory,
                sort: sort,
            },
            success: function(response) {
                var newContent = $(response).find('#row').html();
                var newPagination = $(response).find('.product__pagination').html();
                var newProductCount = $(response).find('#productCount').text();

                $('#row').html(newContent);
                $('.product__pagination').html(newPagination);
                $('#productCount').text(newProductCount);

                initializeLazyLoading();
                initializeAddToCart();
                initializeAddToWishlist();

                $('html, body').animate({ scrollTop: $('#row').offset().top }, 'fast');
                updateActivePage(page);
            },
            error: function(xhr, status, error) {
                console.error('Lỗi khi tải sản phẩm:', error);
            }
        });
    }


        function initializeLazyLoading() {
            const lazyImages = document.querySelectorAll('[lazy]');
            const lazyImageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach((entry) => {
                    if (entry.isIntersecting) {
                        const lazyImage = entry.target;
                        const src = lazyImage.dataset.src;
                        if (lazyImage.tagName.toLowerCase() === 'img') {
                            lazyImage.src = src;
                        } else {
                            lazyImage.style.backgroundImage = `url('${src}')`;
                        }
                        lazyImage.removeAttribute('lazy');
                        observer.unobserve(lazyImage);
                    }
                });
            });
            lazyImages.forEach((lazyImage) => {
                lazyImageObserver.observe(lazyImage);
            });
        }

        function initializeAddToCart() {
            $(".add-to-cart-form").off("submit").on("submit", function(event) {
                event.preventDefault();
                var form = $(this);
                <c:if test="${sessionScope.userC.name == null}">
                alert("Bạn cần đăng nhập để mua hàng.");
                window.location.href = "Login"; // Đường dẫn đến trang đăng nhập của bạn
                return;
                </c:if>

                $.ajax({
                    type: "POST",
                    url: form.attr("action"),
                    data: form.serialize(),
                    success: function (data) {
                        alert("Đã đặt hàng thành công!");
                        var currentQuantity = parseInt($(".cart-item-count").text(), 10);
                        var newQuantity = currentQuantity + 1;
                        $(".cart-item-count").text(newQuantity);
                    },
                    error: function (error) {
                        console.error("Error:", error);
                        alert("Đã đặt lỗi");
                    }
                });
            });
        }

        function initializeAddToWishlist() {
            $(".add-to-wishlist-form").off("submit").on("submit", function(event) {
                event.preventDefault();
                var form = $(this);

                // Check if the user is logged in (existing code)

                $.ajax({
                    type: "POST",
                    url: form.attr("action"),
                    data: form.serialize(),
                    success: function(data) {
                        alert("Đã thêm vào danh sách yêu thích!");
                        var currentQuantity = parseInt($(".wishlist-item-count").text(), 10);
                        var newQuantity = currentQuantity + 1;
                        $(".wishlist-item-count").text(newQuantity);
                        // Optionally, update UI elements here
                    },
                    error: function(error) {
                        if (error.responseText.includes("Product already exists in wishlist")) {
                            alert("Sản phẩm này đã tồn tại trong danh sách yêu thích!");
                        } else {
                            console.error("Error:", error);
                            alert("Đã xảy ra lỗi khi thêm vào danh sách yêu thích.");
                        }
                    }
                });
            });
        }
    function updateActivePage(page) {
        $('.pagination-link').removeClass('active');
        $('.pagination-link[data-page="' + page + '"]').addClass('active');
    }
    $(document).ready(function() {
        // Xử lý sự kiện phân trang
        $(document).on('click', '.pagination-link', function (e) {
            e.preventDefault(); // Ngăn chặn hành vi mặc định của liên kết
            var page = $(this).data('page');
            loadProducts(page);
        });
        // Xử lý sự kiện chọn mục sản phẩm từ danh sách liên kết
        $(document).on('click', '.category-link', function(e) {
            e.preventDefault(); // Ngăn chặn hành vi mặc định của liên kết
            currentCategory = $(this).data('category');
            $('#categorySelect').val(currentCategory); // Cập nhật thẻ select
            loadProducts(1); // Trang đầu tiên khi chọn một danh mục sản phẩm
        });


        // Xử lý sự kiện chọn mục sản phẩm từ thẻ select
        $('#categorySelect').on('change', function() {
            currentCategory = $(this).val();
            loadProducts(1);
        });
        // Khởi tạo lazy loading và giỏ hàng lần đầu
        initializeLazyLoading();
        initializeAddToCart();
        initializeAddToWishlist();

        function searchByName(param) {
            var txtSearch = $(param).val().trim();
            console.log("Searching by name: " + txtSearch);
            if (txtSearch === "") {
                loadProducts(1, currentCategory);
            } else {
                $.ajax({
                    url: "/SearchByAjax",
                    type: "GET",
                    data: {
                        productName: txtSearch
                    },
                    success: function(response) {
                        var newSearch = $(response).find('#row').html();
                        var newPaginationSearch = $(response).find('.product__pagination').html();
                        $('#row').html(newSearch);
                        $('.product__pagination').html(newPaginationSearch);

                        initializeLazyLoading();
                        initializeAddToCart();
                        initializeAddToWishlist();

                        $('.product__pagination').html('<a href="javascript:void(0);" class="pagination-link active" data-page="1">1</a>');
                    },
                    error: function(xhr) {
                        console.error("Error during AJAX request: " + xhr.status + " " + xhr.statusText);
                    }
                });
            }
        }

        $('#sortSelect').on('change', applySort);
        $('#categorySelect').on('change', applySort);
        $('#productName').on('input', function() {
            searchByName(this);
        });
    });
</script>
<script>
    $(document).ready(function() {
        // Khởi tạo slider giá
        $(".price-range").slider({
            range: true,
            minamount: 10000,
            maxamount: 500000,
            values: [10000, 500000],
            slide: function(event, ui) {
                var minamount = ui.values[0]; // Lấy giá trị min từ slider
                var maxamount = ui.values[1]; // Lấy giá trị max từ slider
                $("#minamount").val(minamount); // Cập nhật giá trị min cho input hidden
                $("#maxamount").val(maxamount); // Cập nhật giá trị max cho input hidden
                // Lọc sản phẩm theo giá
                filterByPrice(minamount, maxamount);
            }
        });
        // Hàm lọc sản phẩm theo giá
        function filterByPrice(minamount, maxamount) {
            console.log("Lọc sản phẩm theo giá:", minamount, maxamount);
            // Gọi API để lọc sản phẩm
            $.ajax({
                url: "http://localhost:8080/FilterPrice",
                type: "GET",
                data: {
                    minamount: minamount.toString(), // Chuyển đổi min thành chuỗi
                    maxamount: maxamount.toString() // Chuyển đổi max thành chuỗi
                },
                success: function(data) {
                    // Cập nhật nội dung cho phần tử #row
                    $('#row').html(data);
                },
                error: function(xhr) {
                    // Xử lý lỗi nếu cần
                }
            });
        }
        // Lấy giá trị ban đầu của slider
        var minamount = $("#minamount").val();
        var maxamount = $("#maxamount").val();
        // Lọc sản phẩm theo giá ban đầu
        filterByPrice(minamount, maxamount);
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/darkreader@4.9.80/darkreader.min.js"></script>

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
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const currentPage = ${page}; // Lấy giá trị của trang hiện tại từ JSTL
        const links = document.querySelectorAll('.product__pagination a[data-page]');

        links.forEach(link => {
            if (parseInt(link.getAttribute('data-page')) === currentPage) {
                link.classList.add('active');
            }
        });
    });
</script>
<script src="https://cdn.botpress.cloud/webchat/v2/inject.js"></script>
<script src="https://mediafiles.botpress.cloud/1d0997ec-87ba-4ea8-8a5c-c2fba00d5019/webchat/v2/config.js"></script>
</body>
</html>