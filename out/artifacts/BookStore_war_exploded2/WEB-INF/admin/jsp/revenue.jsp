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
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700&display=swap" rel="stylesheet" />
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/fonts/boxicons.css" />
    <!-- Core CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/css/demo.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/apex-charts/apex-charts.css" />

    <link href="/css/style.css" media="screen" rel="stylesheet">
    <script src="../assetsForAdmin/assets/vendor/js/helpers.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


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
            <jsp:useBean id="orderDAO" class="database.OrderDAO"/>

            <jsp:include page="navbar.jsp"/>
            <!-- / Navbar -->
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->




                <div class="row" style="margin: 30px">
                    <div class="col">
                        <canvas id="canvas" height="250" width="350"></canvas>
                    </div>
                    <div class="col">
                        <canvas id="myChart" height="250" width="350"></canvas>
                    </div>
                </div>


                <div class="row" style="margin: 30px">
                    <div class="col">
                        <div class="row">
                            <label class="col-sm-2 form-label" >Ngày Bắt Đầu</label>
                            <input name="ngaybatdau" type="date" id="ngaybatdau"  required="required">
                        </div>
                        <div class="row">
                            <label class="col-sm-2 form-label" >Ngày Kết Thúc</label>
                            <input name="ngayketthuc" type="date" id="ngayketthuc"   required="required">
                        </div>
                        <div class="row">
                            <button id="revenueButton" onclick="daytoday()" class="btn btn-primary" style="width: 200px; margin: 10px; background-color: #696cff;
                            color: #fff;" >Hiện thị doanh thu</button>
                        </div>
                        <div class="row">
                            <canvas id="myChart2" height="250" width="350"></canvas>
                        </div>

                    </div>
                    <div class="col" style="margin-left: 100px">

                        <div id="top-products-label">TOP 5 SP Bán chạy nhất</div>

                        <jsp:useBean id="productDAO" class="database.ProductDAO" />
                     <c:set var="listProduct" value="${productDAO.topNBestProduct(5)}"/>
    <div class="card-body">
        <ul class="p-0 m-0">
            <c:forEach var="entry" items="${listProduct.entrySet()}">
                <c:set var="productId" value="${entry.key}" />
                <c:set var="quantity" value="${entry.value}" />
                <c:set var="product" value="${productDAO.selectById(productId)}" />
                <li class="d-flex mb-4 pb-1">
                    <div class="avatar flex-shrink-0 me-3">
                        <img class="product-image rounded" src="/image/${product.image}" alt="${product.product_name}">
                    </div>
                    <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                            <small class="text-muted d-block mb-1">${product.product_name}</small>
                            <div class="user-progress d-flex align-items-center gap-1">
                                <h6 class="mb-0">${quantity}</h6>
                                <span class="text-muted">Quyển</span>
                            </div>

                        </div>

                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
                    </div>

                </div>

                <script>
                    // Lấy ngày hôm nay theo định dạng YYYY-MM-DD
                    const today = new Date().toISOString().split('T')[0];
                    // Đặt giá trị mặc định của input là ngày hôm nay
                    document.getElementById('ngayketthuc').value = today;
                    document.getElementById('ngaybatdau').value = today;
                </script>

                <!-- / Content -->

                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>document.write(new Date().getFullYear());</script>
                            , made with ❤️ by
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


            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>
    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->
<div class="buy-now">
    <a href="Index" target="_blank" class="btn btn-danger btn-buy-now">Quay lại trang shopping</a>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assetsForAdmin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="../assetsForAdmin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="../assetsForAdmin/assets/js/main.js"></script>

<!-- Page JS -->
<script src="../assetsForAdmin/assets/js/dashboards-analytics.js"></script>
<!-- Chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.min.js"></script>

