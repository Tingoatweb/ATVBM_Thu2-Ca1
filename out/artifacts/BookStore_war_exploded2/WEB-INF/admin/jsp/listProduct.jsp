<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false" %>
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
    .fa-regular.fa-sun{
        font-size: 20px;

    }
    .fa-regular.fa-moon{
        font-size: 20px;

    }
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
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Tables /</span> List Product</h4>

                    <!-- Basic Bootstrap Table -->
                    <div class="card" id="cardresp">
                        <h5 class="card-header">List Product</h5>
                        <div class="table-responsive text-nowrap">
                            <form action="RemoveCheckProduct" method="POST">
                                <button type="submit" class="btn btn-primary me-2" onclick="return nocheck();">Xóa sản phẩm đã chọn</button>

                                <table class="table table-striped" id="tabledata" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>Mã sách</th>
                                        <th>Ảnh</th>
                                        <th>Tên sách</th>
                                        <th>Thể loại</th>
                                        <th>Giá nhập</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng trong kho</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0" id="productTableBody">
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th></th>
                                        <th>Mã sách</th>
                                        <th>Ảnh</th>
                                        <th>Tên sách</th>
                                        <th>Thể loại</th>
                                        <th>Giá nhập</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng trong kho</th>
                                        <th></th>
                                    </tr>
                                    </tfoot>
                                </table>

                            </form>
                            <button onclick="exportTableToExcel('tabledata', 'category_data')">Export Table Data To Excel File</button>

                        </div>

                        <br>
                    </div>


                    <!--/ Basic Bootstrap Table -->

                    <hr class="my-5" />

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
</div>

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assetsForAdmin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="../assetsForAdmin/assets/js/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<%--    1. Cache bộ nhớ trình duyệt (Client-side caching)--%>
<%--    Bạn có thể sử dụng cache của trình duyệt để lưu trữ các tài nguyên như tệp tin CSS, JavaScript, --%>
<%--    hình ảnh và các tài liệu HTML.--%>
<%--    Điều này giúp giảm thời gian tải trang cho người dùng khi họ quay lại trang web.--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
        integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
        crossorigin="anonymous"></script>

