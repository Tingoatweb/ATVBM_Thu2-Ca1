<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<%@ page import="util.FormatCurrency"%>
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
        .sss{
            background-color: #f1f1f1;
        }
        .content{
            padding-top: 30px;
        }
        .nav-pills{
            width: 100%;
            margin-left: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .nav-item{
            display: flex;
            flex-direction: column;
            padding: 3px;
        }
        .nav-pills .nav-link{
            font-weight: bold;
            padding-top: 13px;
            text-align: center;
            background: #ffffff;
            color: #000000;
            border-radius: 30px;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.2);
            height: 50px;
        }
        .nav-pills .nav-link.active{
            background: #8AC0DE;
            color: #ffffff;
            box-shadow: 0px 6px 6px rgba(0, 0, 0, 0.2);
        }
        .tab-content{
            width: auto;
            max-width: 700px;
            height: auto;
            min-height: 500px;
            color: #000;
            margin: 0 auto;
        }
        .orderEmpty{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            max-width: 690px;
            min-height: 500px;
        }
        .fromOrder{
            margin-top: 20px;
            width: 100%;
            max-width: 1000px;
            background-color: white;
            box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.4);
            border-radius: 10px;
            padding: 10px;
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
        .quantityTotalPrices{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            height: 10px;
            margin-top: -10px;
        }
        .button{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: none;
        }
        .reasonCancel {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white; /* Màu nền */
            padding: 20px; /* Khoảng cách giữa nội dung và viền */
            border: 1px solid black; /* Viền */
            z-index: 1000; /* Đảm bảo phần tử này hiển thị trên overlay */
            display: none;
            border-radius: 10px;
            box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.4);
        }
        .re{
            position: relative;
        }
        .closeReason {
            position: absolute;
            top: -35px;
            right: -33px;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: white;
            border: 1px solid black;
            color: #a71d2a;
            font-size: 23px;
            z-index: 1100;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        .fa-xmark{
            position: absolute;
            top: 3px;
            left: 5px;
        }
        .tabLef{
            padding-top: 100px;

        }
        .Information_myaccount{
            /*background-color: white;*/
            display: flex;

        }
        .my_img{
            padding-left: 2px;
            padding-top: 15px;
        }
        .my_Information{
            padding-top: 15px;
            padding-left: 10px;
        }
        .detail a:hover{
            color: #a71d2a;
        }
    </style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
<jsp:include page="navbar.jsp"/>
<jsp:useBean id="orderDetailDAO" class="database.OrderDetailDAO"/>
<jsp:useBean id="orderDAO" class="database.OrderDAO"/>
<jsp:useBean id="userDAO" class="database.UserDAO"/>
<c:set var="id" value="${sessionScope.userC.userId}"/>
<c:set var="user" value="${sessionScope.userC}"/>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/hinhnen.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Đơn hàng</h2>
                    <div class="breadcrumb__option">
                        <a href="Index">Trang chủ</a>
                        <span>Đơn hàng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="sss">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 left-tab">
                <div class="tabLef">
                    <div class="Information_myaccount">
                        <div class="my_img">
                            <img src="img/blog/blog-1.jpg" alt="" width="55" height="55" class="rounded-circle">
                        </div>
                        <div class="my_Information">
                            <div class="MyName" style="font-weight: bold">${user.username}</div>
                            <div class="linkInformation">
                                <a href="/Profile">Hồ sơ của tôi</a>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="col-lg-9 ">
                <div class="order">
                    <div class="content">
                        <!-- Nav pills -->
                        <ul class="nav nav-pills" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="pill" href="#statusXacNhan">Chờ xác nhận</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#StausLayHang">Chờ lấy hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#StausGiaoHang">Chờ giao hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#StausDaGiao">Đã giao</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#StausDaHuy">Đã hủy</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#StausDaHoan">Trả hàng</a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div id="statusXacNhan" class="container tab-pane active">
                                <c:set var="statusXacNhan" value="1"/>
                                <c:if test="${empty orderDAO.selectByUserIdAndStatusId(id, statusXacNhan)}">
                                    <div class="orderEmpty">
                                        <img height="100px" width="90px" src="/img/iconorder.png">
                                        <p>Danh sách đơn hàng trống</p>
                                    </div>
                                </c:if>
                                <c:forEach var="order" items="${orderDAO.selectByUserIdAndStatusId(id, statusXacNhan)}">
                                    <div class="fromOrder">
                                        <div class="orderDetailProduct">
                                            <c:set var="detail" value="${orderDetailDAO.selectFirstByOrderId(order.orderId)}"/>
                                            <div class="img">
                                                <img  width="120px" height="140px" src="/image/${detail.product.image}" alt="">
                                            </div>
                                            <div class="productDetail">
                                                <div class="productName">
                                                    <h3>${detail.product.product_name} <span style="font-size: 20px">x ${detail.quantity}</span></h3>
                                                </div>
                                                <div class="category">
                                                    <p style="font-size: 15px">Thể loại: ${detail.product.category.categoryName}</p>
                                                </div>
                                                <div class="dateOrder">
                                                    <p>${order.bookingDate}</p>
                                                </div>
                                                <div class="priceDetail">
                                                    <div class="detail">
                                                        <a href="/OrderDetail?OrderId=${order.orderId}">Chi tiết sản phẩm</a>
                                                    </div>
                                                    <div class="productPrice">
                                                        <h4>${FormatCurrency.formatCurrency(detail.product.price)}</h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <c:set var="quantity" value="${orderDetailDAO.sumOrderDetailsQuantityByOrderId(order.orderId)}"/>
                                        <div class="quantityTotalPrices">
                                            <div class="quantity">
                                                <p>${quantity} sản phẩm</p>
                                            </div>
                                            <div class="totalPrice">
                                                <p style="color: #ff0018; font-size: 25px; font-weight: bold">${FormatCurrency.formatCurrency(order.totalPrice)}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="button">
                                            <div class="statusOrder">
                                                <h3 style="color: #ef8640; font-size: 22px; font-weight: bold">${order.status.statusName} <i style="color: #ef8640" class="fa-solid fa-check"></i></h3>
                                            </div>
                                            <div class="detailOrder">
                                                <button class="badge bg-danger me-1 CancelOrderBt" style="font-size: 22px; border: none; width: auto">Yêu cầu hủy</button>
                                                <!-- Unique container for each cancel section -->
                                                <div class="overlay" style="display:none;"></div>
                                                <div class="reasonCancel" style="display:none;">
                                                    <div class="re">
                                                        <div class="closeReason"><i class="fa-solid fa-xmark"></i></div>
                                                        <h4>Hãy chọn lý do bạn hủy đơn ${order.orderId}</h4>
                                                        <form action="ChangeStatusOrderUser" method="post">
                                                            <input type="radio" id="reason1-${order.orderId}" name="reason" value="Muốn thay đổi thông tin giao hàng.">
                                                            <label for="reason1-${order.orderId}">Muốn thay đổi thông tin giao hàng.</label><br>
                                                            <input type="radio" id="reason2-${order.orderId}" name="reason" value="Muốn chọn sản phẩm khác.">
                                                            <label for="reason2-${order.orderId}">Muốn chọn sản phẩm khác.</label><br>
                                                            <input type="radio" id="reason3-${order.orderId}" name="reason" value="Không muốn mua nữa.">
                                                            <label for="reason3-${order.orderId}">Không muốn mua nữa.</label><br>
                                                            <input type="hidden" name="orderId" value="${order.orderId}" />
                                                            <input type="hidden" name="action" value="CancelOrder1" />
                                                            <button type="submit" class="badge bg-success me-1" style="font-size: 20px">Xác nhận</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="StausLayHang" class="container tab-pane fade">
                                <c:set var="statusLayHang" value="2"/>
                                <c:set var="statusYeuCauHuy" value="5"/>
                                <c:if test="${empty orderDAO.selectByUserIdAndStatusIds(id, statusLayHang, statusYeuCauHuy)}">
                                    <div class="orderEmpty">
                                        <img height="100px" width="90px" src="/img/iconorder.png">
                                        <p>Danh sách đơn hàng trống</p>
                                    </div>
                                </c:if>
                                <c:forEach var="order" items="${orderDAO.selectByUserIdAndStatusIds(id, statusLayHang, statusYeuCauHuy)}">
                                    <div class="fromOrder">
                                        <div class="orderDetailProduct">
                                            <c:set var="detail" value="${orderDetailDAO.selectFirstByOrderId(order.orderId)}"/>
                                            <div class="img">
                                                <img  width="120px" height="140px" src="/image/${detail.product.image}" alt="">
                                            </div>
                                            <div class="productDetail">
                                                <div class="productName">
                                                    <h3>${detail.product.product_name} <span style="font-size: 20px">x ${detail.quantity}</span></h3>
                                                </div>
                                                <div class="category">
                                                    <p style="font-size: 15px">Thể loại: ${detail.product.category.categoryName}</p>
                                                </div>
                                                <div class="dateOrder">
                                                    <p>${order.bookingDate}</p>
                                                </div>
                                                <div class="priceDetail">
                                                    <div class="detail">
                                                        <a href="/OrderDetail?OrderId=${order.orderId}">Chi tiết sản phẩm</a>
                                                    </div>
                                                    <div class="productPrice">
                                                        <h4>${FormatCurrency.formatCurrency(detail.product.price)}</h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <c:set var="quantity" value="${orderDetailDAO.sumOrderDetailsQuantityByOrderId(order.orderId)}"/>
                                        <div class="quantityTotalPrices">
                                            <div class="quantity">
                                                <p>${quantity} sản phẩm</p>
                                            </div>
                                            <div class="totalPrice">
                                                <p style="color: #ff0018; font-size: 25px; font-weight: bold">${FormatCurrency.formatCurrency(order.totalPrice)}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="button">
                                            <div class="statusOrder">
                                                <c:choose>
                                                    <c:when test="${order.status.statusId == 2}">
                                                        <h3 style="color: #b98d3c; font-size: 22px; font-weight: bold">${order.status.statusName} <i style="color: #b98d3c" class="fa-solid fa-boxes-packing"></i></h3>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h3 style="color: #c31625; font-size: 22px; font-weight: bold">${order.status.statusName} <i style="color: #c31625" class="fa-solid fa-ban"></i></h3>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="detailOrder">
                                                <c:choose>
                                                    <c:when test="${order.status.statusId == 2}">
                                                        <button class="badge bg-danger me-1 CancelOrderBt" style="font-size: 22px; border: none; width: auto">Yêu cầu hủy</button>
                                                        <div class="overlay" style="display:none;"></div>
                                                        <div class="reasonCancel" style="display:none;">
                                                            <div class="re">
                                                                <div class="closeReason"><i class="fa-solid fa-xmark"></i></div>
                                                                <h4>Hãy chọn lý do bạn hủy đơn ${order.orderId}</h4>
                                                                <form action="ChangeStatusOrderUser" method="post">
                                                                    <input type="radio" id="reason1-${order.orderId}" name="reason" value="Muốn thay đổi thông tin giao hàng.">
                                                                    <label for="reason1-${order.orderId}">Muốn thay đổi thông tin giao hàng.</label><br>
                                                                    <input type="radio" id="reason2-${order.orderId}" name="reason" value="Muốn chọn sản phẩm khác.">
                                                                    <label for="reason2-${order.orderId}">Muốn chọn sản phẩm khác.</label><br>
                                                                    <input type="radio" id="reason3-${order.orderId}" name="reason" value="Không muốn mua nữa.">
                                                                    <label for="reason3-${order.orderId}">Không muốn mua nữa.</label><br>
                                                                    <input type="hidden" name="orderId" value="${order.orderId}" />
                                                                    <input type="hidden" name="action" value="CancelOrder2" />
                                                                    <button type="submit" class="badge bg-success me-1" style="font-size: 20px">Xác nhận</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form action="ChangeStatusOrderUser" method="post">
                                                            <input type="hidden" name="orderId" value="${order.orderId}" />
                                                            <input type="hidden" name="action" value="ReturnCancelOrder2" />
                                                            <button type="submit" class="badge bg-info CancelOrderBt" style="font-size: 22px; border: none; width: auto">Hủy yêu cầu</button>
                                                        </form>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="StausGiaoHang" class="container tab-pane fade">
                                <c:set var="statusGiaoHang" value="3"/>
                                <c:set var="statusGiaoHangThanhCong" value="4"/>
                                <c:if test="${empty orderDAO.selectByUserIdAndStatusIds(id, statusGiaoHang,statusGiaoHangThanhCong)}">
                                    <div class="orderEmpty">
                                        <img height="100px" width="90px" src="/img/iconorder.png">
                                        <p>Danh sách đơn hàng trống</p>
                                    </div>
                                </c:if>
                                <c:forEach var="order" items="${orderDAO.selectByUserIdAndStatusIds(id, statusGiaoHang,statusGiaoHangThanhCong)}">
                                    <div class="fromOrder">
                                        <div class="orderDetailProduct">
                                            <c:set var="detail" value="${orderDetailDAO.selectFirstByOrderId(order.orderId)}"/>
                                            <div class="img">
                                                <img  width="120px" height="140px" src="/image/${detail.product.image}" alt="">
                                            </div>
                                            <div class="productDetail">
                                                <div class="productName">
                                                    <h3>${detail.product.product_name} <span style="font-size: 20px">x ${detail.quantity}</span></h3>
                                                </div>
                                                <div class="category">
                                                    <p style="font-size: 15px">Thể loại: ${detail.product.category.categoryName}</p>
                                                </div>
                                                <div class="dateOrder">
                                                    <p>${order.bookingDate}</p>
                                                </div>
                                                <div class="priceDetail">
                                                    <div class="detail">
                                                        <a href="/OrderDetail?OrderId=${order.orderId}">Chi tiết sản phẩm</a>
                                                    </div>
                                                    <div class="productPrice">
                                                        <h4>${FormatCurrency.formatCurrency(detail.product.price)}</h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <c:set var="quantity" value="${orderDetailDAO.sumOrderDetailsQuantityByOrderId(order.orderId)}"/>
                                        <div class="quantityTotalPrices">
                                            <div class="quantity">
                                                <p>${quantity} sản phẩm</p>
                                            </div>
                                            <div class="totalPrice">
                                                <p style="color: #ff0018; font-size: 25px; font-weight: bold">${FormatCurrency.formatCurrency(order.totalPrice)}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="button">
                                            <div class="statusOrder">
                                                <c:choose>
                                                    <c:when test="${order.status.statusId == 4}">
                                                        <h3 style="color: #38bc10; font-size: 22px; font-weight: bold">${order.status.statusName} <i style="color: #38bc10" class="fa-solid fa-truck-ramp-box"></i></h3>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h3 style="color: #1c67d7; font-size: 22px; font-weight: bold">${order.status.statusName} <i style="color: #1c67d7" class="fa-solid fa-truck-fast"></i> </h3>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="detailOrder">
                                                <c:choose>
                                                    <c:when test="${order.status.statusId == 4}">
                                                        <form action="ChangeStatusOrderUser" method="post">
                                                            <input type="hidden" name="orderId" value="${order.orderId}" />
                                                            <input type="hidden" name="action" value="ReceiveOrder" />
                                                            <button type="submit" class="badge bg-danger me-1" style="font-size: 22px; border: none; width: auto">Đã nhận được</button>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="badge bg-secondary" style="font-size: 22px; border: none;">Đã nhận được</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="StausDaGiao" class="container tab-pane fade">
                                <c:set var="statusDaNhan" value="10"/>
                                <c:set var="statusYeuCauTraHang" value="7"/>
                                <c:if test="${empty orderDAO.selectByUserIdAndStatusIds(id, statusDaNhan,statusYeuCauTraHang)}">
                                    <div class="orderEmpty">
                                        <img height="100px" width="90px" src="/img/iconorder.png">
                                        <p>Danh sách đơn hàng trống</p>
                                    </div>
                                </c:if>
                                <c:forEach var="order" items="${orderDAO.selectByUserIdAndStatusIds(id, statusDaNhan,statusYeuCauTraHang)}">
                                    <div class="fromOrder">
                                        <div class="orderDetailProduct">
                                            <c:set var="detail" value="${orderDetailDAO.selectFirstByOrderId(order.orderId)}"/>
                                            <div class="img">
                                                <img  width="120px" height="140px"  src="/image/${detail.product.image}" alt="">
                                            </div>
                                            <div class="productDetail">
                                                <div class="productName">
                                                    <h3>${detail.product.product_name} <span style="font-size: 20px">x ${detail.quantity}</span></h3>
                                                </div>
                                                <div class="category">
                                                    <p style="font-size: 15px">Thể loại: ${detail.product.category.categoryName}</p>
                                                </div>
                                                <div class="dateOrder">
                                                    <p>${order.bookingDate}</p>
                                                </div>
                                                <div class="priceDetail">
                                                    <div class="detail">
                                                        <a href="/OrderDetail?OrderId=${order.orderId}">Chi tiết sản phẩm</a>
                                                    </div>
                                                    <div class="productPrice">
                                                        <h4>${FormatCurrency.formatCurrency(detail.product.price)}</h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <c:set var="quantity" value="${orderDetailDAO.sumOrderDetailsQuantityByOrderId(order.orderId)}"/>
                                        <div class="quantityTotalPrices">
                                            <div class="quantity">
                                                <p>${quantity} sản phẩm</p>
                                            </div>
                                            <div class="totalPrice">
                                                <p style="color: #ff0018; font-size: 25px; font-weight: bold">${FormatCurrency.formatCurrency(order.totalPrice)}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="button">
                                            <div class="statusOrder">
                                                <c:choose>
                                                    <c:when test="${order.status.statusId == 10}">
                                                        <h3 style="color: #c264ff; font-size: 22px; font-weight: bold">${order.status.statusName} <i style="color: #c264ff" class="fa-solid fa-box-open"></i></h3>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h3 style="color: #c31625; font-size: 22px; font-weight: bold">${order.status.statusName} <i style="color: #c31625" class="fa-solid fa-truck-fast"></i> </h3>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="detailOrder">
                                                <c:choose>
                                                    <c:when test="${order.status.statusId == 10}">
                                                        <button class="badge bg-danger me-1 CancelOrderBt" style="font-size: 22px; border: none; width: auto">Yêu cầu trả hàng</button>
                                                        <div class="overlay" style="display:none;"></div>
                                                        <div class="reasonCancel" style="display:none;">
                                                            <div class="re">
                                                                <div class="closeReason"><i class="fa-solid fa-xmark"></i></div>
                                                                <h4>Hãy chọn lý do bạn trả hàng ${order.orderId}</h4>
                                                                <form action="ChangeStatusOrderUser" method="post">
                                                                    <input type="radio" id="reason1-${order.orderId}" name="reason" value="Sản phẩm không đúng so với mô tả hoặc hình ảnh trên trang web.">
                                                                    <label for="reason1-${order.orderId}">Sản phẩm không đúng so với mô tả hoặc hình ảnh trên trang web.</label><br>
                                                                    <input type="radio" id="reason2-${order.orderId}" name="reason" value="Sản phẩm bị hỏng hoặc bị hỏng trong quá trình vận chuyển.">
                                                                    <label for="reason2-${order.orderId}">Sản phẩm bị hỏng hoặc bị hỏng trong quá trình vận chuyển.</label><br>
                                                                    <input type="radio" id="reason3-${order.orderId}" name="reason" value="Không hài lòng với sản phẩm sau khi nhận và muốn trả về vì không còn nhu cầu sử dụng nữa.">
                                                                    <label for="reason3-${order.orderId}">Không hài lòng với sản phẩm sau khi nhận và muốn trả về vì không còn nhu cầu sử dụng nữa.</label><br>
                                                                    <input type="hidden" name="orderId" value="${order.orderId}" />
                                                                    <input type="hidden" name="action" value="ReturnOrder" />
                                                                    <button type="submit" class="badge bg-success me-1" style="font-size: 20px">Xác nhận</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form action="ChangeStatusOrderUser" method="post">
                                                            <input type="hidden" name="orderId" value="${order.orderId}" />
                                                            <input type="hidden" name="action" value="CancelReturnOrder" />
                                                            <button type="submit" class="badge bg-info CancelOrderBt" style="font-size: 22px; border: none; width: auto">Hủy yêu cầu</button>
                                                        </form>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="StausDaHuy" class="container tab-pane fade">
                                <c:set var="statusDaHuy" value="6"/>
                                <c:if test="${empty orderDAO.selectByUserIdAndStatusIds(id, statusDaHuy)}">
                                    <div class="orderEmpty">
                                        <img height="100px" width="90px" src="/img/iconorder.png">
                                        <p>Danh sách đơn hàng trống</p>
                                    </div>
                                </c:if>
                                <c:forEach var="order" items="${orderDAO.selectByUserIdAndStatusId(id, statusDaHuy)}">
                                    <div class="fromOrder">
                                        <div class="orderDetailProduct">
                                            <c:set var="detail" value="${orderDetailDAO.selectFirstByOrderId(order.orderId)}"/>
                                            <div class="img">
                                                <img   width="120px" height="140px"  src="/image/${detail.product.image}" alt="">
                                            </div>
                                            <div class="productDetail">
                                                <div class="productName">
                                                    <h3>${detail.product.product_name} <span style="font-size: 20px">x ${detail.quantity}</span></h3>
                                                </div>
                                                <div class="category">
                                                    <p style="font-size: 15px">Thể loại: ${detail.product.category.categoryName}</p>
                                                </div>
                                                <div class="dateOrder">
                                                    <p>${order.bookingDate}</p>
                                                </div>
                                                <div class="priceDetail">
                                                    <div class="detail">
                                                        <a href="/OrderDetail?OrderId=${order.orderId}">Chi tiết sản phẩm</a>
                                                    </div>
                                                    <div class="productPrice">
                                                        <h4>${FormatCurrency.formatCurrency(detail.product.price)}</h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <c:set var="quantity" value="${orderDetailDAO.sumOrderDetailsQuantityByOrderId(order.orderId)}"/>
                                        <div class="quantityTotalPrices">
                                            <div class="quantity">
                                                <p>${quantity} sản phẩm</p>
                                            </div>
                                            <div class="totalPrice">
                                                <p style="color: #ff0018; font-size: 25px; font-weight: bold">${FormatCurrency.formatCurrency(order.totalPrice)}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="button">
                                            <div class="statusOrder">
                                                <h3 style="color: #c31625; font-size: 22px; font-weight: bold">${order.status.statusName} </h3>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="StausDaHoan" class="container tab-pane fade">
                                <c:set var="statusDaHoan" value="8"/>
                                <c:set var="statusYeuCauTraHang" value="7"/>
                                <c:if test="${empty orderDAO.selectByUserIdAndStatusIds(id, statusDaHoan)}">
                                    <div class="orderEmpty">
                                        <img height="100px" width="90px" src="/img/iconorder.png">
                                        <p>Danh sách đơn hàng trống</p>
                                    </div>
                                </c:if>
                                <c:forEach var="order" items="${orderDAO.selectByUserIdAndStatusId(id, statusDaHoan)}">
                                    <div class="fromOrder">
                                        <div class="orderDetailProduct">
                                            <c:set var="detail" value="${orderDetailDAO.selectFirstByOrderId(order.orderId)}"/>
                                            <div class="img">
                                                <img  width="120px" height="140px"  src="/image/${detail.product.image}" alt="">
                                            </div>
                                            <div class="productDetail">
                                                <div class="productName">
                                                    <h3>${detail.product.product_name} <span style="font-size: 20px">x ${detail.quantity}</span></h3>
                                                </div>
                                                <div class="category">
                                                    <p style="font-size: 15px">Thể loại: ${detail.product.category.categoryName}</p>
                                                </div>
                                                <div class="dateOrder">
                                                    <p>${order.bookingDate}</p>
                                                </div>
                                                <div class="priceDetail">
                                                    <div class="detail">
                                                        <a href="/OrderDetail?OrderId=${order.orderId}">Chi tiết sản phẩm</a>
                                                    </div>
                                                    <div class="productPrice">
                                                        <h4>${FormatCurrency.formatCurrency(detail.product.price)}</h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <c:set var="quantity" value="${orderDetailDAO.sumOrderDetailsQuantityByOrderId(order.orderId)}"/>
                                        <div class="quantityTotalPrices">
                                            <div class="quantity">
                                                <p>${quantity} sản phẩm</p>
                                            </div>
                                            <div class="totalPrice">
                                                <p style="color: #ff0018; font-size: 25px; font-weight: bold">${FormatCurrency.formatCurrency(order.totalPrice)}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="button">
                                            <div class="statusOrder">
                                                <h3 style="color: #c31625; font-size: 22px; font-weight: bold">${order.status.statusName} <i style="color: #c31625;" class="fa-solid fa-arrow-right-arrow-left"></i></h3>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%--</c:if>--%>


<!-- Product Section Begin -->


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
<script>
    $(document).ready(function (){
        // Chọn tất cả các phần tử có class CancelOrderBt
        let cancelOrderButtons = document.querySelectorAll('.CancelOrderBt');

        // Duyệt qua từng phần tử và thêm sự kiện click
        cancelOrderButtons.forEach(function(cancelOrderButton) {
            cancelOrderButton.addEventListener("click", function (){
                // Lấy phần tử cha của nút hiện tại
                let parentElement = cancelOrderButton.closest('.fromOrder');
                // Chọn các phần tử overlay và reasonCancel từ phần tử cha
                let overlay = parentElement.querySelector('.overlay');
                let reasonCancel = parentElement.querySelector('.reasonCancel');
                let closeReason = reasonCancel.querySelector('.closeReason');

                // Hiển thị các phần tử
                overlay.style.display = "block";
                reasonCancel.style.display = "block";
                closeReason.style.display = "block";

                // Thêm sự kiện click cho nút đóng
                closeReason.addEventListener("click", function (){
                    overlay.style.display = "none";
                    reasonCancel.style.display = "none";
                    closeReason.style.display = "none";
                });
            });
        });
    });

</script>
<script src="https://cdn.botpress.cloud/webchat/v2/inject.js"></script>
<script src="https://mediafiles.botpress.cloud/1d0997ec-87ba-4ea8-8a5c-c2fba00d5019/webchat/v2/config.js"></script>
</body>

</html>