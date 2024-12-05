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
                <a href="Register" class="signup-image-link">Chưa có tài khoản ? Tạo tài khoản!</a>
            </div>

            <div class="signin-form">
                <h2 class="form-title">Đăng nhập</h2>
                <div style="text-align: center;color: red" class="red" id="baoLoi1">${errorBean.getError()} </div>
                <form action="LoginForm" method="post" class="register-form" id="login-form">
                    <div class="form-group">
                        <label for="usernamelo"><i class="zmdi zmdi-account material-icons-name"></i></label>
                        <input type="text" name="usernamelo" id="usernamelo" placeholder="Nhập tên của bạn"/>
                    </div>
                    <div class="form-group">
                        <label for="passwordlo"><i class="zmdi zmdi-lock"></i></label>
                        <input type="password" name="passwordlo" id="passwordlo" placeholder="Mật khẩu"/>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                        <label for="remember-me" class="label-agree-term"><span><span></span></span>Ghi nhớ tài khoản ?</label>

                    </div>
                    <div class="form-group form-button">
                        <input type="submit" name="signin" id="signin" class="form-submit" value="Đăng nhập"/>
                        <a href="./ForgotPass" style="color: black; padding-left: 10px">Quên mật khẩu?</a>
                    </div>
                </form>
                <div class="social-login">
                    <span class="social-label">Hoặc đăng nhập với </span>
                    <ul class="socials">
                        <li><a href="https://www.facebook.com/v20.0/dialog/oauth?&client_id=1253447572292759&redirect_uri=http://localhost:8080/LoginToIndexByFB&scope=email"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                        <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                        <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/LoginToIndexByGg&response_type=code
		   &client_id=696956091388-hcpd2qt40e9bklgu9qqsm5q8v4ca7lbm.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<%--</div>--%>

<!-- JS -->
<script src="/js/jquery.min.login.js"></script>
</body>
</html>