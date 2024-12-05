<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="util.FormatCurrency"%>
<%@page isELIgnored="false" %>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>
    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assetsForAdmin/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700&display=swap" rel="stylesheet" />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"/>

    <!-- Custom Styles -->
    <style>
        /* Add any custom styles here */
        .product__pagination a {
            margin: 0 5px;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            color: #000;
        }

        .product__pagination a.active {
            background-color: #696cff;
            color: #fff;
        }
    </style>
</head>

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
                    <h4 class="fw-bold py-3 mb-4">
                        <span class="text-muted fw-light">Tables /</span> List Product
                    </h4>

                    <!-- Basic Bootstrap Table -->
                    <div class="card" id="card-resp">
                        <h5 class="card-header">Danh sách sản phẩm đổi giá nhập</h5>
                        <div class="table-responsive text-nowrap">
                            <form action="DeleteProductChangePrice" method="POST">
                                <button type="submit" class="btn btn-primary me-2" onclick="return nocheck();">Xóa mục đã chọn</button>
                                <table class="table table-striped" id="example" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>Mã sách</th>
                                        <th>Ảnh</th>
                                        <th>Tên sách</th>
                                        <th>Giá cũ</th>
                                        <th>Giá mới</th>
                                        <th>Ngày đổi</th>
                                        <th>Người đổi</th>
                                        <th>Lựa chọn</th>
                                    </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0">
                                    <jsp:useBean id="changePriceDao" class="database.ChangePriceDAO"></jsp:useBean>
                                    <c:forEach var="changePrice" items="${changePriceDao.selectAll()}">
                                        <c:set var="user" value="${changePrice.getUser()}" />
                                        <c:set var="product" value="${changePrice.getProductId()}" />
                                        <tr>
                                            <td><input type="checkbox" name="selectedItem" value="${changePrice.getStt()}" /></td>
                                            <td>${product.productId}</td>
                                            <td><img style="width: 50px; height: 50px" alt="" src="/image/${product.image}"></td>
                                            <td>${product.product_name}</td>
                                            <td>${changePrice.oldPrice}</td>
                                            <td>${changePrice.newPrice}</td>
                                            <td>${changePrice.date}</td>
                                            <td>${user.username}</td>
                                            <td>
                                                <div class="dropdown">
                                                    <a class="btn btn-secondary" href="./ProductDetail?id=${product.productId}">ĐỔI GIÁ</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                    <hr class="my-5" />
                    <!-- / Content -->

                    <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                                © <script>document.write(new Date().getFullYear());</script>, made with ❤️ by
                                <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                            </div>
                            <div>
                                <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                                <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>
                                <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>
                                <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
                            </div>
                        </div>
                    </footer>
                    <!-- / Footer -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- / Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>
        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout container -->

    <div class="buy-now">
        <a href="Index" target="_blank" class="btn btn-danger btn-buy-now">Quay lại trang shopping</a>
    </div>
</div>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- DataTables JS -->
<script type="text/javascript" charset="UTF-8" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.min.js"></script>

<!-- Perfect Scrollbar JS -->
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<!-- Main JS -->
<script src="../assetsForAdmin/assets/vendor/js/menu.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<!-- Initialize DataTables -->
<script>
    $(document).ready(function () {
        $('#example').DataTable({
            paging: true, // Cho phép phân trang
            lengthMenu: [5, 10, 20, 50], // Số lượng bản ghi trên mỗi trang
            pageLength: 10, // Số lượng bản ghi mặc định trên mỗi trang
            ordering: true, // Cho phép sắp xếp
            searching: true // Cho phép tìm kiếm
        });
    });
</script>

<!-- Custom JS -->
<script>
    // Thêm bất kỳ mã JavaScript tùy chỉnh nào ở đây
</script>
</body>
</html>
