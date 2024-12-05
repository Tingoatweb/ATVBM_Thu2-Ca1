<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Đăng ký</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>
<!-- Sign up form -->
<section class="signup">
    <div class="container">
        <div class="signup-content">
            <div class="signup-form">
                <h2 class="form-title">Tạo tài khoản</h2>
                <form action="RegisterForm" method="post" class="register-form" id="register-form">
                    <div style="text-align: center;color: red;font-size: 12px" class="red"  id="baoLoi1">${errorBean1.getError()}</div>
                    <div class="form-group">
                        <label for="usernamere"><i class="zmdi zmdi-account material-icons-name"></i></label>
                        <input type="text" name="usernamere" id="usernamere" placeholder="Nhập username của bạn"/>
                    </div>
                    <div class="form-group">
                        <label for="namere"><i class="zmdi zmdi-account material-icons-name"></i></label>
                        <input type="text" name="namere" id="namere" placeholder="Nhập tên của bạn"/>
                    </div>
                    <div style="text-align: center;color: red;font-size: 12px" class="red" id="baoLoi2">${errorBean2.getError()} </div>
                    <div class="form-group">
                        <label for="emailre"><i class="zmdi zmdi-email"></i></label>
                        <input type="email" name="emailre" id="emailre" placeholder="Nhập Email của bạn"/>
                    </div>
                    <div style="text-align: center;color: red;font-size: 12px" class="red" id="baoLoi3">${errorBean3.getError()} </div>
                    <div class="form-group">
                        <label for="passwordre"><i class="zmdi zmdi-lock"></i></label>
                        <input type="password" name="passwordre" id="passwordre" placeholder="Nhập mật khẩu của bạn"/>
                    </div>
                    <div class="form-group">
                        <label for="enterThePasswordre"><i class="zmdi zmdi-lock-outline"></i></label>
                        <input type="password" name="enterThePasswordre" id="enterThePasswordre" placeholder="Nhập lại mật khẩu của bạn"/>
                    </div>
                    <span class="social-label">Hoặc đăng kí với </span>
                    <ul class="socials">
                        <li><a href="https://www.facebook.com/v20.0/dialog/oauth?&client_id=1253447572292759&redirect_uri=http://localhost:8080/LoginToIndexByFB&scope=email"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                        <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                        <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/LoginToIndexByGg&response_type=code
		   &client_id=696956091388-hcpd2qt40e9bklgu9qqsm5q8v4ca7lbm.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                    </ul>
                    <div class="form-group">
                        <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                        <label for="agree-term" class="label-agree-term"><span><span></span></span>Tôi đồng ý vơi tắt cả   <a href="#" class="term-service">điều khoản dịch vụ</a></label>
                    </div>
                    <div class="form-group form-button">
                        <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                    </div>
                </form>
            </div>
            <div class="signup-image">
                <figure><img src="/img/signup-image.jpg" alt="sing up image"></figure>
                <a href="Login" class="signup-image-link">Đã có tài khoản? Đăng nhập</a>
            </div>
        </div>
    </div>
</section>
<script src="/js/jquery.min.login.js"></script>
</body>
</html>