<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="util.FormatCurrency"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
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

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <link rel="stylesheet" src="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css">
    <style>
        .cart-btn, .primary-btn{
            border-radius: 15px;
            transition: transform 0.3s ease;
            background-color: #ffa97d;
        }

        .cart-btn:hover {
            background-color: #f86e21;
            color: white;
            transform: scale(1.1);
        }
        .primary-btn:hover{
            background-color: #f86e21;
            color: white;
            transform: scale(1.1);
        }
    </style>
</head>
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
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>


<jsp:include page="navbar.jsp"/>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/hinhnen.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Yêu thích</h2>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <c:choose>
                        <c:when test="${not empty wishlists}">
                            <table id="example" style="width: 1200px">
                                <thead>
                                <tr>
                                    <th class="shoping__product">Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="wish" items="${wishlists}">
                                    <tr>
                                        <td class="shoping__cart__item">
                                            <img src="/image/${wish.productid.image}" alt="" width="50px" height="70px">

                                            <h5>${wish.productid.product_name}</h5>
                                        </td>

                                        <td>
                                                ${wish.productid.price}
                                        </td>
                                        <td class="wishlist__item__close">
                                            <form action="RemoveItemWishList" method="post">
                                                <input type="hidden" name="itemId" value="${wish.itemId}">
                                                <button type="submit" class="icon_close" style="border: none; background-color: transparent;"></button>
                                            </form>
                                        </td>


                                    </tr>

                                </c:forEach>



                                </tbody>
                            </table>
                        </c:when>

                    </c:choose>
                </div>
            </div>
            <a href="Shopgrid" class="primary-btn cart-btn">Tiếp tục mua sắm</a>
        </div>

    </div>
</section>
<!-- Shoping Cart Section End -->

<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
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
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.nice-select.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/jquery.slicknav.js"></script>
<script src="/js/mixitup.min.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/main.js"></script>
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
</script>
// Set the initial button text and Font Awesome icon


// Enable Dark Reader when the page loads

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    $(document).ready(function() {
        var table = new DataTable('#example', {
            pagingType: 'simple_numbers'
        });
        table.rows().reverse();
    });

</script>
<script>
    $(document).ready(function () {
        $(document).on("submit", ".wishlist__item__close form", function (event) {
            event.preventDefault();
            let form = $(this);
            let itemId = form.find("input[name='itemId']").val();

            Swal.fire({
                title: 'Bạn có chắc muốn xóa khỏi danh sách yêu thích?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Xóa',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: form.attr("action"), // Thay thế với URL thực tế cho controller RemoveItemWishList
                        data: { itemId: itemId }, // Gửi itemId như là dữ liệu
                        success: function (data) {
                            // Xóa mục từ giao diện
                            form.closest("tr").remove();
                            var currentQuantity = parseInt($(".wishlist-item-count").text(), 10);
                            var newQuantity = currentQuantity - 1;
                            $(".wishlist-item-count").text(newQuantity);
                            Swal.fire({
                                icon: 'success',
                                title: 'Đã xóa sản phẩm khỏi danh sách yêu thích.',
                                showConfirmButton: false,
                                timer: 1500 // Tự động đóng sau 1.5 giây
                            });

                        },
                        error: function (error) {
                            console.error("Lỗi:", error);
                            Swal.fire({
                                icon: 'error',
                                title: 'Có lỗi xảy ra khi xóa sản phẩm khỏi danh sách yêu thích.',
                                showConfirmButton: true
                            });
                        }
                    });
                } else {
                    console.log("Đã hủy xóa");
                }
            });
        });
    });

</script>
<script src="https://cdn.botpress.cloud/webchat/v2/inject.js"></script>
<script src="https://mediafiles.botpress.cloud/1d0997ec-87ba-4ea8-8a5c-c2fba00d5019/webchat/v2/config.js"></script>

</body>

</html>