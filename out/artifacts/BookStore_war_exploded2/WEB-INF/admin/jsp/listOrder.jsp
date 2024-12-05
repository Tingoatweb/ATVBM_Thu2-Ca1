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
    a:hover{
        color: black;
    }
    /*#content-wrapper{*/
    /*    width: 100%;*/
    /*}*/
.card{
    width: 100%;
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
                        <jsp:useBean id="orderDAO" class="database.OrderDAO"/>
                        <div class="col-xl-12">
                            <div class="nav-align-top mb-4">
                                <ul class="nav nav-tabs nav-fill" role="tablist">
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link active"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-justified-home"
                                                aria-controls="navs-justified-home"
                                                aria-selected="true"
                                        >
                                            <i class="tf-icons bx bx-home"></i> Cần xác nhận
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-danger">3</span>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-dong-goi"
                                                aria-controls="navs-dong-goi"
                                                aria-selected="false"
                                        >
                                            <i class="tf-icons bx bx-box"></i> Đóng gói
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-danger">3</span>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-dang-giao"
                                                aria-controls="navs-dang-giao"
                                                aria-selected="false"
                                        >
                                            <i class="tf-icons bx bx-truck"></i> Đang giao
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-danger">3</span>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-giao-success"
                                                aria-controls="navs-giao-success"
                                                aria-selected="false"
                                        >
                                            <i class="tf-icons bx bx-check-circle"></i> Giao thành công
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-success">3</span>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-yeu-cau-huy"
                                                aria-controls="navs-yeu-cau-huy"
                                                aria-selected="false"
                                        >
                                            <i class="tf-icons bx bx-refresh"></i> Yêu cầu hủy
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-info">3</span>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-da-huy"
                                                aria-controls="navs-da-huy"
                                                aria-selected="false"
                                        >
                                            <i class="tf-icons bx bx-x-circle"></i> Đã hủy
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-warning">3</span>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-yeu-cau-hoan"
                                                aria-controls="navs-yeu-cau-hoan"
                                                aria-selected="false"
                                        >
                                            <i class="tf-icons bx bx-x-circle"></i> Yêu cầu hoàn
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-warning">3</span>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-da-hoan"
                                                aria-controls="navs-da-hoan"
                                                aria-selected="false"
                                        >
                                            <i class="tf-icons bx bx-x-circle"></i> Đã hoàn
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-warning">3</span>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button
                                                type="button"
                                                class="nav-link"
                                                role="tab"
                                                data-bs-toggle="tab"
                                                data-bs-target="#navs-thanh-cong"
                                                aria-controls="navs-thanh-cong"
                                                aria-selected="false"
                                        >
                                            <i class="tf-icons bx bx-x-circle"></i> Thành công
                                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-warning">3</span>
                                        </button>
                                    </li>
                                </ul>

                                <!-- Tab content -->
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="navs-justified-home" role="tabpanel" aria-labelledby="navs-justified-home-tab">
                                        <h5 class="card-header">Danh sách đơn hàng giao thành công  </h5>
                                        <div class="table-responsive text-nowrap">
                                            <table id="example1" class="table table-striped" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Mã User</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái</th>
                                                    <th>Actions</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                                <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Mã User</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái</th>
                                                    <th>Actions</th>
                                                    <th></th>
                                                </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="navs-dong-goi" role="tabpanel" aria-labelledby="navs-dong-goi-tab">
                                        <table id="example2" class="table table-striped" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th>Actions</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th>Actions</th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="navs-dang-giao" role="tabpanel" aria-labelledby="navs-dang-giao-tab">
                                        <table id="example3" class="table table-striped" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="navs-giao-success" role="tabpanel" aria-labelledby="navs-giao-success-tab">
                                        <table id="example4" class="table table-striped" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="navs-yeu-cau-huy" role="tabpanel" aria-labelledby="navs-yeu-cau-huy-tab">
                                        <table id="example5" class="table table-striped" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th>Actions</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th>Actions</th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="navs-da-huy" role="tabpanel" aria-labelledby="navs-da-huy-tab">
                                        <table id="example6" class="table table-striped" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="navs-yeu-cau-hoan" role="tabpanel" aria-labelledby="navs-yeu-cau-hoan-tab">
                                        <table id="example7" class="table table-striped" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th>Actions</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th>Actions</th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="navs-da-hoan" role="tabpanel" aria-labelledby="navs-da-hoan-tab">
                                        <table id="example8" class="table table-striped" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade" id="navs-thanh-cong" role="tabpanel" aria-labelledby="navs-thanh-cong-tab">
                                        <table id="example9" class="table table-striped" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã User</th>
                                                <th>Ngày đặt</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>

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
<script>
    $(document).ready(function() {
        const tables = [
            { id: '#example1', status: 1 },
            { id: '#example2', status: 2 },
            { id: '#example3', status: 3 },
            { id: '#example4', status: 4 },
            { id: '#example5', status: 5 },
            { id: '#example6', status: 6 },
            { id: '#example7', status: 7 },
            { id: '#example8', status: 8 },
            { id: '#example9', status: 10 }
            // Add other tables here with their respective status
        ];

        tables.forEach(function(table) {
            $(table.id).DataTable({
                "ajax": {
                    "url": "OrderController?status=" + table.status,
                    "type": "GET",
                    "dataSrc": "",
                    "error": function(xhr, error, code) {
                        console.log("Error fetching data for table: ", table.id);
                        console.log("XHR: ", xhr);
                        console.log("Error: ", error);
                        console.log("Code: ", code);
                    }

                },
                "columns": [
                    { "data": "orderId" },
                    { "data": "user.userId" },
                    { "data": "bookingDate" },
                    {
                        "data": "status.statusName",
                        "render": function (data, type, row) {
                            return '<div>' + data + '</div>'; // Thêm thẻ div vào đây
                        }
                    },
                    {
                        "data": "orderId",
                        "render": function(data, type, row) {
                            let buttons = '';
                            if ([1, 5, 7].includes(table.status)) {
                                buttons = '<button type="button" class="btn btn-primary" onclick="confirmOrder(' + data + ', ' + row.status.statusId + ')">Chấp nhận</button>' +
                                    '<button type="button" class="btn btn-danger" onclick="rejectOrder(' + data + ', ' + row.status.statusId + ')">Từ chối</button>';
                            } else if (table.status === 2) {
                                buttons = '<button type="button" class="btn btn-success" onclick="confirmOrder(' + data + ', ' + row.status.statusId + ')">Đóng gói xong</button>';
                            }
                            return buttons;

                        }
                    },
                    {
                        "data": "orderId",
                        "render": function(data, type, row) {
                            return '<a href="/OrderDetails?order_Id=' + data + '">chi tiết</a>';
                        }
                    }
                ]
            });
        });
    });

    function confirmOrder(orderId, currentStatus) {
        let newStatus;

        // Update the switch statement to handle all possible cases
        switch (currentStatus) {
            case 1: newStatus = 2; break;
            case 2: newStatus = 3; break;
            case 5: newStatus = 6; break;
            case 7: newStatus = 8; break;
            default: newStatus = currentStatus;
        }
        console.log("Sending request to change order status:");
        console.log("orderId:", orderId);
        console.log("newStatus:", newStatus);
        $.ajax({
            type: "POST",
            url: "/ChangeStatusOrder",
            data: { orderId: orderId, status: newStatus },
            success: function(response) {
                reloadAllTables();
            },
            error: function(xhr, status, error) {
                console.error("Error occurred while changing status:", error);
                console.error("Response text:", xhr.responseText);
            }
        });
    }
    function rejectOrder(orderId, currentStatus) {
        let newStatus;
        switch (currentStatus) {
            case 5: newStatus = 2; break;
            case 7: newStatus = 10; break;
            default: newStatus = currentStatus;
        }
        $.ajax({
            type: "POST",
            url: "/ChangeStatusOrder",
            data: { orderId: orderId, status: newStatus },
            success: function(response) {
                reloadAllTables();
            },
            error: function(xhr, status, error) {
                console.error("Error occurred while changing status:", error);
                console.error("Response text:", xhr.responseText);
            }
        });
    }
    function reloadAllTables() {
        $('#example1').DataTable().ajax.reload();
        $('#example2').DataTable().ajax.reload();
        $('#example3').DataTable().ajax.reload();
        $('#example4').DataTable().ajax.reload();
        $('#example5').DataTable().ajax.reload();
        $('#example6').DataTable().ajax.reload();
        $('#example7').DataTable().ajax.reload();
        $('#example8').DataTable().ajax.reload();
        $('#example9').DataTable().ajax.reload();
    }

</script>

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
    // new DataTable('#example');
    // new DataTable('#example1');
    // new DataTable('#example2');
    // $(document).ready(function() {
    //     // Gắn sự kiện click ban đầu
    //     attachClickEvent();
    //
    //
    // });

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
    $(document).ready(function() {
        $('#example').DataTable();
    });


</script>
</body>
</html>
