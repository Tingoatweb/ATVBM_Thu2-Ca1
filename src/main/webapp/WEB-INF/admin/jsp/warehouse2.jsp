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
    <meta charset="UTF-8">
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script defer src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <script defer src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css"/>

    <link rel="icon" type="image/x-icon" href="../assetsForAdmin/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/css/demo.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assetsForAdmin/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assetsForAdmin/assets/js/config.js"></script>
    <style>
        .hide{
            display: none;
        }
        .table-responsive.text-nowrap {

        }
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

            /*background-color: rgba(105, 108, 255, 0.16) !important;*/
            /*color: black;*/
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
        .price-total {
            text-align: right;
            margin-bottom: 20px;
        }

        .price-total p {
            display: inline-block;
            margin: 0;
            padding: 15px 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            font-weight: bold;
        }

        .checkout__input {
            margin-bottom: 15px;
        }

        .checkout__input label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .price-total{
            font-weight: bold;
        }
        .btn-dathang{
            margin-left: auto;
            display: flex;
            justify-content: flex-end;
        }
        .datHang{
        border: none;
        background-color: #3377dc;
        border-radius: 10px;
        padding: 5px;
        font-weight: bold;
        font-size: 22px;
            transition: transform 0.3s ease;

        }
        .datHang:hover{
            background-color: #ffa97d;
            color: white;
            transform: scale(1.1);
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        .btn-light-purple {
            background-color: #e6e6fa;
            color: #000;
            border: 1px solid #dcdcdc;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-light-purple:hover {
            background-color: #d8bfd8;
            border-color: #d8bfd8;
        }

    </style>
</head>

<body>


<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <jsp:include page="menu.jsp"/>
        <div class="layout-page">
            <!-- Navbar -->

            <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar"
            >
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>
                <jsp:useBean id="productDAO" class="database.ProductDAO"></jsp:useBean>
                <c:set var="listProduct" value="${productDAO.selectAll()}" ></c:set>
                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <!-- Search -->
                    <div class="navbar-nav align-items-center">
                        <div class="nav-item d-flex align-items-center">
                            <i class="bx bx-search fs-4 lh-0"></i>
                            <input
                                    type="text"
                                    class="form-control border-0 shadow-none"
                                    placeholder="Search..."
                                    aria-label="Search..."
                                    name="search"
                                    oninput="search()"
                            />
                        </div>
                    </div>
                    <div id="searchResults" class="mt-4"></div>
                    <div id="searchResultsContainer"></div>
                    <!-- /Search -->



                    <ul class="navbar-nav flex-row align-items-center ms-auto">
                        <!-- Place this tag where you want the button to render. -->
                        <li class="nav-item lh-1 me-3">
                            <a
                                    class="github-button"
                                    href="https://github.com/themeselection/sneat-html-admin-template-free"
                                    data-icon="octicon-star"
                                    data-size="large"
                                    data-show-count="true"
                                    aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
                            >Star</a
                            >
                        </li>

                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-semibold d-block">John Doe</span>
                                                <small class="text-muted">Admin</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <i class="bx bx-user me-2"></i>
                                    <span class="align-middle">My Profile</span>
                                    </a>
                                </li>
                                <li>
                                    <i class="bx bx-cog me-2"></i>
                                    <span class="align-middle">Settings</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                          <span class="flex-grow-1 align-middle">Billing</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="auth-login-basic.html">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Log Out</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!--/ User -->
                    </ul>
                </div>
            </nav>

            <!-- / Navbar -->


            <div class="table-responsive text-nowrap">
                <table class="table table-striped" id="example2">
                    <thead>
                    <tr class="hide">
                        <th>Mã sách</th>
                        <th>Tên sách</th>
                        <th>Thể loại</th>
                        <th>Giá nhập</th>
                    </tr>
                    </thead>
                    <tbody class="list-product" id="listProductDOM" oninput="search()">
                    <jsp:useBean id="productDao" class="database.ProductDAO"></jsp:useBean>
                    <c:forEach var="product" items="${productDao.selectAll()}">
                        <tr class="hide">
                            <td name="productId" id="productId"><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong id="product_id">${product.productId}</strong></td>
                            <td>
                                <strong id="product_name"
                                        oninput="search()">${product.product_name}</strong>
                            </td>
                            <td id="categoryName">${product.category.categoryName}</td>
                            <td id="unitPrice"><span>${product.unitPrice}</span></td>

                            <td>
                                <button type="submit" class="btn btn-sm btn-outline-primary" onclick="add()">Thêm</button></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Content wrapper -->
            <div class="content-wrapper" id="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y" id="content-big-section">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Tables /</span> Basic Tables</h4>

                    <!-- Basic Bootstrap Table -->
                    <div class="card">
                        <h5 class="card-header">Table Basic</h5>

                        <div class="table-responsive text-nowrap" style="padding: 10px">
                            <%--              <form action="/ImportOrder" method="post">--%>

                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Mã SP</th>
                                    <th>Tên SP</th>
                                    <th>Số lượng</th>
                                    <th>Giá nhập</th>
                                    <th>Tổng tiền</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>

                                <tbody class="table-border-bottom-0">

                                </tbody>




                            </table>
<%--<<<<<<< HEAD--%>
<%--                                <div style="display: flex; flex-direction: row; justify-content: space-between; padding: 10px" >--%>
<%--                            <div class="checkout__input">--%>
<%--                                <label for="note">Ghi chú</label>--%>
<%--                                <input type="text" id="note" name="note" >--%>
<%--                            </div>--%>
<%--                            <div class="price-total">Tổng tiền: <span style="color: #a71d2a"></span></div>--%>
<%--                                </div>--%>
<%--                            <div class="btn-dathang">--%>
<%--                            <input class="datHang"  type="submit" value="Đặt mua" >--%>
<%--                            </div>--%>
<%--                            &lt;%&ndash;              </form>&ndash;%&gt;--%>
<%--=======--%>
                                <div class="price-total">
                                    <p style="text-align: right; font-weight: bold; padding: 15px 20px;">
                                        Tổng tiền: <span></span><sup>đ</sup>
                                    </p>
                                </div>

                                <div class="checkout__input">
                                    <label for="ncc">Nhà cung cấp</label>
                                    <input type="text" id="ncc" name="ncc" class="form-control">
                                </div>

                                <div class="checkout__input">
                                    <label for="note">Ghi chú</label>
                                    <input type="text" id="note" name="note" class="form-control">
                                </div>

                                <input type="submit" value="Complete Order" class="btn btn-primary btn-light-purple">

                        </div>

                    </div>


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

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->

<script>
    function collectDataFromTable() {
        var data = [];
        var rows = document.querySelectorAll('tbody.table-border-bottom-0 tr');
        var note = document.getElementById('note').value;
        if (note === null || note === "") note = " ";

        var ncc = document.getElementById('ncc').value;
        if (ncc === null || ncc === "") ncc = " ";

        rows.forEach(function(row) {
            var productId = row.querySelector('p[name="productId"]').innerText;
            var productName = row.querySelector('.titleProduct').innerText;
            var numberOfWarehouses = row.querySelector('input[name="numberOfWarehouses"]').value;
            var unitPrice = row.querySelector('input[name="unitPrice"]').value;
            var totalPrice = row.querySelector('input[name="totalPrice"]').value;

            var item = {
                productId: productId,
                productName: productName,
                numberOfWarehouses: numberOfWarehouses,
                unitPrice: unitPrice,
                totalPrice: totalPrice,
                note: note,
                ncc: ncc
            };

            // var item = productId+"-"+ productName + "-" + numberOfWarehouses + "-" + unitPrice + "-" + totalPrice  + "-" + note;

            data.push(item);
        });

        // return data.join(',');
        return data;
    }
    document.querySelector('input[type="submit"]').addEventListener('click', function(event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của nút submit

        var tableRows = document.querySelectorAll('tbody.table-border-bottom-0 tr');

        // Kiểm tra nếu không có dòng nào trong bảng
        if (tableRows.length === 0) {
            alert("Vui lòng nhập sản phẩm vào bảng trước khi hoàn tất đơn hàng!");
            return; // Dừng lại và không tiếp tục thực hiện request
        }
        var data = collectDataFromTable();

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/CompleteOrderServlet2', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Hiển thị thông báo nhập hàng thành công
                    alert("Nhập hàng thành công!");

                    // Làm mới trang sau một khoảng thời gian ngắn
                    setTimeout(function() {
                        window.location.reload(); // Làm mới trang sau 1 giây
                    }, 1000); // 1000 milliseconds = 1 giây
                } else {
                    console.error('Error:', xhr.statusText);
                }
            }
        };
        xhr.send(JSON.stringify(data));
    });

    function add() {
        const btns = document.querySelectorAll('button'); // Lựa chọn tất cả các button có class là btn-outline-primary
        btns.forEach(function (button, index) {
            button.addEventListener("click", function (event) {
                var productId = this.parentElement.parentElement.querySelector("strong#product_id").innerText; // Lấy productId từ ô strong trong hàng chứa button được click
                var productName = this.parentElement.parentElement.querySelector("strong#product_name").textContent; // Lấy tên sản phẩm từ input có name là product_name trong hàng chứa button được click
                var unitPrice = this.parentElement.parentElement.querySelector("span").innerText; // Lấy giá nhập từ thẻ span trong hàng chứa button được click
                addTable(productId, productName, unitPrice)
                console.log("đã thêm sp")
                cartTotal();
            });
        });

    }

    function addTable(productId, productName, unitPrice) {
        var addtr = document.createElement("tr");
        var cartItem = document.querySelectorAll("tbody.table-border-bottom-0 tr ");
        var productNames = document.querySelectorAll(".titleProduct");

        for (var i = 0; i < productNames.length; i++) {
            if (productNames[i].textContent === productName) {
                alert("Sản phẩm của bạn đã có trong giỏ hàng");
                return;
            }
        }

        addtr.innerHTML = '<td><p name="productId" id="productId" class="form-control form-control-sm">' + productId + '</p></td>' +
            '<td><span name="product_name" class="titleProduct">' + productName + '</span></td>' +
            '<td><input name="numberOfWarehouses" id="numberOfWarehouses" type="number" class="input-value form-control form-control-sm" value="1" min="1" onclick="inputchange()" oninput="calculateTotal()" ></td>' +
            '<td><input name="unitPrice" type="number" class="input-value form-control form-control-sm"  onclick="inputchange()" oninput="calculateTotal()" value="' + unitPrice + '"></td>' +
            '<td><input name="totalPrice" type="number" id="totalPrice" value="0" class="total-price form-control form-control-sm" readonly></td>' +
            '<td><button type="button" class="btn btn-sm btn-outline-primary"><span class="cart-delete">Xóa</span></button></td>';


        var cartTable = document.querySelector("tbody.table-border-bottom-0");
        cartTable.appendChild(addtr);

        deleteCart();
        // calculateTotal();
    }
    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number);
    }

    function cartTotal() {
        var cartItem = document.querySelectorAll("tbody.table-border-bottom-0 tr");
        var totalAll = 0;

        cartItem.forEach(function(row) {
            var numberOfWarehouses = parseFloat(row.querySelector('input[name="numberOfWarehouses"]').value);
            var unitPrice = parseFloat(row.querySelector('input[name="unitPrice"]').value);
            var totalPrice = numberOfWarehouses * unitPrice;
            totalAll += totalPrice;
        });

        var cartTotalA = document.querySelector(".price-total span");
        cartTotalA.innerHTML = formatCurrency(totalAll);
    }


    //-------------------------delete cart-------------------------
    function deleteCart() {
        var cartItem = document.querySelectorAll("tbody.table-border-bottom-0 tr ");
        for (var i=0; i<cartItem.length; i++){
            var productT= document.querySelectorAll(".cart-delete")
            productT[i].addEventListener("click", function (even){
                var cartDelete = even.target
                var cartItemR = cartDelete.parentElement.parentElement.parentElement
                cartItemR.remove()
                cartTotal();
            })

            // console.log(productT)
        }

    }

    //thay doi so luong thi gia tien cung thay doi theo
    function inputchange(){
        var cartItem = document.querySelectorAll("tbody.table-border-bottom-0 tr ");
        for (var i=0; i<cartItem.length; i++){
            var inputValue= document.querySelectorAll(".input-value")
            inputValue[i].addEventListener("change", function (){
                cartTotal();
            })

            // console.log(productT)
        }
    }

    function calculateTotal() {
        var cartItems = document.querySelectorAll("tbody.table-border-bottom-0 tr");
        cartItems.forEach(function(row) {
            var numberOfWarehouses = parseFloat(row.querySelector('input[name="numberOfWarehouses"]').value);
            var unitPrice = parseFloat(row.querySelector('input[name="unitPrice"]').value);
            var totalPrice = numberOfWarehouses * unitPrice;
            row.querySelector('input[name="totalPrice"]').value = totalPrice.toFixed(2);
            cartTotal();
        });

    }


</script>
<script>

    function search() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/GetListProduct', true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var products = JSON.parse(xhr.responseText);
                    filterProducts(products);
                } else {
                    console.error('Error fetching products:', xhr.statusText);
                }
            }
        };
        xhr.send();
    }

    function filterProducts(products) {
        var searchInput = document.querySelector('input[name="search"]').value.trim().toLowerCase();
        if(searchInput===""){
            searchInput="@#$%^"
        }

        var listProductDOM = document.getElementById('listProductDOM');
        var searchResultsContainer = document.getElementById('searchResultsContainer'); // Thêm dòng này

        var rows = listProductDOM.getElementsByTagName('tr');
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            // var productName = row.querySelector('input[name="product_name"]').value.trim().toLowerCase();
            var productName = row.querySelector('strong#product_name').textContent.trim().toLowerCase();
            // console.error(productName+ "....prdn");
            if (productName.includes(searchInput)) { // Sử dụng includes() để kiểm tra chuỗi con
                row.classList.remove('hide');
            } else {
                row.classList.add('hide');
            }
        }
    }



</script>
<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assetsForAdmin/assets/vendor/js/menu.js"></script>
<%--<script src="../assetsForAdmin/assets/vendor/js/script.js"></script>--%>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
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
</body>
</html>