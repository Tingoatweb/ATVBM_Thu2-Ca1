<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false" %>
<%@ page import="util.FormatCurrency"%>
<!DOCTYPE html>


<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script defer src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <script defer src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css"/>
    <!-- Favicon -->

    <link rel="icon" type="image/x-icon" href="../assetsForAdmin/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />


    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assetsForAdmin/assets/vendor/js/helpers.js"></script>

    <script src="../assetsForAdmin/assets/js/config.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <link href="/css/style.css" media="screen" rel="stylesheet">
    <script type="text/javascript" src="/js/Chart.min.js"></script>
</head>
<style>
    #menu-icon{
        margin-left: 110px;

    }
    .bg-menu-theme #menu-icon-toggle{
        background-color: #696cff;
        border: 7px solid #f5f5f9;
        position: absolute;
        top: 28px;
        left: 230px;
        border-radius: 50%;
        z-index: 1;
        display: block !important;
    }
    #menu-icon-toggle i{
        width: 1.5rem;
        height: 1.5rem;
    }
    #menu-icon-toggle::before{
        color:white;
        content: "\ecb0";

    }
    aside#layout-menu.layout-menu.menu-vertical.menu.bg-menu-theme.close{
        width: 100px;
    }
    aside#layout-menu.layout-menu.menu-vertical.menu.bg-menu-theme.close .menu-item div, aside#layout-menu.layout-menu.menu-vertical.menu.bg-menu-theme.close .menu-sub div{
        opacity: 0;

    }
    .bg-menu-theme.close .menu-inner > .menu-item.active > .menu-link {

    }
    .menu-header-text{
        opacity: 0;
    }
    .bg-menu-theme.close .menu-header:before {
        display: none;
    }
    .bg-menu-theme.close .app-brand-text.demo.menu-text.fw-bolder.ms-2{
        display: none;
    }
    .bg-menu-theme.close{
        text-align: center;
        display: flex;
        justify-content: center;
        flex-direction: column;
    }
    .bg-menu-theme.close #menu-icon-toggle{
        background-color: #696cff;
        border: 7px solid #f5f5f9;
        position: absolute;
        top: 28px;
        left: 70px;
        border-radius: 50%;
        z-index: 1;
        display: block !important;
    }
    .bg-menu-theme.close #menu-icon-toggle{
        transform: rotate(180deg);

    }
    /*.bg-menu-theme.close .align-items-center.bg-navbar-theme{*/
    /*  padding-left: 100px;*/
    /*}*/
    .layout-navbar.container-xxl.navbar.navbar-expand-xl.navbar-detached.align-items-center.bg-navbar-theme.close{
        width:1212px;
        margin-left: -125px;
    }

    .content-wrapper.close{
        margin-left: -151px;
        width: 1263px;
    }
    /*.container-xxl.flex-grow-1.container-p-y .row.close .card-body{*/
    /*  !*margin-left: -10px;*!*/
    /*  !*width: 500px;*!*/
    /*}*/
    .fa-regular.fa-sun{
        font-size: 20px;

    }
    .fa-regular.fa-moon{
        font-size: 20px;

    }
    /*#content-wrapper{*/
    /*    width: 100%;*/
    /*}*/
    .card{
        width: 100%;
    }
    .sss{
        background-color: #f1f1f1;
    }
    .content{
        padding-top: 20px;

    }

    .fromOrder{
        margin-top: 20px;
        width: 100%;
        max-width: 1000px;
        /*background-color: white;*/
        /*box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.4);*/
        border-radius: 10px;
        /*padding: 10px;*/
        margin-left: 0;
    }
    @media (max-width: 900px) {
        .fromOrder {
            margin-left: 0; /* Bỏ margin-left khi màn hình nhỏ */
        }
    }
    .orderDetailProduct{
        display: flex;
        flex-direction: row;
    }
    .productDetail{
        display: flex;
        flex-direction: column;
        margin-left: 20px;
        width: 100%;
        justify-content: space-between;
    }
    .priceDetail{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    .tabLef{
        padding-top: 20px;

    }
    .totalOrder{
        color: #a71d2a;
        font-size: 22px;
        font-weight: bold;
    }
    .information span{
        font-weight: bold;
        color: black;
    }
    .information div{
        font-size: 18px;
        padding-bottom: 10px;
    }
    hr{
        border: 1px solid black;
    }
</style>
<body>

<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->
        <jsp:include page="menu.jsp"/>

        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->
            <jsp:include page="navbar.jsp"/>
            <!-- / Navbar -->
            <!-- Content wrapper -->
            <div class="content-wrapper" id="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y" id="content-big-section">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Đơn hàng /</span> Danh sách đơn hàng</h4>




                    <!-- Basic Bootstrap Table -->
                    <div class="card">
                        <section class="sss">
                            <div class="d-flex justify-content-center" style="padding-top: 30px">
                                <p style="font-size: 50px; font-weight: bold; color: black">Chi tiết đơn hàng</p>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-5 left-tab">
                                        <div class="tabLef">
                                            <div class="information">
                                                <h4 style="color: #a71d2a; font-weight: bold">Thông tin người nhận</h4>
                                                <hr>
                                                <div class="name"><span>Tên:</span> ${orderAdmin.nameConsignee}</div>
                                                <div><span>Địa chỉ:</span> ${orderAdmin.address}</div>
                                                <div><span>Sđt:</span> ${orderAdmin.phone}</div>
                                                <div><span>email:</span> ${orderAdmin.user.email}</div>
                                                <div><span>Note:</span> ${orderAdmin.note}</div>
                                                <div><span>Thanh toán bằng:</span> ${orderAdmin.payment.paymentName}</div>
                                                <div style="color: #ef8640; font-weight: bold"><span>Trạng thái:</span> ${orderAdmin.status.statusName} <i style="color: #ef8640" class="fa-solid fa-check"></i></div>
                                            </div>
                                            <hr>
                                            <div class="totalOrder">
                                                Tổng tiền: ${FormatCurrency.formatCurrency(orderAdmin.totalPrice)}
                                            </div>
                                            <hr>
                                        </div>

                                    </div>
                                    <div class="col-lg-7 ">
                                        <div class="order">
                                            <div class="content">
                                                <h3>Thông tin sản phẩm</h3>
                                                <c:forEach var="orderDetail" items="${orderDetailListAdmin}">
                                                    <div class="fromOrder">

                                                        <div class="orderDetailProduct">
                                                            <div class="img">
                                                                <img  width="80px" height="100px" src="/image/${orderDetail.product.image}" alt="">
                                                            </div>
                                                            <div class="productDetail">
                                                                <div class="productName">
                                                                    <h3>${orderDetail.product.product_name} <span style="font-size: 20px">x ${orderDetail.quantity}</span></h3>
                                                                </div>
                                                                <div class="category">
                                                                    <p style="font-size: 15px">Thể loại: ${orderDetail.product.category.categoryName}</p>
                                                                </div>
                                                                <div class="priceDetail" style="display: flex" >
                                                                    <div class="productPrice">
                                                                        <h4>${FormatCurrency.formatCurrency(orderDetail.product.price)}</h4>
                                                                    </div>
                                                                    <div class="productPriceTotal">
                                                                        <c:set var="total" value="${orderDetail.quantity * orderDetail.product.price}"/>
                                                                        <h4 style="color: #ce0f21; font-weight: bold">Tổng: ${FormatCurrency.formatCurrency(total)}</h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>
                    <!--/ Basic Bootstrap Table -->

                    <hr class="my-5" />

                    <!-- Bootstrap Dark Table -->

                    <!--/ Striped Rows -->


                </div>
                <!-- / Content -->

                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>
                            , made with ❤️ by
                            <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                        </div>
                        <div>
                            <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                            <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                            <a
                                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                                    target="_blank"
                                    class="footer-link me-4"
                            >Documentation</a
                            >

                            <a
                                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                                    target="_blank"
                                    class="footer-link me-4"
                            >Support</a
                            >
                        </div>
                    </div>
                </footer>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>
    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->

<div class="buy-now">
    <a
            href="Index"
            target="_blank"
            class="btn btn-danger btn-buy-now"
    >Quay lại trang shopping</a
    >
</div>

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->



<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assetsForAdmin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->
`
<script src="../assetsForAdmin/assets/js/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var toggle = document.getElementById("menu-icon-toggle");
        var sidebar = document.getElementById("layout-menu");
        var searchbar = document.getElementById("layout-navbar");
        var contentnew = document.getElementById("content-wrapper");
        // bigcontent = document.getElementById('content-big-section');

        toggle.addEventListener("click", function () {
            sidebar.classList.toggle("close");
            searchbar.classList.toggle("close");
            contentnew.classList.toggle("close");
            // bigcontent.classList.toggle("close");
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/darkreader@4.9.80/darkreader.min.js"></script>
<script src="${pageContext.request.contextPath}/js/Chart.min.js"></script>






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
    $(document).ready(function() {
        $('#example').DataTable();
    });


</script>
</body>
</html>
