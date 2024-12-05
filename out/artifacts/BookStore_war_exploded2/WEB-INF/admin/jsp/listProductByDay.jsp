<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.min.css"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

    <!-- Custom Styles -->
    <style>
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
        .small-date-input {
            width: 150px; /* Điều chỉnh chiều rộng của input */
            padding: 5px; /* Điều chỉnh khoảng cách bên trong của input */
            font-size: 14px; /* Điều chỉnh kích thước chữ của input */
            background-color: #696cff; /* Màu tím nhạt */
            color: #fff; /* Màu chữ trắng */
            border: 1px solid #d3a6ff; /* Màu viền phù hợp */
            border-radius: 5px; /* Bo góc cho input */
            margin-left: 10px;
        }
        .small-date-input::placeholder {
            color: #fff; /* Màu chữ placeholder trắng */
        }
        .light-purple-header th {
            background-color: #e0b0ff; /* Màu tím nhạt */
            color: white; /* Màu chữ trắng */
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
                    <!-- Basic Bootstrap Table -->
                    <div class="card" id="card-resp">
                        <h5 class="card-header">Danh sách sản phẩm bán được theo ngày</h5>

                        <div class="table-responsive text-nowrap" style="margin: 10px">
                            <div class="row">
                                <label class="col-sm-2 form-label">Chọn ngày</label>
                                <input name="ngay0" type="date" id="ngay0" required="required" class="small-date-input">
                            </div>
                            <table class="table table-striped" id="example" style="width:80%; margin-left: 100px; border: #1b1e21">
                                <thead class="light-purple-header">
                                <tr>
                                    <th>Mã sách</th>
                                    <th>Tên sách</th>
                                    <th>Ảnh</th>
                                    <th>Giá bán</th>
                                    <th>Số lượng</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0" id="product-data">
                                </tbody>
                            </table>
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

        <div class="layout-overlay layout-menu-toggle"></div>
    </div>

    <div class="buy-now">
        <a href="Index" target="_blank" class="btn btn-danger btn-buy-now">Quay lại trang shopping</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>

<script>
    // Lấy ngày hôm nay theo định dạng YYYY-MM-DD
    const today = new Date().toISOString().split('T')[0];
    // Đặt giá trị mặc định của input là ngày hôm nay
    document.getElementById('ngay0').value = today;
</script>

<script>
    // Thiết lập giá trị mặc định là ngày hôm nay
    document.addEventListener('DOMContentLoaded', function() {
        var today = new Date().toISOString().split('T')[0];
        var ngayInput = document.getElementById('ngay0');
        ngayInput.value = today;
        ngayInput.max = today;// Giới hạn ngày tối đa là ngày hôm nay
        fetchData(today)
    });

    $(document).ready(function () {
        $('#example').DataTable({
            paging: true, // Cho phép phân trang
            lengthMenu: [5, 10, 20, 50], // Số lượng bản ghi trên mỗi trang
            pageLength: 10, // Số lượng bản ghi mặc định trên mỗi trang
            ordering: true, // Cho phép sắp xếp
            searching: true // Cho phép tìm kiếm
        });
    });

    // Lắng nghe sự kiện thay đổi của input ngày
    document.getElementById('ngay0').addEventListener('change', function() {
        var selectedDate = this.value;
        // Gửi yêu cầu AJAX để lấy dữ liệu mới dựa trên ngày đã chọn
        fetchData(selectedDate);
    });


    // Hàm để lấy dữ liệu qua AJAX
    function fetchData(date) {
        $.ajax({
            url: 'ListProductByDay2',
            method: 'GET',
            data: { ngay: date },
            dataType: 'json',
            success: function(response) {
                console.log(response);
                var tbody = document.getElementById('product-data');
                tbody.innerHTML = '';

                response.forEach(function (item) {
                    var tr = document.createElement('tr');

                    var productIdTd = document.createElement('td');
                    var productLink = document.createElement('a');
                    productLink.setAttribute('href', 'ProductDetail?id=' + item.productId);
                    productLink.textContent = item.productId;
                    productIdTd.appendChild(productLink);

                    var productNameTd = document.createElement('td');
                    productNameTd.textContent = item.productName;

                    var imageTd = document.createElement('td');
                    var img = document.createElement('img');
                    img.setAttribute('src', item.image);
                    img.setAttribute('alt', item.productName);
                    img.style.width = '50px';
                    img.style.height = '50px';
                    imageTd.appendChild(img);

                    var priceTd = document.createElement('td');
                    priceTd.textContent = item.price;

                    var quantityTd = document.createElement('td');
                    quantityTd.textContent = item.quantity;

                    tr.appendChild(productIdTd);
                    tr.appendChild(productNameTd);
                    tr.appendChild(imageTd);
                    tr.appendChild(priceTd);
                    tr.appendChild(quantityTd);

                    tbody.appendChild(tr);
                });
            }
        });
    }
</script>

</body>
</html>
