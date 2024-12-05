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
    <title>Thanh toán</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

    <style>
        .product-list {
            list-style: none;
            padding: 0;
        }

        .product-list li {
            margin-bottom: 10px; /* Adjust spacing between list items */
        }

        .product-name {

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
        .product-list {
            list-style: none;
            padding: 0;
        }

        .product-list li {
            margin-bottom: 10px; /* Adjust spacing between list items */
        }

        .product-name {

        }
        #selectaddress1{
            display: flex;
            flex: 0 0 50%;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        #selectaddress1 label{
            flex: 1 1 50%;

        }

        #selectaddress1 .nice-select{
            flex: 1 1 50%;margin-right:10px ;
        }
        #selectaddress2{
            display: flex;
            flex: 0 0 50%;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        #selectaddress2 label{
            flex: 1 1 50%;

        }

        #selectaddress2 .nice-select{
            flex: 1 1 50%;

            margin-right:10px ;
        }
        #selectaddress3{
            display: flex;
            flex: 0 0 50%;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        #selectaddress3 label{
            flex: 1 1 50%;

        }

        #selectaddress3 .nice-select{
            flex: 1 1 50%;

            margin-right:10px ;
        }
        .checkout__input.success{
            border-color: #28a745;
        }
        .checkout__input.error{
            border-color: #dc3545;
        }
        .checkout__input small{
            color: #dc3545;
        }
        .qr-code {
            display: flex;
            align-items: center;
        }
        .qr-modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }
        .qrModal-content {
            /*background-color: #fefefe;*/
            margin: 100px auto; /* Cách phía trên 100px và tự động căn giữa ngang */
            padding: 20px;
            /*border: 1px solid #888;*/
            width: 40%;
            display: flex;
            align-items: center;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<jsp:include page="navbar.jsp"/>
<jsp:useBean id="paymentDAO" class="database.PaymentDAO"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/hinhnen.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Checkout</h2>
                    <div class="breadcrumb__option">
                        <a href="Index">Home</a>
                        <span>Checkout</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <c:choose>
            <c:when test="${empty sessionScope.userC and empty sessionScope.admin}">
                <div class="row">
                    <div class="col-lg-12">
                        <h6><span><i class="fa-solid fa-right-to-bracket"></i></span> Bạn đã đăng nhập chưa ? <a href="Login">Bấm vào đây </a> để đăng nhập hoặc đăng ký.
                        </h6>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <div class="checkout__form">
            <h4>Chi tiết hóa đơn ${sessionScope.userC.userId}</h4>
            <form action="/CheckoutController" method="post" id="checkoutform">
                <div class="row">
                    <div class="col-lg-7 col-md-6">

                        <div class="checkout__input">
                            <label for="nameConsignee">Tên người nhận<span style="color: red">*</span></label>
                            <input type="text" id="nameConsignee" name="nameConsignee" oninput="checkUsername()" required="required">
                            <small></small>

                        </div><div class="checkout__input" id="selectaddress1">
                        <label for="address">Tỉnh/Thành phố<span style="color: red">*</span></label>
                        <select class="css_select" id="tinh" name="tinh" >
                            <option value="-1">Tỉnh Thành</option>
                        </select>
                    </div>
                        <div class="checkout__input" id="selectaddress2">
                            <label for="address">Quận/Huyện<span style="color: red">*</span></label>
                            <select class="css_select" id="quan" name="quan" >
                                <option value="-1">Quận Huyện</option>
                            </select>
                        </div>
                        <div class="checkout__input" id="selectaddress3" >
                            <label for="address">Phưỡng/Xã<span style="color: red">*</span></label>
                            <select class="css_select" id="phuong" name="phuong" >
                                <option value="-1">Phường Xã</option>
                            </select>
                        </div>
                        <div class="checkout__input">
                            <label for="address">Địa chỉ<span style="color: red">*</span></label>
                            <input type="text" id="address" name="address" required="required">
                            <small></small>

                        </div>
                        <div class="checkout__input">
                            <label for="phone">Số điện thoại<span style="color: red">*</span></label>
                            <input type="text" id="phone" name="phone" required="required" oninput="checkPhone()">
                            <small id="phonerror"></small>

                        </div>
                        <div class="checkout__input">
                            <label for="note">Ghi chú</label>
                            <input type="text" id="note" name="note" placeholder="Viết ghi chú bạn muốn nhắn với shop" oninput="checkNote()"></input>
                            <small id="noterror"></small>

                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <div class="checkout__order">
                            <h4>Your Order</h4>
                            <div class="checkout__order__products">Sản phẩm <span>Giá</span></div>
                            <ul>
                                <c:forEach var="p" items="${sessionScope.cart.cart_items}">
                                    <li class="product-name">${p.product.product_name}<span class="product-price">${FormatCurrency.formatCurrency(p.product.price)}</span></li>
                                    <c:set var="total" value="${total + (p.product.price * p.quantity)}" />
                                </c:forEach>
                            </ul>
                            <div class="checkout__order__total">Tổng tiền <span class="subtotal">${FormatCurrency.formatCurrency(total)}</span></div>
                            <c:set var="discount" value="${sessionScope.discount}" />
                            <c:set var="totalNew" value="${total - discount}" />
                            <div class="checkout__order__total discount-container">
                                Giảm giá <span class="discount">- ${FormatCurrency.formatCurrency(sessionScope.discount)}</span>
                            </div>
                            <div class="checkout__order__subtotal">
                                Tiền ship <span id="shippingCost">0 VND</span>
                                <input type="hidden" id="shippingCostValue" value="0" />
                            </div>
                            <div class="checkout__order__total">
                                Tổng thanh toán <span id="totalCost">${FormatCurrency.formatCurrency(totalNew)}</span>
                                <input type="hidden" id="totalNewValue" value="${totalNew}" />
                            </div>
                            <div class="checkout__input__checkbox" style="display: flex;">
                                <label style="margin-left: -15px">Phương thức thanh toán</label>
                                <div style="margin-left: 20px; margin-top: -10px">

                                    <select name="payment" id="payment" title="Select Category">
                                        <c:forEach items="${paymentDAO.selectAll()}" var="c">
                                            <option value="${c.paymentId}">${c.paymentName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="site-btn" id="submitBtn">Đặt hàng</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
    <div id="qrModal" class="qr-modal">
        <div class="qrModal-content">

            <img style="width: 400px;height: 500px;margin-top: 30px;margin-left: 80px" id="QRCODE-Img" src="" alt="QR Code">
        </div>
    </div>
</section>

<!-- Checkout Section End -->

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
                        <li><a href="#">Contact</a></li><li><a href="#">Innovation</a></li>
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
<%--<script src="js/owl.carousel.min.js"></script>--%>
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
            });icondarklight.classList.replace("fa-moon", "fa-sun");
        }
    });

    // Set the initial button text and Font Awesome icon


    // Enable Dark Reader when the page loads

