<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Forget password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="css/styleforlogin.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <link rel="icon" type="image/png" size="50" href="img/icons8-book-64.png">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Font Icon -->
    <link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>
<section class="sign-in">
    <div class="container">
        <div class="signin-content">
            <div class="signin-image">
                <figure><img src="/img/signin-image.jpg" alt="sing up image"></figure>
                <a href="Login" class="signup-image-link">Đăng nhập!</a>
            </div>

            <div class="signin-form">
                <p class="form-title" style="font-size: 35px; color: black; font-weight: bold">Cấp lại mật khẩu</p>
                <form class="reset-password-form" action="ValidateOtp" method="post">
                    <h4 class="mb-3">Nhập mã OTP</h4>
                    <p class="mb-3" style="color: #a71d2a; font-weight: bold;">
                        Nhập mã OTP chúng tôi đã gửi qua mail của bạn
                    </p>
                    <div class="form-group">
                        <label for="emailForget"><i class="fa fa-envelope"></i></label>
                        <input type="text" name="otp" id="emailForget"  placeholder="Mã OTP" required/>
                    </div>
                    <input type="submit" name="" id="signin" class="form-submit" value="Cấp lại mật khẩu"/>
                    <button onclick="event.preventDefault(); window.location.href='./ForgotPass';" class="btn btn-success">
                        Quay lại
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>
<%--<div class="container-fluid">--%>
<%--    <div class="row">--%>
<%--        <div class="col-lg-6 col-md-6 form-container">--%>
<%--            <div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box">--%>

<%--                <div class="reset-form d-block">--%>
<%--                    <form class="reset-password-form" action="ForgotPassword" method="post">--%>
<%--                        <h4 class="mb-3">Cấp lại mật khẩu cho bạn</h4>--%>
<%--                        <p>Thực hiện việc thay đổi mật khẩu theo 3 bước sau. Điều này sẽ giúp bạn bảo mật an toàn mật--%>
<%--                            khẩu</p>--%>
<%--                        <ol class="list-unstyled">--%>
<%--                            <li><span>1. </span>Nhập địa chỉ email của bạn</li>--%>
<%--                            <li><span>2. </span>Hệ thống của chúng tôi sẽ gửi mã OTP tới email của bạn</li>--%>
<%--                            <li><span>3. </span>Nhập mã OTP bạn nhận được</li>--%>
<%--                        </ol>--%>
<%--                        <div class="form-input">--%>
<%--                            <span><i class="fa fa-envelope"></i></span>--%>
<%--                            <input name="emailForget" type="email" placeholder="Email Address" required>--%>
<%--                        </div>--%>
<%--                        <div class="mb-6">--%>
<%--                            <button type="submit" class="btn">Gửi mã OTP</button>--%>
<%--                            <button onclick="event.preventDefault(); window.location.href='./Login';"--%>
<%--                                    class="btn btn-success">Quay lại--%>
<%--                            </button>--%>

<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--                &lt;%&ndash;                <div class="reset-confirmation d-none">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    <div class="mb-4">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <h4 class="mb-3">Link was sent</h4>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <h6 class="text-white">Please, check your inbox</h6>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    <div>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <a href="logintwo.jsp">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                            <button type="submit" class="btn">Login Now</button>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        </a>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col-lg-6 col-md-6 d-none d-md-block image-container"></div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script type="text/javascript">--%>
<%--    function PasswordReset() {--%>
<%--        $('form.reset-password-form').on('submit', function (e) {--%>
<%--            e.preventDefault();--%>
<%--            $('.reset-form')--%>
<%--                .removeClass('d-block')--%>
<%--                .addClass('d-none');--%>
<%--            $('.reset-confirmation').addClass('d-block');--%>
<%--        });--%>
<%--    }--%>

<%--    window.addEventListener('load', function () {--%>
<%--        PasswordReset();--%>
<%--    });--%>
<%--</script>--%>
<script src="/js/jquery.min.login.js"></script>
</body>
</html>