<script>
    let massPopChart2 = null; // Initialize variable to hold the chart instance
    function daytoday() {
        var ngay1 = document.getElementById('ngaybatdau').value;
        var ngay2 = document.getElementById('ngayketthuc').value;
        var data = { ngaybatdau: ngay1, ngayketthuc: ngay2 };

        fetch('/FromDayToDayRevenue', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);

                // Check if massPopChart2 is initialized
                if (!massPopChart2) {
                    // Initialize massPopChart2 if not already initialized
                    let labels = Object.keys(data);
                    let values = Object.values(data);
                    let myChart = document.getElementById('myChart2').getContext('2d');
                    massPopChart2 = new Chart(myChart, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: "doanh thu",
                                data: values,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.6)',
                                    'rgba(54, 162, 235, 0.6)',
                                    'rgba(255, 206, 86, 0.6)',
                                    'rgba(75, 192, 192, 0.6)',
                                    'rgba(153, 102, 255, 0.6)',
                                    'rgba(255, 159, 64, 0.6)',
                                    'rgba(255, 99, 132, 0.6)'
                                ],
                                borderWidth: 1,
                                borderColor: '#777',
                                hoverBorderWidth: 3,
                                hoverBorderColor: '#000'
                            }]
                        },
                        options: {
                            title: {
                                display: true,
                                text: 'Doanh thu tuần này',
                                fontSize: 25
                            },
                            legend: {
                                display: true,
                                position: 'right',
                                labels: {
                                    fontColor: '#000'
                                }
                            },
                            layout: {
                                padding: {
                                    left: 50,
                                    right: 0,
                                    bottom: 0,
                                    top: 0
                                }
                            },
                            tooltips: {
                                enabled: true
                            }, plugins: {
                                title: {
                                    display: true,
                                    text: 'Doanh Thu Ngày '+ ngay1+' Đến '+ngay2
                                }
                            }
                        }
                    });
                } else {
                    // Update existing chart data if massPopChart2 is already initialized
                    let labels = Object.keys(data);
                    let values = Object.values(data);
                    massPopChart2.data.labels = labels;
                    massPopChart2.data.datasets[0].data = values;
                    massPopChart2.update();
                }
            })
            .catch(error => console.error('Error fetching data:', error));
    }

</script>
<!-- Page JS -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        fetch('/RevenueDataServlet')
            .then(response => response.json())
            .then(data => {
                var ctx = document.getElementById('canvas').getContext('2d');
                var myLineChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7",
                            "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                        datasets: [{
                            label: "năm nay",
                            backgroundColor: "rgba(151,249,190,0.5)",
                            borderColor: "rgba(151,249,190,1)",
                            data: data.data1
                        }, {
                            label: "năm trước",
                            backgroundColor: "rgba(252,147,65,0.5)",
                            borderColor: "rgba(252,147,65,1)",
                            data: data.data2
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }, plugins: {
                            title: {
                                display: true,
                                text: 'Doanh Thu 2 năm gần đây'
                            }
                        }
                    }
                });
                console.log('Dataset 2:', myLineChart.data.datasets[1].data);
            })
            .catch(error => console.error('Error fetching data:', error));

        fetch("/DailyRevenue")
            .then(response=> response.json())
            .then(data=>{

                let myChart = document.getElementById('myChart').getContext('2d');
                let massPopChart = new Chart(myChart, {
                    type:'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
                    data:{
                        labels:["Thứ 2", "Thứ 3","Thứ 4","Thứ 5","Thứ 6","Thứ 7","CN"],
                        datasets:[{
                            label: "doanh thu",
                            data:data,
                            //backgroundColor:'green',
                            backgroundColor:[
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 206, 86, 0.6)',
                                'rgba(75, 192, 192, 0.6)',
                                'rgba(153, 102, 255, 0.6)',
                                'rgba(255, 159, 64, 0.6)',
                                'rgba(255, 99, 132, 0.6)'
                            ],
                            borderWidth:1,
                            borderColor:'#777',
                            hoverBorderWidth:3,
                            hoverBorderColor:'#000'
                        }]
                    },
                    options:{
                        title:{
                            display:true,
                            text:'Doanh thu tuần này',
                            fontSize:25
                        },
                        legend:{
                            display:true,
                            position:'right',
                            labels:{
                                fontColor:'#000'
                            }
                        },
                        layout:{
                            padding:{
                                left:50,
                                right:0,
                                bottom:0,
                                top:0
                            }
                        },
                        tooltips:{
                            enabled:true
                        }, plugins: {
                            title: {
                                display: true,
                                text: 'Doanh Thu Tuần Này'
                            }
                        }
                    }
                });

            })
        daytoday();
        // Bind button click event to daytoday function
        document.getElementById('revenueButton').addEventListener('click', daytoday);

    });


</script>



</body>

</html>