</script>
<script src="js/scanqr.js"></script>
<script src="https://esgoo.net/scripts/jquery.js"></script>

<script>

    $(document).ready(function () {
        let totalQuantity = 0;
        <c:forEach var="p" items="${sessionScope.cart.cart_items}">
        totalQuantity += ${p.quantity};
        </c:forEach>

        function calculateTotal() {
            let total = 0;
            <c:forEach var="p" items="${sessionScope.cart.cart_items}">
            total += (${p.product.price} * ${p.quantity});
            </c:forEach>
            return total;
        }

        function getDiscount() {
            return parseFloat('${sessionScope.discount}');
        }

        function getShippingCost() {
            let shippingCost = parseFloat($('#shippingCostValue').val());
            return shippingCost;
        }

        function updateTotalCost() {
            let total = calculateTotal();
            let discount = getDiscount();
            let shippingCost = getShippingCost();

            let totalNew;
            if (discount > 0) {
                totalNew = total - discount;
            } else {
                totalNew = total;
            }

            $('#totalCost').text(formatCurrency(totalNew + shippingCost));
            $('#totalNewValue').val(totalNew); // Cập nhật giá trị mới nhất của totalNew vào input ẩn
            return totalNew;
        }

        $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
            if (data_tinh.error == 0) {
                $("#tinh").append('<option value="0">Chọn Tỉnh/Thành</option>');
                $.each(data_tinh.data, function (key_tinh, val_tinh) {
                    $("#tinh").append('<option value="' + val_tinh.name + '" data-id="'+val_tinh.id+'">' + val_tinh.name + '</option>');
                });
                $("#tinh").change();
            }
        });

        $("#tinh").change(function (e) {
            const idtinh = $('#tinh').find("option:selected").attr("data-id");
            const tinhName = $('#tinh').find("option:selected").text();

            let shippingCost = 0;
            if (tinhName === "Hồ Chí Minh") {
                shippingCost = 20000 * totalQuantity;
            } else {
                shippingCost = 40000 * totalQuantity;
            }

            $('#shippingCost').text(formatCurrency(shippingCost));
            $('#shippingCostValue').val(shippingCost);

            updateTotalCost();

            $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                if (data_quan.error == 0) {
                    $("#quan").html('<option value="0">Quận Huyện</option>');
                    $("#phuong").html('<option value="0">Phường Xã</option>');
                    $.each(data_quan.data, function (key_quan, val_quan) {
                        $("#quan").append('<option value="' + val_quan.name + '" data-id="'+val_quan.id+'">' + val_quan.name + '</option>');
                    });
                    console.log("Province ID: " + idtinh);
                }
            });
        });

        $("#quan").change(function (e) {
            const idquan = $('#quan').find("option:selected").attr("data-id");
            $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                if (data_phuong.error == 0) {
                    $("#phuong").html('<option value="0">Phường Xã</option>');
                    $.each(data_phuong.data, function (key_phuong, val_phuong) {
                        $("#phuong").append('<option value="' + val_phuong.name + '" data-id="'+val_phuong.id+'">' + val_phuong.name + '</option>');
                    });
                    console.log("District ID: " + idquan);
                }
            });
        });

        $("#phuong").change(function (e) {
            var idphuong = $('#phuong').find("option:selected").attr("data-id");
            console.log("Ward ID: " + idphuong);
        });

        function formatCurrency(number) {
            return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number);
        }

        // QR Payment

    });

