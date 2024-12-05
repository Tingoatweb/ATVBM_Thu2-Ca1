<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="css/styleforlogin.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/yesiamrocks/cssanimation.io@1.0.3/cssanimation.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" size="50" href="img/icons8-book-64.png">

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 col-md-6 form-container">
            <div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box text-center">
                <div class="logo mt-5 mb-3">
                </div>
                <div class="heading mb-3">
                    <h4 class="cssanimation sequence leFadeInLeft">Login into your account</h4>
                </div>
                <div style="text-align: center;color: red" class="red" id="baoLoi1">${errorBean.getError()} </div>
                <form action="LoginForm" method="post">
                    <div class="form-input">
                        <span><i class="fa fa-envelope"></i></span>
                        <input name="usernamelo" type="text" placeholder="Tên đăng nhập" required>
                    </div>
                    <div class="form-input">
                        <span><i class="fa fa-lock"></i></span>
                        <input name="passwordlo" type="password" placeholder="Mật khẩu" required>
                    </div>
                    <div class="row mb-3">
                        <div class="col-6 d-flex">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cb1">
                                <label class="custom-control-label text-white" for="cb1">Remember me</label>
                            </div>
                        </div>
                        <div class="col-6 text-right">
                            <a href="./ForgotPass" class="forget-link">Forget password</a>
                        </div>
                    </div>
                    <div class="text-left mb-3">
                        <button type="submit" class="btn">Login</button>
                    </div>
                    <div class="text-white mb-3">or login with</div>
                    <div class="row mb-3">
                        <div class="col-4">
                            <a href="https://www.facebook.com/v20.0/dialog/oauth?&client_id=1253447572292759&redirect_uri=http://localhost:8080/LoginToIndexByFB&scope=email" class="btn btn-block btn-social btn-facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </div>
                        <div class="col-4">
                            <a class="btn btn-block btn-social btn-google" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/LoginToIndexByGg&response_type=code
		   &client_id=696956091388-hcpd2qt40e9bklgu9qqsm5q8v4ca7lbm.apps.googleusercontent.com&approval_prompt=force" id="LoginToIndexByGg"><i class="fa fa-google"></i></a>
                            </a>
                        </div>
                        <div class="col-4">
                            <a href="" class="btn btn-block btn-social btn-twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </div>
                    </div>
                    <div class="text-white">Don't have an account?
                        <a href="./Register" class="register-link">Register here</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-lg-6 col-md-6 d-none d-md-block image-container"></div>
    </div>
</div>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/gh/yesiamrocks/cssanimation.io@1.0.3/letteranimation.min.js"></script>

</body>
</html>
