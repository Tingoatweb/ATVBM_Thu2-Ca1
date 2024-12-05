<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng nhập</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>

<%--<div class="main">--%>

<!-- Sign up form -->
<%--	<section class="signup">--%>
<%--		<div class="container">--%>
<%--			<div class="signup-content">--%>
<%--				<div class="signup-form">--%>
<%--					<h2 class="form-title">Sign up</h2>--%>
<%--					<form method="POST" class="register-form" id="register-form">--%>
<%--						<div class="form-group">--%>
<%--							<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>--%>
<%--							<input type="text" name="name" id="name" placeholder="Your Name"/>--%>
<%--						</div>--%>
<%--						<div class="form-group">--%>
<%--							<label for="email"><i class="zmdi zmdi-email"></i></label>--%>
<%--							<input type="email" name="email" id="email" placeholder="Your Email"/>--%>
<%--						</div>--%>
<%--						<div class="form-group">--%>
<%--							<label for="pass"><i class="zmdi zmdi-lock"></i></label>--%>
<%--							<input type="password" name="pass" id="pass" placeholder="Password"/>--%>
<%--						</div>--%>
<%--						<div class="form-group">--%>
<%--							<label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>--%>
<%--							<input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>--%>
<%--						</div>--%>
<%--						<div class="form-group">--%>
<%--							<input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />--%>
<%--							<label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>--%>
<%--						</div>--%>
<%--						<div class="form-group form-button">--%>
<%--							<input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>--%>
<%--						</div>--%>
<%--					</form>--%>
<%--				</div>--%>
<%--				<div class="signup-image">--%>
<%--					<figure><img src="/img/signup-image.jpg" alt="sing up image"></figure>--%>
<%--					<a href="#" class="signup-image-link">I am already member</a>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</section>--%>

<!-- Sing in  Form -->
<section class="sign-in">
    <div class="container">
        <div class="signin-content">
            <div class="signin-image">
                <figure><img src="/img/signin-image.jpg" alt="sing up image"></figure>
            </div>

            <div class="signin-form">
                <h2 class="form-title">Đăng kí mật khẩu mới</h2>
                <div style="text-align: center;color: red" class="red" id="baoLoi1">${errorBean.getError()} </div>
                <form action="NewPassword" method="post" class="register-form" id="login-form">
                    <div class="form-group">
                        <label for="passwordlo"><i class="zmdi zmdi-lock"></i></label>
                        <input type="password" name="newpassword" id="usernamelo" placeholder="Mật khẩu mới"/>
                    </div>
                    <div class="form-group">
                        <label for="passwordlo"><i class="zmdi zmdi-lock"></i></label>
                        <input type="password" name="enterThePassword" id="passwordlo" placeholder="Nhập lại mật khẩu"/>
                    </div>

                    <div class="form-group form-button">
                        <input type="submit" name="signin" id="signin" class="form-submit" value="Tạo mật khẩu mới"/>
                    </div>
                </form>

            </div>
        </div>
    </div>
</section>

<%--</div>--%>

<!-- JS -->
<script src="/js/jquery.min.login.js"></script>
</body>
</html>