</script>
<script>

    function checkUsername() {
        const usernameInput = document.getElementById('nameConsignee');
        const username = usernameInput.value.trim();
        const errorMessage1 = usernameInput.nextElementSibling;

        if (username === '') {usernameInput.style.borderColor = "#dc3545";
            errorMessage1.textContent = "Username cannot be blank";
        } else {
            usernameInput.style.borderColor = "#28a745";
            errorMessage1.textContent = "";
        }

    }
    function checkPhone() {
        const phoneInput = document.getElementById('phone');
        const phone = phoneInput.value.trim();
        const errorMessage2 = document.getElementById('phonerror');
        const phoneRegex = /^(?:\d{10}|\d{11})(?![a-zA-Z])+$/;

        // Check for null or empty value first
        if (phone === '') {
            phoneInput.style.borderColor = "#dc3545";
            errorMessage2.textContent = "Số điện thoại không được để trống";
        }

        // Validate phone number format
        const isValid = phoneRegex.test(phone);

        if (!isValid) {
            phoneInput.style.borderColor = "#dc3545";
            errorMessage2.textContent = `Số điện thoại không đúng định dạng (10-11 số)`;
        } else {
            // Phone number is valid
            phoneInput.style.borderColor = "#28a745";
            errorMessage2.textContent = "";
        }
    }
    function checkNote() {
        const noteInput = document.getElementById('note');
        const note = noteInput.value.trim();
        const errorMessage3 = document.getElementById('noterror');
        const inappropriateWordsRegex = /(cặc|đéo|lồn|ngu|gay|địt)/gi;


        const match = note.match(inappropriateWordsRegex);
        if (match) {
            noteInput.style.borderColor = "#dc3545";
            errorMessage3.style.color = "#dc3545";
            errorMessage3.textContent = `Note contains inappropriate words:` + match;
        } else {
            noteInput.style.borderColor = "#28a745";
            noteInput.style.color = "#000000FF"
            errorMessage3.textContent = "";
        }
    }
    const submitButton = document.getElementById('submitBtn');
    submitButton.addEventListener('click', function(event) {
        document.getElementById("checkoutform").submit();
        // Combine validation checks using logical AND (&&)
        if (!checkUsername() && !checkNote() && !checkPhone()) {
            event.preventDefault(); // Prevent form submission if errors exist

        }

        // If no errors are found, submit the form as intended
        // (no changes to action or method are required)
    });
</script>


<script src="https://cdn.botpress.cloud/webchat/v2/inject.js"></script>
<script src="https://mediafiles.botpress.cloud/1d0997ec-87ba-4ea8-8a5c-c2fba00d5019/webchat/v2/config.js"></script>

</body>

</html>