<%--    import thư viện lru-cache--%>
<script src="https://cdn.jsdelivr.net/npm/js-lru-cache@0.1.10/dist/lru-cache.min.js"></script>
<%--    định nghĩa hàm getDataFromCacheOrSource(id) trong phần --%>
<%--    . Hàm này sẽ kiểm tra xem dữ liệu đã được lưu trong cache hay chưa. Nếu đã có trong cache,--%>
<%--    nó sẽ trả về dữ liệu từ cache. Nếu chưa có, nó sẽ gọi fetchDataFromDatabase(id) để lấy dữ liệu từ --%>
<%--    nguồn và sau đó lưu vào cache trước khi trả về dữ liệu.--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<script>

    //import LRU from 'lru-cache';
    //const LRU = require('lru-cache');
    // Define LRU cache with max 100 items and 1 hour max age
    const cache = new LRUCache({ max: 1000, maxAge: 36000 * 1000 });

    // Function to retrieve data from cache or source
    async function getDataFromCacheOrSource() {
        const cacheKey = 'productList';
        const cachedData = cache.get(cacheKey);
        if (cachedData) {
            console.log('Data retrieved from cache');
            return cachedData;
        } else {
            console.log('Data retrieved from source');
            const data = await fetchDataFromDatabase();
            cache.set(cacheKey, data);
            return data;
        }
    }
    // Function to fetch data from database using AJAX
    function fetchDataFromDatabase() {
        return fetch('/GetListProduct') // Đường dẫn đến Servlet hoặc API của bạn
            .then(response => {
                if (!response.ok) {
                    throw new Error('Lỗi khi lấy dữ liệu từ cơ sở dữ liệu');
                }
                return response.json();
            })
            .then(data => {
                return data; // Trả về danh sách sản phẩm từ cơ sở dữ liệu dưới dạng mảng đối tượng
            });
    }

    // Function to display products in table
    function displayProductsInTable() {
        const tbody = document.getElementById('productTableBody');
        tbody.innerHTML = ''; // Xóa bất kỳ dữ liệu cũ nào trong tbody trước khi thêm dữ liệu mới

        // Gọi fetchDataFromDatabase() để lấy danh sách sản phẩm và hiển thị trong bảng
        getDataFromCacheOrSource()
            .then(products => {
                    products.forEach(product => {
                        console.log("product: " + product.productId)
                        const row = document.createElement('tr');
                        row.innerHTML =
                            '<td><input type="checkbox" name="selectedProducts" value="' + product.productId + '" /></td>'
                            + '<td id="id_product">' + product.productId + '</td>'
                            + '<td><img style="width: 50px; height: 50px" alt="" src="/image/' + product.image + '"></td>'
                            + '<td>' + product.product_name + '</td>'
                            + '<td>' + product.category.categoryName + '</td>'
                            + '<td>' + product.unitPrice + '</td>'
                            + '<td>' + product.price + '</td>'
                            + '<td>' + product.quantity + '</td>'
                            + '<td>'
                            + '<div class="dropdown">'
                            + '<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">'
                            + '<i class="bx bx-dots-vertical-rounded"></i>'
                            + '</button>'
                            + ' <div class="dropdown-menu">'
                            + '<a class="dropdown-item" href="./ProductDetail?id=' + product.productId + '">'
                            + '<i class="bx bx-edit-alt me-1"></i> Chi tiết'
                            + '</a>'
                            + '<a class="dropdown-item" href="./ChangeInformationProduct?id=' + product.productId + '">'
                            + '<i class="bx bx-edit-alt me-1"></i> Sửa'
                            + '</a>'
                            + '<a class="dropdown-item" href="" onclick="deleteItem(event)">'
                            + ' <i class="bx bx-trash me-1"></i> Xóa'
                            + '</a>'
                            + '</div>'
                            + '</div>'
                            + '</td>'
                        ;
                        tbody.appendChild(row);
                    });
                new DataTable('#tabledata');
                }
            )
            .catch(error => {
                console.error('Lỗi khi lấy dữ liệu từ cơ sở dữ liệu:', error);
            });
    }

    // Gọi function để hiển thị sản phẩm trong bảng khi trang được load
    displayProductsInTable();
</script>


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
    function exportTableToExcel(tableID, filename = ''){
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableSelect = document.getElementById(tableID);
        var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

        // Specify file name
        filename = filename?filename+'.xls':'excel_data.xls';

        // Create download link element
        downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if(navigator.msSaveOrOpenBlob){
            var blob = new Blob(['\ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob( blob, filename);
        }else{
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

            // Setting the file name
            downloadLink.download = filename;

            //triggering the function
            downloadLink.click();
        }
    }
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script>

    function deleteItem(event){
        var trElement = event.target.closest('tr');

        // Check if <tr> element is found
        if (!trElement) return;

        // Get the id_import attribute value from the <td> element inside the <tr>
        var idImport = trElement.querySelector('td[id="id_product"]').textContent;
        // var idImport=this.parentElement.getElementById('id_import');
        var confirmation = confirm("Bạn có chắc chắn muốn xóa không?");
        if(confirmation){
            $.ajax({
                url: "/DeleteProduct",
                type: "get",
                data:{id: idImport},
                success: function(response) {
                    // Handle success response
                    console.log("Item deleted successfully");
                    // Optionally, you can update the UI here
                    trElement.remove();
                },
                error: function(xhr, status, error) {
                    // Handle error response
                    console.error("Failed to delete item", error);
                }
            });
        }

    }
    function nocheck(){
        if(document.querySelectorAll('input[type="checkbox"]:checked').length ==0 ){
            alert("You haven't check");
            return false;
        }
    }
</script>
</body>
