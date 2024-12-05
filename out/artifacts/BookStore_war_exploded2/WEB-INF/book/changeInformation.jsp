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
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-6 col-md-6 form-container">
			<div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box text-center">
				<div class="logoforlogin">
					<div class="thumbnail"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/169963/hat.svg"
												width="150px" height="150px"></div>
				</div>
				<div class="heading mb-3">
					<h4>Thay đổi thông tin cá nhân của bạn</h4>
				</div>
				<div style="text-align: center;" class="red" id="baoLoi1">${errorBean.getError()}</div>
				<div class="red" id="baoLoi2">${errorBean.getError()} </div>

				<form action="changeInformation" method="post">

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="name">Name</label>
						<div class="col-sm-10">
							<div class="input-group input-group-merge">
								<span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
								<input type="text" class="form-control" id="name" name="name" required="required">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" >Giới tính</label>
						<div class="col-sm-10">
							<div class="form-check">
								<input type="radio" class="form-check-input" id="nam"
									   name="gender" value="Nam" required="required"> <label
									class="form-check-label" for="nam">Nam</label>
							</div>
							<div class="form-check">
								<input type="radio" class="form-check-input" id="nu"
										name="gender" value="Nữ" required="required"> <label
										class="form-check-label" for="nu">Nữ</label>
							</div>
							<div class="form-check">
								<input type="radio" class="form-check-input" id="khac"
									 name="gender" value="Khác" required="required"> <label
									class="form-check-label" for="khac">Khác</label>
								</div>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="email">Email</label>
						<div class="col-sm-10">
							<div class="input-group input-group-merge">
								<span class="input-group-text"><i class="bx bx-envelope"></i></span>
								<input name="email" type="email" id="email" class="form-control" placeholder="john.doe" aria-label="john.doe" aria-describedby="basic-icon-default-email2" fdprocessedid="kb8ces">
								<span id="basic-icon-default-email2" class="input-group-text">@example.com</span>
							</div>
							<div class="form-text"> You can use letters, numbers &amp; periods </div>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 form-label" for="phoneNumber">Phone No</label>
						<div class="col-sm-10">
							<div class="input-group input-group-merge">
								<span id="basic-icon-default-phone2" class="input-group-text"><i class="bx bx-phone"></i></span>
								<input name="phoneNumber" type="number" id="phoneNumber" class="form-control phone-mask" placeholder="658 799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2" fdprocessedid="1fu03d">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 form-label" for="basic-icon-default-message">Ngày Sinh</label>
						<div class="col-sm-10">
							<div class="input-group input-group-merge">
								<span id="basic-icon-default-message2" class="input-group-text"><i class="bx bx-comment"></i></span>
								<input name="birthday" type="date" id="basic-icon-default-message" placeholder="Ngày sinh"  required>
							</div>
						</div>
					</div>
					<div class="row justify-content-end">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary" fdprocessedid="mg1n0a">Send</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="col-lg-6 col-md-6 d-none d-md-block image-container"></div>
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