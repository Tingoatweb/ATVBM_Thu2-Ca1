<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
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
.container-wrap {
	
}

.services-wrap {
	margin: 10px;
	padding: 5px;
}

.services-wrap img {
	max-width: 100%;
	height: auto;
	border-bottom: 1px solid #ddd;
}

.text {
	padding-top: 20px;
}

.pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.pagination li {
	margin: 0 5px;
	list-style: none;
	display: inline-block;
}

.pagination a {
	padding: 8px 16px;
	text-decoration: none;
	color: #333;
	background-color: #f8f9fa;
	border: 1px solid #dee2e6;
	border-radius: 5px;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.pagination .active a {
	background-color: #FFA500;
	color: #fff;
}
</style>
</head>
<body>
<div id="preloder">
	<div class="loader"></div>
</div>


<jsp:include page="navbar.jsp"/>

<jsp:useBean id="productDAO" class="database.ProductDAO"></jsp:useBean>

   <c:if test="${listProductSearchByName.size() == 0}">
	   <div class="container"
			style="margin: 150px; margin-left: 450px; margin-bottom: 50px">
		   <img style="margin-left: 250px" src="images/icons8-pizza-80.png" />
		   <c:if test="${not empty sessionScope.searchKeyword}">
			   <h3>
				   Không tìm thấy kết quả nào cho từ khóa:
				   "<b>${sessionScope.searchKeyword}</b>"
			   </h3>
		   </c:if>
		   <h3 >
			   Hãy thử sử dụng các từ khóa chung chung hơn
		   </h3>
	   </div>





</c:if>

  <c:if test="${listProductSearchByName.size() != 0}">
	<div class="container" style="margin: 150px; ">
        <c:forEach var="p" items="${listProductSearchByName}">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/image/sach_1.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li>
                                <form class="add-to-cart-form" action="AddToCart" method="post" id="addToCartForm">
                                    <input type="hidden" name="productId" value="${p.productId}">
                                    <button class="submit-button" type="submit">
                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                    </button>
                                </form>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">${p.product_name}</a></h6>
                        <h5>${FormatCurrency.formatCurrency(p.price)}</h5>
                    </div>
                </div>
            </div>
        </c:forEach>
	</div>
</c:if>

<div class="container-wrap">
    <h4 style="color: #fac564; text-align: center;">
        CÓ THỂ BẠN CŨNG THÍCH
    </h4>
    <div class="row">
        <c:forEach var="p" items="${listProduct}">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/image/sach_1.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li>
                                <form class="add-to-cart-form" action="AddToCart" method="post" id="addToCartForm">
                                    <input type="hidden" name="productId" value="${p.productId}">
                                    <button class="submit-button" type="submit">
                                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                    </button>
                                </form>
                            </li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">${p.product_name}</a></h6>
                        <h5>${FormatCurrency.formatCurrency(p.price)}</h5>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<footer class="footer spad">
	<jsp:include page="footer.jsp" />
</footer>
<!-- Footer Section End -->
<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>




	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$(".add-to-cart-form")
									.on(
											"submit",
											function(event) {
												event.preventDefault();
												var form = $(this);
												$
														.ajax({
															type : "POST",
															url : form
																	.attr("action"),
															data : form
																	.serialize(),
															success : function(
																	data) {
																alert("Đã đặt hàng thành công!");
																var currentQuantity = parseInt(
																		$(
																				".cart-item-count")
																				.text(),
																		10);
																var newQuantity = currentQuantity + 1;
																$(
																		".cart-item-count")
																		.text(
																				newQuantity);
															},
															error : function(
																	error) {
																console
																		.log(
																				"Error:",
																				error);
																alert("Đã đặt lỗi");
															}
														});
											});
						});
	</script>
</body>
</html>