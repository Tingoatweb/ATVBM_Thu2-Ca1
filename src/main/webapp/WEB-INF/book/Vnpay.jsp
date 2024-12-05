<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="util.FormatCurrency"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from demo.vietqr.io/ by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Mar 2024 08:39:05 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>VietQR.io - Demo API Tra Cứu STK Ngân Hàng</title>
    <link rel="stylesheet" href="css/styleforbankaccount.css">
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400&amp;display=swap" rel="stylesheet">
    <!-- <script src="index7b30.js?v=4"></script> -->

</head>


<form action="Vnpay" class="container" method="post">

    <p class="title">Tra cứu số tài khoản</p>
    <div class="item">
        <label class="title-item">Ngân hàng</label>
        <div style="width: 60%;">
            <select name="bankId" id="banks" class="input">
            </select>
        </div>

    </div>
    <div class="item">
        <label  class="title-item">Số tài khoản</label>
        <div style="width:60%">
            <input style="box-sizing: border-box;" type="text" id="accountNumber" class="input">
        </div>
    </div>
    <div class="item">
        <label >Tên tài khoản</label>
        <div style="width:60%">
            <input style="box-sizing: border-box;" type="text" id="accountName" class="input">
        </div>
    </div>
    <div class="item">
        <label >Ngày tạo tài khoản</label>
        <div style="width:60%">
            <input style="box-sizing: border-box;" type="month" id="accountDate" class="input" min="2000-01" max="2100-12" value="2022-07" required pattern="[0-9]{2}/[0-9]{2}">

        </div>
    </div>
    <div class="item">
        <label >Email</label>
        <div style="width:60%">
            <input style="box-sizing: border-box;" type="text" name="emailforbank" class="input" >

        </div>
    </div>
    <input type="submit">
</form>
    <button><a href="./Checkout">Quay về trang thanh toán</a></button>
    <p id="error"></p>
<script src="./js/api7b30.js"></script>
</body>


<!-- Mirrored from demo.vietqr.io/ by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Mar 2024 08:39:05 GMT -->

</html>