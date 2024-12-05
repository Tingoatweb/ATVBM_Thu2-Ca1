<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="util.FormatCurrency"%>
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
    <%--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
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
        .product__item{
            background-color: rgba(245,245,245);
            height: 350px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
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
            bottom: -50px;
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
            bottom: -100px;
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
    </style>
</head>

<body>
<!-- Page Preloder -->



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
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Department</h4>
                        <ul>
                            <c:forEach var="ca" items="${list}">
                                <li><a href="FilterCategory?caname=${ca.categoryName}" data-category-name="${ca.categoryName}" class="category-link">${ca.categoryName}</a></li>
                            </c:forEach>
                        </ul>
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
                    <div class="sidebar__item sidebar__item__color--option">
                        <h4>Colors</h4>
                        <div class="sidebar__item__color sidebar__item__color--white">
                            <label for="white">
                                White
                                <input type="radio" id="white">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--gray">
                            <label for="gray">
                                Gray
                                <input type="radio" id="gray">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--red">
                            <label for="red">
                                Red
                                <input type="radio" id="red">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--black">
                            <label for="black">
                                Black
                                <input type="radio" id="black">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--blue">
                            <label for="blue">
                                Blue
                                <input type="radio" id="blue">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--green">
                            <label for="green">
                                Green
                                <input type="radio" id="green">
                            </label>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <h4>Popular Size</h4>
                        <div class="sidebar__item__size">
                            <label for="large">
                                Large
                                <input type="radio" id="large">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="medium">
                                Medium
                                <input type="radio" id="medium">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="small">
                                Small
                                <input type="radio" id="small">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="tiny">
                                Tiny
                                <input type="radio" id="tiny">
                            </label>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Latest Products</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="img/latest-product/lp-1.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>$30.00</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="img/latest-product/lp-2.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>$30.00</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="img/latest-product/lp-3.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>$30.00</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="img/latest-product/lp-1.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>$30.00</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="img/latest-product/lp-2.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>$30.00</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="img/latest-product/lp-3.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Crab Pool Security</h6>
                                            <span>$30.00</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7" >
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Sale Off</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="img/product/discount/pd-1.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Dried Fruit</span>
                                        <h5><a href="#">Raisin’n’nuts</a></h5>
                                        <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="img/product/discount/pd-2.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Vegetables</span>
                                        <h5><a href="#">Vegetables’package</a></h5>
                                        <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="img/product/discount/pd-3.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Dried Fruit</span>
                                        <h5><a href="#">Mixed Fruitss</a></h5>
                                        <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="img/product/discount/pd-4.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Dried Fruit</span>
                                        <h5><a href="#">Raisin’n’nuts</a></h5>
                                        <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="img/product/discount/pd-5.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Dried Fruit</span>
                                        <h5><a href="#">Raisin’n’nuts</a></h5>
                                        <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="img/product/discount/pd-6.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Dried Fruit</span>
                                        <h5><a href="#">Raisin’n’nuts</a></h5>
                                        <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sort By</span>
                                <select>
                                    <option value="0">Default</option>
                                    <option value="0">Default</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>16</span> Products found</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row" id="row" >
                    <c:forEach var="p" items="${listProduct}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" > <!--data-setbg=""-->
                                    <img src="img/image/${p.image}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="Shopdetails?id=${p.productId}"><i class="fa fa-info-circle"></i></a></li>
                                        <li>
                                            <form class="add-to-cart-form" action="AddToCart" method="post" id="addToCartForm">
                                                <input type="hidden" name="productId" value="${p.productId}">
                                                <button class="submit-button" type="submit">
                                                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                </button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${p.product_name}</a></h6>
                                    <ul class="Ratestar">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li class="Stick"></li>
                                        <li class="Productnotsell">Còn lại 5</li>

                                    </ul>
                                    <h5>${FormatCurrency.formatCurrency(p.price)}</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <c:set var="currentPage" value="${sessionScope.page}" />
                <c:set var="totalPages" value="${sessionScope.num}" />

                <div class="product__pagination" style="padding-left: 300px">
                    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                        <c:set var="pageUrl" value="/FilterCategory?page=${pageNumber}&caname=${param.caname}" />
                        <a href="${pageUrl}" <c:if test="${pageNumber == currentPage}">class="active"</c:if>>${pageNumber}</a>
                    </c:forEach>
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


</body>
<script>
    // $(document).ready(function() {
    //
    //
    //     // Khi người dùng gõ từ vào ô input
    //
    //
    //     // Khi người dùng gõ từ vào ô input
    //     $('#productName').on('input', function () {
    //         searchByName(this);
    //     });
    //
    //
    //     function searchByName(param) {
    //         var txtSearch = $(param).val(); // Sử dụng jQuery để lấy giá trị của ô input
    //         console.log("Đang tìm kiếm theo tên: " + txtSearch); // In ra thông điệp trước khi gửi request
    //
    //         $.ajax({
    //             url: "http://localhost:8080/SearchByAjax", // Sửa đường dẫn thành SearchByAjax
    //             type: "GET", // Sửa thành GET để gửi thông tin qua phương thức GET
    //             data: {
    //                 productName: txtSearch
    //             },
    //             success: function (data) {
    //                 $('#row').html(data);
    //                 $('#newpage').html(data);// Sử dụng jQuery để thay đổi nội dung của phần tử có id là 'row'
    //             },
    //             error: function (xhr) {
    //                 // Xử lý lỗi nếu cần
    //             }
    //         });
    //     }


    // var min = $("#minamount").val();
    // var max = $("#maxamount").val();
    // alert(minamount + maxamount);


    // var priceSlider = $(".price-range-wrap").slider({
    //     range: true,
    //     min: 10000,
    //     max: 500000,
    //     values: [10000, 500000],
    //     slide: function (event, ui) {
    //         var min = $("#minamount").val(ui.values[0]);
    //         var max = $("#maxamount").val(ui.values[1]);
    //         // filterByPrice(ui.values[0], ui.values[1]);
    //         // console.log("Giá trị mới của minamount:", ui.values[0]);
    //         // console.log("Giá trị mới của maxamount:", ui.values[1]);// Sử dụng giá trị mới của min và max khi slider được di chuyển
    //         $.ajax({
    //             url: "http://localhost:8080/FilterPrice",
    //             type: "GET",
    //             data: {
    //                 min: min,
    //                 max: max
    //             },
    //             success: function (data) {
    //                 $('#row').html(data);
    //             },
    //             error: function (xhr) {
    //                 // Xử lý lỗi nếu cần
    //             }
    //
    //
    //         });
    //
    //     }
    // });
    // });
</script>
<script>
    // $(document).ready(function() {
    //     $(document).ready(function() {
    //
    //         // Select all category links
    //         var categoryLinks = $('.category-link');
    //
    //         // Attach click event handler to each link
    //         categoryLinks.click(function(event) {
    //             event.preventDefault(); // Prevent default form submission
    //
    //             // Get the category name from the data attribute
    //             var categoryName = $(this).data('categoryName');
    //
    //             // Build the Ajax request URL
    //             var url = "http://localhost:8080/FilterCategory?caname=" + categoryName;
    //
    //             $.ajax({
    //                 url: url,
    //                 type: "GET",
    //                 success: function(data) {
    //                     // Replace content of the "products" element with the received data
    //                     $('#row').html(data);
    //                 },
    //                 error: function(xhr) {
    //                     console.error("Error fetching products:", xhr);
    //                     // Handle errors appropriately, e.g., display an error message
    //                 }
    //             });
    //         });
    //     });
    // });
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
</html>