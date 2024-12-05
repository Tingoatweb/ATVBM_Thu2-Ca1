<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.css">
    <!-- Css Styles -->

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<style>
    .commentarea{
        width: 500px;
        height: 200px;
    }
    .textareacomment{
        margin-right:150px;
        margin-top:10px;
        width: 500px;
        height: 100px;
    }
    .textareacomment:focus{
        box-shadow: 0px 0px 5px 2px rgba(85,160,224,0.75);

    ;

    }
    .btn-send{
        margin-right: 200px;
        font-size: 14px;
        color: #ffffff;
        font-weight: 800;
        text-transform: uppercase;
        display: inline-block;
        padding: 5px 25px 5px;
        background: #7fad39;
        border: none;
    }
    .product__details__pic__item--large{
        border: 1px solid grey;
        padding: 20px;
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
    .product__details__text p {
        margin-bottom: 0;
    }
    .danhgiasanpham b{
        float: left;
    }
    #rating{
        border:none;
        float:left;
        margin-top:10px;
        margin-right: 250px;

    }
    #rating>input{
        display:none;
    }
    /*ẩn input radio - vì chúng ta đã có label là GUI*/
    #rating>label:before{
        margin:5px;
        font-size:1.25em;
        font-family:FontAwesome;
        display:inline-block;
        content:"\f005";
    }
    /*1 ngôi sao*/
    /*#rating>.half:before{*/
    /*    content:"\f089";*/
    /*    position:absolute;*/
    /*}*/
    /*0.5 ngôi sao*/
    #rating>label{
        color:#ddd;
        float:right;
    }
    /*float:right để lật ngược các ngôi sao lại đúng theo thứ tự trong thực tế*/
    /*thêm màu cho sao đã chọn và các ngôi sao phía trước*/
    #rating>input:checked~label, #rating:not(:checked)>label:hover, #rating:not(:checked)>label:hover~label{
        color:#FFD700;
    }
    /* Hover vào các sao phía trước ngôi sao đã chọn*/
    #rating>input:checked+label:hover, #rating>input:checked~label:hover, #rating>label:hover~input:checked~label, #rating>input:checked~label:hover~label{
        color:#FFED85;
    }
    .product__details__rating{
        display:flex;
        align-items: center;
    }
    .Tongquan{
        width: 320px;
        height: 200px;
    }
    .Tongquan > div{
        /*position: absolute;*/
        /*left: 0px;*/
        /*top: 0px;*/
        /*bottom: 0px;*/
        /*background-color: rgb(10, 104, 255);*/
        /*border-radius: 99em;*/

    }
    .chitiettongquan{
        display: flex;
        flex-direction: row;
        height: 20px;
        margin-top: 10px;
    }
    .saodanhgia{
        display: flex;
        flex-direction: row;
    }.thanhdanhgia{
         width: 138px;
         height: 6px;
         background-color: rgb(245, 245, 250);
         position: relative;
         z-index: 1;
         margin-left: 40px;
         margin-right: 10px;
         margin-top: 5px;
         border-radius: 99em;
     }
    .thanhdanhgia > div{
        position: absolute;
        left: 0px;
        top: 0px;
        bottom: 0px;
        /*background-color: rgb(10, 104, 255);*/
        background-color: #7fad39;
        border-radius: 99em;
        width: 50%;
    }
    #personrate{
        margin-top: -2px;
    }
    .reply-comment__input{
        border: 1px solid rgb(238, 238, 238);
        padding: 10px 40px 10px 12px;
        border-radius: 12px;
        width: 90%;
        outline: 0px;
        font-size: 13px;
        line-height: 20px;
        resize: none;
        overflow: hidden;
    }
    .reply-comment__submit{
        z-index: 1;
        width: 17px;
        cursor: pointer;
        margin-bottom: 30px;
        margin-left: -24px;

    }
    /*[class*="reply-comment__wrappe"] {*/
    /*    display: none;*/
    /*}*/

    /*[class*=".reply-comment__wrapper.show"] {*/
    /*    display: block;*/
    /*}*/
    [id*="buttoncomment"]{
        background-color: white;
        border: none;
    }
    .custom-button {
        background-image: url('https://salt.tikicdn.com/ts/upload/1e/49/2d/92f01c5a743f7c8c1c7433a0a7090191.png');
        background-color: white;
        width: 17px; /* Thiết lập chiều rộng phù hợp với kích thước của hình ảnh */
        height: 17px; /* Thiết lập chiều cao phù hợp với kích thước của hình ảnh */
        border: none; /* Loại bỏ border của button */
        background-size: cover; /* Đảm bảo hình ảnh nền đầy đủ */
        background-repeat: no-repeat; /* Ngăn lặp lại hình ảnh nền */
        margin-left: -24px;
        position: relative;
        top: -12px;
        padding-left: 10px;
        padding-right: 10px;

    }
    .emojiPickerButton {
        background-color: white;
        width: 24px;
        height: 24px;
        border: none;
        background-size: cover;
        background-repeat: no-repeat;
        cursor: pointer;
        position: relative;
        margin-right: 5px;
        right:10px;

    }

    .product__pagination a.active {
        /*background-color: #fd7e14;*/
        background-color: #7fad39;
        color: black;
        border: none;
    }

    .dropbtn {
        background-color: transparent;
        color: black;
        padding: 0;
        font-size: 14px;
        border: none;
        cursor: pointer;
        outline: none;
    }

    /* Position the dropdown content */
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    /* Show the dropdown menu on hover */
    .dropdown:hover .dropdown-content {
        display: block;
    }

    /* Style the dropdown links */
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    /* Change color of dropdown links on hover */
    .dropdown-content a:hover {
        background-color: #f1f1f1;
    }

    /* Style the filter and sort section */
    .filter-sort-section {
        display: flex;
        align-items: center;
    }

    .filter-section,
    .sort-section {
        display: flex;
        align-items: center;
    }

    .filter-section {
        margin-right: 10px;
    }

    .filter-sort-text {
        margin: 0 5px;
    }
    .filter-divide-text{
        margin-left: 5px;
    }
    /* Main Container and Button Styles */
    .product-container {
        display: flex;
        overflow-x: auto;
        scroll-behavior: smooth;
        padding: 20px;
        height: 100px; /* Adjust height to fit the thumbnails */
    }

    .product-container::-webkit-scrollbar {
        display: none;
    }

    .product-card {
        flex: 0 0 auto;
        margin-right: 20px; /* Adjust margin as needed */
    }

    .product-image {
        position: relative;
    }

    .product-thumb {
        display: block;
        margin: 0 auto;
    }

    .pre-btn,
    .nxt-btn {
        border: none;
        width: 10vw;
        height: 100%;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #fff 100%);
        cursor: pointer;
        z-index: 8;
    }

    .pre-btn {
        left: 0;
        transform: rotate(180deg);
    }

    .nxt-btn {
        right: 0;
    }

    .pre-btn img,
    .nxt-btn img {
        opacity: 0.2;
    }

    .pre-btn:hover img,
    .nxt-btn:hover img {
        opacity: 1;
    }
    .description-container {
        position: relative;
    }

    .description-text {
        max-height: 250px; /* Giới hạn chiều cao ban đầu của đoạn văn */
        overflow: hidden;
        transition: max-height 0.3s ease;
        line-height: 1.5em; /* Dòng chữ cách đều nhau */
    }

    .description-text.expanded {
        max-height: none; /* Khi mở rộng, bỏ giới hạn chiều cao */
    }

    .read-more-btn,
    .read-less-btn {
        margin-left:220px;
        display: none; /* Ẩn nút ban đầu */
        background-color: white;
        color: blue;
        border: none;
        padding: 10px;
        cursor: pointer;
        margin-top: 10px;
    }

    .read-less-btn {
        display: none; /* Ẩn nút thu gọn */
    }
    .product-thumb {
        cursor: pointer;
        border: 2px solid transparent;
        transition: border-color 0.3s ease;
    }

    .product-thumb.selected {
        border-color:#7fad39; /* Màu viền khi được chọn */
    }


    .quantity-container {
        margin-top: -139px;

        width: 200px;
        height: 50px;
        margin-left: 70px;
        position: relative;
        text-align: center;
        background: #f5f5f5;>
    }

    .quantity-container .btn {
        width: 50px;
        height: 50px;
    }

    .add-to-cart {
        margin-top: 20px;
        display: block;
        width: 100%;
    }
    .quantitytext{
        margin-bottom: 100px;
    }
    .btn.btn-primary.add-to-cart{
        background-color: #7fad39;
        color: #ffffff;
        font-weight: 800;
        text-transform: uppercase;
        display: inline-block;
        padding: 5px 25px 5px;
        border: none;
    }




</style>
<body>
<!-- Page Preloder -->
<%--<div id="preloder">--%>
<%--    <div class="loader"></div>--%>
<%--</div>--%>


<jsp:include page="navbar.jsp"/>
<jsp:useBean id="userdao" class="database.UserDAO"></jsp:useBean>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/hinhnen.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2></h2>
                    <div class="breadcrumb__option">

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6" id="picturearea">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <a data-fslightbox="gallery" href="/image/${detail.image}" id="mainImageLink">
                            <img height="650px" width="300px" class="product__details__pic__item--large" src="/image/${detail.image}" alt="" id="mainImage">
                        </a>
                    </div>
                    <section class="categories">
                        <div class="container">
                            <div class="row">
                                <div class="categories__slider owl-carousel">
                                    <c:forEach items="${proCa}" var="pca">
                                        <div class="product-card">
                                            <div class="product-image">
                                                <a data-fslightbox="gallery" href="/image/${pca.image}" class="thumb-link">
                                                    <img src="/image/${pca.image}" class="product-thumb" alt="Product Image" style="width: 80px; height: 80px;">
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>



            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <%--<<<<<<< HEAD--%>
                    <%--                    <h3>${detail.getProduct_name()}</h3>--%>
                    <%--                    <div class="product__details__rating">--%>
                    <%--                        <i class="fa fa-star"></i>--%>
                    <%--                        <i class="fa fa-star"></i>--%>
                    <%--                        <i class="fa fa-star"></i>--%>
                    <%--                        <i class="fa fa-star"></i>--%>
                    <%--                        <i class="fa fa-star-half-o"></i>--%>
                    <%--                        <span>(18 reviews)</span>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="product__details__price">${detail.getPrice()}</div>--%>
                    <%--                    <p>${detail.getDescription()}</p>--%>
                    <%--                    <div class="product__details__quantity">--%>
                    <%--                        <div class="quantity">--%>
                    <%--                            <div class="pro-qty">--%>
                    <%--                                <input type="text" value="1">--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                    <a href="#" class="primary-btn">ADD TO CARD</a>--%>
                    <%--                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>--%>
                    <%--                    <br>--%>
                    <%--                    <b>Ý kiến sản phẩm</b>--%>
                    <%--=======--%>
                    <form action="RatingProduct" class="RatingPr" method="post">
                        <input type="hidden" name="pid" value=${detail.productId}>
                        <h3>${detail.getProduct_name()}</h3>
                        <c:set var="digitImages" value="${{
    '0': 'img/image/number.0 rating.png',
    '1': 'img/image/number.1 rating.png',
    '2': 'img/image/number.2 rating.png',
    '3': 'img/image/number.3 rating.png',
    '4': 'img/image/number.4 rating.png',
    '5': 'img/image/number.5 rating.png',
    '6': 'img/image/number.6 rating.png',
    '7': 'img/image/number.7 rating.png',
    '8': 'img/image/number.8 rating.png',
    '9': 'img/image/number.9 rating.png'
}}" />

                        <div class="product__details__rating">
                            <c:set var="integerPart" value="${average.intValue()}" />
                            <c:set var="decimalPart" value="${average - integerPart}" />

                            <c:choose>
                                <c:when test="${average == 0}">
                                    <c:forEach var="digit" begin="1" end="5">
                                        <img src="img/image/number not rating.png"  width="26px" height="26px" alt="">
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${integerPart >= 1 && integerPart <= 5 && decimalPart == 0}">
                                        <c:forEach var="digit" begin="1" end="${integerPart}">
                                            <img src="img/image/number.0 rating.png"  width="26px" height="26px" alt="">
                                        </c:forEach>
                                        <c:forEach var="digit" begin="${integerPart + 1}" end="5">
                                            <img src="img/image/number not rating.png"  width="26px" height="26px" alt="">
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${integerPart >= 1 && integerPart <= 5 && decimalPart != 0}">
                                        <c:forEach var="digit" begin="1" end="${integerPart}">
                                            <img src="img/image/number.0 rating.png"  width="26px" height="26px" alt="">
                                        </c:forEach>
                                        <c:set var="decimalPartRounded" value="${Math.round(decimalPart * 10)}" />
                                        <img src="img/image/number.${decimalPartRounded} rating.png" width="26px" height="26px" alt="">
                                        <c:forEach var="digit" begin="${integerPart + 2}" end="5">
                                            <img src="img/image/number not rating.png"  width="26px" height="26px" alt="">
                                        </c:forEach>
                                    </c:if>
                                </c:otherwise>







                            </c:choose>
                            <span>${average}/5</span>
                            <span>(${sumrating} lượt đánh giá)</span>
                        </div>
                        <div class="product__details__price">${detail.getUnitPrice()}</div>
                        <div class="description-container">
                            <p class="description-text">${detail.getDescription()}</p>
                            <button class="read-more-btn">Read More</button>
                            <button class="read-less-btn">Read Less</button>
                        </div>
                        <br>
                        <div class="Tongquan">
                            <b>Tổng quan</b>
                            <br>
                            <div class="chitiettongquan">
                                <div class="saodanhgia">
                                    <c:forEach var="digit" begin="1" end="5">
                                        <img src="img/image/number.0 rating.png"  width="18px" height="18px" alt="">
                                    </c:forEach>
                                </div>
                                <div class="thanhdanhgia" style="width: 100%;height: 10px">
                                    <div class="phantramdanhgia" style="width: ${sumrating !=0 ? (five/sumrating * 100) : 0}%"></div>
                                </div>
                                <span>${five}</span>
                            </div>
                            <div class="chitiettongquan">
                                <div class="saodanhgia">
                                    <c:forEach var="digit" begin="1" end="4">
                                        <img src="img/image/number.0 rating.png"  width="18px" height="18px" alt="">
                                    </c:forEach>
                                    <img src="img/image/number not rating.png"  width="18px" alt="" height="18px">
                                </div>
                                <div class="thanhdanhgia" style="width: 100%;height: 10px">
                                    <div class="phantramdanhgia" style="width: ${sumrating!=0?(four/sumrating * 100):0}%" ></div>

                                </div>
                                <span>${four}</span>
                            </div>

                            <div class="chitiettongquan">
                                <div class="saodanhgia">
                                    <c:forEach var="digit" begin="1" end="3">
                                        <img src="img/image/number.0 rating.png"  width="18px" height="18px" alt="">
                                    </c:forEach>
                                    <c:forEach var="digit" begin="4" end="5">
                                        <img src="img/image/number not rating.png"  width="18px" height="18px" alt="">
                                    </c:forEach>
                                </div>
                                <div class="thanhdanhgia" style="width: 100%;height: 10px">
                                    <div class="phantramdanhgia" style="width: ${sumrating != 0 ? (three/sumrating * 100) : 0}%;" ></div>
                                </div>
                                <span>${three}</span>
                            </div>
                            <div class="chitiettongquan">
                                <div class="saodanhgia">
                                    <c:forEach var="digit" begin="1" end="2">
                                        <img src="img/image/number.0 rating.png"  width="18px" height="18px" alt="">
                                    </c:forEach>
                                    <c:forEach var="digit" begin="3" end="5">
                                        <img src="img/image/number not rating.png"  width="18px" height="18px" alt="">
                                    </c:forEach>
                                </div>
                                <div class="thanhdanhgia" style="width: 100%;height: 10px">
                                    <div class="phantramdanhgia" style="width: ${sumrating != 0 ? (two/sumrating * 100) : 0}%"></div>
                                </div>
                                <span>${two}</span>
                            </div>
                            <div class="chitiettongquan">
                                <div class="saodanhgia">

                                    <img src="img/image/number.0 rating.png"  width="18px" height="18px" alt="">

                                    <c:forEach var="digit" begin="2" end="5">
                                        <img src="img/image/number not rating.png"  width="18px" height="18px" alt="">
                                    </c:forEach>
                                </div>
                                <div class="thanhdanhgia" style="width: 100%;height: 10px">
                                    <div class="phantramdanhgia" style="width: ${sumrating != 0 ? (one/sumrating * 100) : 0}%"></div>
                                </div>
                                <span>${one}</span>
                            </div>
                        </div>
                        <div class="danhgiasanpham">
                            <b >1 Đánh giá sản phẩm</b>
                            <div id="rating">
                                <input type="radio" id="star5" name="rating" value="5" />
                                <label class = "full" for="star5" title="Qúa tuyệt vời - 5 stars" data-content="Qúa tuyệt vời"></label>

                                <%--                        <input type="radio" id="star4half" name="rating" value="4.5" />--%>
                                <%--                        <label class="half" for="star4half" title="Trên cả tuyệt vời - 4.5 stars"></label>--%>

                                <input type="radio" id="star4" name="rating" value="4" />
                                <label class = "full" for="star4" title="Tuyệt vời - 4 stars"></label>

                                <%--                        <input type="radio" id="star3half" name="rating" value="3.5" />--%>
                                <%--                        <label class="half" for="star3half" title="Qúa tốt - 3.5 stars"></label>--%>

                                <input type="radio" id="star3" name="rating" value="3" />
                                <label class = "full" for="star3" title="Tốt - 3 stars"></label>

                                <%--                        <input type="radio" id="star2half" name="rating" value="2.5" />--%>
                                <%--                        <label class="half" for="star2half" title="Khá tốt - 2.5 stars"></label>--%>

                                <input type="radio" id="star2" name="rating" value="2" />
                                <label class = "full" for="star2" title="Tạm được - 2 stars"></label>

                                <%--                        <input type="radio" id="star1half" name="rating" value="1.5" />--%>
                                <%--                        <label class="half" for="star1half" title="Hơi tệ - 1.5 stars"></label>--%>

                                <input type="radio" id="star1" name="rating" value="1" />
                                <label class = "full" for="star1" title="Tệ - 1 star"></label>

                                <%--                        <input type="radio" id="starhalf" name="rating" value="0.5" />--%>
                                <%--                        <label class="half" for="starhalf" title="Qúa tệ - 0.5 stars"></label>--%>
                            </div>
                        </div>

                        <br>
                        <br><br><br>
                        <div>

                            <b>2 Nhận xét sản phẩm</b>

                            <button class="emojiPickerButton" type="button" id="emojiPickerButton">😀</button>
                            <div class="commentarea">
                                <label>
                                    <textarea placeholder="Your message" class="textareacomment"  name="textarearating"></textarea>
                                </label>
                                <br>
                                <button type="submit" class="btn-send">SEND MESSAGE</button>
                            </div>
                        </div>
                </div>

                </form>
                <c:choose>
                    <c:when test="${detail.quantity > 0}">
                        <p class="quantitytext">Quantity</p>
                        <div class="input-group mb-3 d-flex align-items-center quantity-container">
                            <button type="button" class="btn btn-outline-black decrease-quantity">-</button>
                            <input type="text" class="form-control valueQuantity" style="text-align: center" value="1" readonly>
                            <button type="button" class="btn btn-outline-black increase-quantity">+</button>
                        </div>
                        <button type="button"   class="btn btn-primary add-to-cart" data-product-id="${detail.productId}" data-price="${detail.price}">Add to Cart</button>
                    </c:when>
                    <c:otherwise>
                        <h4 class="text-danger">Hết hàng</h4>
                    </c:otherwise>
                </c:choose>

            </div>
            <hr style="margin-right: 7px;width: 1145px;border: 0.5px solid #dcdcdc">
        </div>
        <div class="pdp-mod-filterSort" style="display: flex; justify-content: space-between; margin-right: auto;">
            <span class="title">Product Reviews</span>

            <!-- Filter and Sort Section -->
            <div class="filter-sort-section">
                <span class="filter-sort-text">Filter:</span>
                <div class="dropdown">
                    <button class="dropbtn">All star <i class="fa fa-caret-down"></i></button>
                    <div class="dropdown-content">
                        <a href="#" data-id="${detail.productId}"  data-rating="">All star</a>
                        <a href="#" data-id="${detail.productId}" data-rating="5">5 star</a>
                        <a href="#" data-id="${detail.productId}" data-rating="4">4 star</a>
                        <a href="#" data-id="${detail.productId}" data-rating="3">3 star</a>
                        <a href="#"data-id="${detail.productId}"  data-rating="2">2 star</a>
                        <a href="#" data-id="${detail.productId}" data-rating="1">1 star</a>
                    </div>
                </div>
                <%--                <span class="filter-divide-text">|</span>--%>
                <%--                <span class="filter-sort-text">Sort:</span>--%>
                <%--                <div class="dropdown">--%>
                <%--                    <button class="dropbtn">Newest <i class="fa fa-caret-down"></i></button>--%>
                <%--                    <div class="dropdown-content">--%>
                <%--                        <a href="#">Newest</a>--%>
                <%--                        <a href="#">Oldest</a>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>

        <hr style="width: 1150px;border: 0.5px solid #dcdcdc">
        <div class="phanbinhluan">
            <c:set var="counter" value="0" />

            <c:forEach var="usera" items="${userating}" varStatus="loopStatus">
                <div class="khungbinhluan">
                    <span>${usera.user.name}</span>
                    <span>Đánh giá vào
                <c:choose>
                    <c:when test="${usera.dateRating < 60}">
                        <fmt:formatNumber value="${Math.floor(usera.dateRating)}" type="number" maxFractionDigits="0" /> giây trước
                    </c:when>
                    <c:when test="${usera.dateRating >= 60 and usera.dateRating < 3600}">
                        <fmt:formatNumber value="${Math.floor(usera.dateRating / 60)}" type="number" maxFractionDigits="0" /> phút trước
                    </c:when>
                    <c:when test="${usera.dateRating >= 3600 and usera.dateRating < 3600 * 24}">
                        <fmt:formatNumber value="${Math.floor(usera.dateRating / 3600)}" type="number" maxFractionDigits="0" /> giờ trước
                    </c:when>
                    <c:when test="${usera.dateRating >= 3600 * 24 and usera.dateRating < 3600 * 24 * 31}">
                        <fmt:formatNumber value="${Math.floor(usera.dateRating / (3600 * 24))}" type="number" maxFractionDigits="0" /> ngày trước
                    </c:when>
                    <c:when test="${usera.dateRating >= 3600 * 24 * 31 and usera.dateRating < 3600 * 24 * 31 * 12}">
                        <fmt:formatNumber value="${Math.floor(usera.dateRating / (3600 * 24 * 31))}" type="number" maxFractionDigits="0" /> tháng trước
                    </c:when>
                    <c:when test="${ usera.dateRating >= 3600 * 24 * 31 * 12}">
                        <fmt:formatNumber value="${Math.floor(usera.dateRating / (3600 * 24 * 31 * 12))}" type="number" maxFractionDigits="0" /> năm trước
                    </c:when>
                </c:choose>
            </span>
                    <c:forEach var="digit" begin="1" end="${Math.round(usera.ratingstar)}">
                        <img id="personrate" src="img/image/number.0 rating.png"  width="14px" height="14px" alt="">
                    </c:forEach>
                    <br>

                    <span>${usera.ratingtext}</span><br>
                    <button id="buttoncomment${loopStatus.index}"><i class="fa-regular fa-comment"></i> Bình luận</button>
                    <div class="reply-comment__wrapper${loopStatus.index}">
                        <form action="CommentRating" class="CommentRa" method="post">
                            <div style="min-height: 40px;">
                                <input type="hidden" name="productid" value="${usera.product.productId}">
                                <input type="hidden" name="ratingid" value="${usera.ratingId}">
                                <input type="hidden" name="ratingstar" value="${usera.ratingstar}">
                                <input type="hidden" name="ratingtext" value="${usera.ratingtext}">


                                <textarea placeholder="Viết bình luận" class="reply-comment__input" name="detailcomment" id="replyCommentInput" rows="1" style="height: 40px;"></textarea>
                                <button type="submit" class="custom-button"></button>
                            </div>
                        </form>
                    </div>
                    <hr>

                </div>
            </c:forEach>
        </div>
    </div>

</section>


<c:set var="pageR" value="${sessionScope.pageR}" />
<c:set var="numR" value="${sessionScope.numR}" />
<div class="product__pagination" style="padding-left: 600px; gap: 100px; margin-top: -100px;">
    <c:set var="productid" value="${sessionScope.productid}" />
    <c:set var="ratingstr" value="${param.star != null ? param.star : ''}" />
    <c:set var="displayPages" value="3" />
    <c:set var="halfDisplay" value="${displayPages / 2}" />
    <c:set var="startPage" value="${pageR - halfDisplay}" />
    <c:set var="endPage" value="${pageR + halfDisplay}" />

    <c:if test="${startPage < 1}">
        <c:set var="startPage" value="1" />
        <c:set var="endPage" value="${startPage + displayPages - 1}" />
    </c:if>

    <c:if test="${endPage > numR}">
        <c:set var="endPage" value="${numR}" />
        <c:set var="startPage" value="${endPage - displayPages + 1}" />
        <c:if test="${startPage < 1}">
            <c:set var="startPage" value="1" />
        </c:if>
    </c:if>

    <div class="product__pagination" style="padding-left: 600px;">
        <c:if test="${pageR > 1}">
            <c:url value="/Shopdetails" var="prevPageUrl">
                <c:param name="id" value="${productid}" />
                <c:param name="star" value="${ratingstr}" />
                <c:param name="pageR" value="${pageR - 1}" />
            </c:url>
            <a href="${prevPageUrl}" class="pagination-link" data-page="${pageR - 1}" data-star="${ratingstr}">&lt;</a>
        </c:if>

        <c:forEach begin="${startPage}" end="${endPage}" var="i">
            <c:url value="/Shopdetails" var="pageUrl">
                <c:param name="id" value="${productid}" />
                <c:param name="star" value="${ratingstr}" />
                <c:param name="pageR" value="${i}" />
            </c:url>
            <a href="${pageUrl}" class="pagination-link <c:if test='${i == pageR}'>active</c:if>'" data-page="${i}" data-star="${ratingstr}">${i}</a>
        </c:forEach>

        <c:if test="${endPage < numR}">
            ...
        </c:if>

        <c:if test="${endPage < numR}">
            <c:url value="/Shopdetails" var="lastPageUrl">
                <c:param name="id" value="${productid}" />
                <c:param name="star" value="${ratingstr}" />
                <c:param name="pageR" value="${numR}" />
            </c:url>
            <a href="${lastPageUrl}" class="pagination-link" data-page="${numR}" data-star="${ratingstr}">${numR}</a>
        </c:if>

        <c:if test="${pageR < numR}">
            <c:url value="/Shopdetails" var="nextPageUrl">
                <c:param name="id" value="${productid}" />
                <c:param name="star" value="${ratingstr}" />
                <c:param name="pageR" value="${pageR + 1}" />
            </c:url>
            <a href="${nextPageUrl}" class="pagination-link" data-page="${pageR + 1}" data-star="${ratingstr}">&gt;</a>
        </c:if>
    </div>
</div>


<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product" style="margin-top: 50px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Related Product</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Crab Pool Security</a></h6>
                        <h5>$30.00</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related Product Section End -->

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.min.js"></script>
<script src="https://cdn.botpress.cloud/webchat/v2/inject.js"></script>

<script src="https://mediafiles.botpress.cloud/1d0997ec-87ba-4ea8-8a5c-c2fba00d5019/webchat/v2/config.js"></script>

<style>
    .ykiensanpham{
        width: 200px;
        height: 50px;
        border: 1px solid black;
        display: block;
        background-color: white;
        z-index: 999;
        font-size: 10px;
        .ykiensanpham::placeholder{
            border:3px solid #82caea;
        }
        .side-btn{
            font-size: 14px;
            color: #ffffff;
            font-weight: 800;
            text-transform: uppercase;
            display: inline-block;
            /* padding: 13px 30px 12px; */
            background: #7fad39;
            border: none;
        }
    }

</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const descriptionText = document.querySelector(".description-text");
        const readMoreBtn = document.querySelector(".read-more-btn");
        const readLessBtn = document.querySelector(".read-less-btn");

        // Kiểm tra nếu đoạn văn dài hơn 10 dòng
        function isTextOverflowing(element) {
            return element.scrollHeight > element.clientHeight;
        }

        // Kiểm tra chiều cao đoạn văn để hiển thị hoặc ẩn nút
        if (descriptionText.scrollHeight > 250) { // 10 dòng * line-height * font-size (16px)
            readMoreBtn.style.display = "block";
        }

        readMoreBtn.addEventListener("click", function () {
            descriptionText.classList.add("expanded");
            readMoreBtn.style.display = "none";
            readLessBtn.style.display = "block";
        });

        readLessBtn.addEventListener("click", function () {
            descriptionText.classList.remove("expanded");
            readMoreBtn.style.display = "block";
            readLessBtn.style.display = "none";
        });
        const mainImage = document.getElementById("mainImage");
        const mainImageLink = document.getElementById("mainImageLink");
        const thumbnails = document.querySelectorAll(".product-thumb");

        // Event listener to show lightbox for the main image
        mainImageLink.addEventListener("click", function(event) {
            event.preventDefault(); // Prevent the default anchor behavior
            mainImageLink.click(); // Trigger the lightbox
        });

        thumbnails.forEach(thumbnail => {
            thumbnail.addEventListener("click", function() {
                // Change the main image
                mainImage.src = this.src;
                mainImageLink.href = this.parentElement.href;

                // Remove border from previously selected image
                thumbnails.forEach(thumb => thumb.classList.remove("selected"));

                // Add border to the selected image
                this.classList.add("selected");
            });
        });
    });

</script>
<script>
    $(document).ready(function() {
        // Update main image and highlight selected thumbnail
        $(".product-thumb").click(function() {
            let src = $(this).attr("src");
            $("#mainImage").attr("src", src);
            $(".product-thumb").removeClass("selected");
            $(this).addClass("selected");
        });

        // Increase and decrease quantity
        $(".increase-quantity").click(function() {
            let input = $(this).siblings(".valueQuantity");
            let currentQuantity = parseInt(input.val(), 10);
            input.val(currentQuantity + 1);
        });

        $(".decrease-quantity").click(function() {
            let input = $(this).siblings(".valueQuantity");
            let currentQuantity = parseInt(input.val(), 10);
            if (currentQuantity > 1) {
                input.val(currentQuantity - 1);
            }
        });

        // Add to cart button
        $(".add-to-cart").click(function() {
            let productId = $(this).data("product-id");
            let price = $(this).data("price");
            let quantity = parseInt($(".valueQuantity").val(), 10);

            $.ajax({
                type: "POST",
                url: "AddToCartDetail",
                data: {
                    productId: productId,
                    quantity: quantity
                },
                success: function(response) {
                    alert("Cập nhật giỏ hàng thành công!");
                    // Cập nhật số lượng trong giỏ hàng trên giao diện
                    $(".cart-item-count").text(response.totalQuantity);
                },
                error: function(error) {
                    console.log("Error: ", error);
                    alert("Có lỗi xảy ra khi cập nhật giỏ hàng");
                }
            });
        });
    });

</script>
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

    // Set the initial button text and Font Awesome icon


    // Enable Dark Reader when the page loads

</script>
<script>
    // Function to set the rating based on a given value
    function calcRate(r) {
        const f = Math.floor(r); // Ensure integer part using Math.floor
        const id = 'star' + f + (r % 1 ? 'half' : ''); // More concise ternary for half star

        if (id) {
            document.getElementById(id).checked = true;

        }
    }

    //No JS

    <%--const starInputs = document.querySelectorAll('#rating input[type="radio"]');--%>

    <%--starInputs.forEach(input => {--%>
    <%--    input.addEventListener('change', function() {--%>
    <%--        if (this.checked) {--%>
    <%--            const descriptionElement = document.querySelector(`label[for="${this.id}"] .label-description`);--%>
    <%--            const description = descriptionElement.dataset.content;--%>
    <%--            console.log(`Rating: ${description}`); // Output to console--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>



    // Add event listener to each radio input
    <%--    const ratingInputs = document.querySelectorAll('#rating input[type="radio"]');--%>
    <%--    ratingInputs.forEach(input => {--%>
    <%--    input.addEventListener('change', event => {--%>
    <%--        const ids = event.target.id;--%>
    <%--        const values = event.target.value;--%>
    <%--        console.log(`Clicked input ID: ${ids}, Value: ${values}`);--%>
    <%--    });--%>
    <%--});--%>

</script>
<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>--%>
<%--<script src="js/inputEmoji.js"></script>--%>
<%--<script>--%>
<%--    $(function () {--%>
<%--        $('.reply-comment__input').emoji({place: 'after'});--%>
<%--    })--%>
<%--</script>--%>
<script src="js/vanillaEmojiPicker.js"></script>
<script>
    // Khởi tạo EmojiPicker
    new EmojiPicker({
        trigger: [
            {
                selector: '.emojiPickerButton',
                insertInto: '.textareacomment'
            }
        ],
        closeButton: true

    });
</script>
<script>
    $(document).ready(function() {


        // Handle the emoji picker button click
        // $('#emojiPickerButton').click(function() {
        //     $(".reply-comment__input").data("emojioneArea").showPicker();
        // });

        // Store the selected star rating globally
        let selectedStar = '';

        // Handle dropdown selection
        $('.dropdown-content a').click(function(event) {
            event.preventDefault();
            selectedStar = $(this).data('rating');
            var text = $(this).text();
            $('.dropbtn').text(text); // Update dropbtn text
            var productid = $(this).data('id');

            // Load reviews based on selected star rating and first page
            loadRatings(productid, selectedStar, 1);
        });

        var initialProductId = $('.dropdown-content a:first-child').data('id'); // Get the initial product ID
        loadRatings(initialProductId, '', 1); // Load all reviews initially

        // Function to load reviews based on star rating and page number
        function loadRatings(productid, star, pageR) {
            $.ajax({
                url: '/Shopdetails',
                type: 'GET',
                data: {
                    id: productid,
                    star: star,
                    pageR: pageR
                },
                success: function(response) {
                    var newRatings = $(response).find('.phanbinhluan').html();
                    $('.phanbinhluan').html(newRatings);

                    var newPagination = $(response).find('.product__pagination').html();
                    $('.product__pagination').html(newPagination);

                    // Re-bind pagination links
                    bindPaginationLinks(productid, star);
                    updateActivePage(pageR);

                    // Re-bind form submission for CommentRa
                    bindCommentFormSubmission();

                    // Scroll to the top of the ratings section after updating content
                    $('html, body').animate({ scrollTop: $('.phanbinhluan').offset().top }, 'fast');
                },
                error: function(xhr, status, error) {
                    console.error('Error loading ratings:', error);
                    Swal.fire({
                        icon: 'error',
                        title: 'An error occurred while loading reviews.',
                        timer: 1500,
                        showConfirmButton: false,
                        position: 'top-end',
                        backdrop: false,
                        timerProgressBar: true
                    });
                }
            });
        }

        // Function to bind events to pagination links
        function bindPaginationLinks(productid, star) {
            $(document).off('click', '.pagination-link').on('click', '.pagination-link', function(e) {
                e.preventDefault();
                var pageR = $(this).data('page');
                loadRatings(productid, star, pageR);
            });
        }

        // Function to update the active page in pagination
        function updateActivePage(pageR) {
            $('.pagination-link').removeClass('active');
            $('.pagination-link[data-page="' + pageR + '"]').addClass('active');
        }

        // Initial binding of pagination links
        bindPaginationLinks(initialProductId, '');

        // Function to bind form submission for CommentRa using event delegation
        function bindCommentFormSubmission() {
            $(document).off('submit', '.CommentRa').on('submit', '.CommentRa', function(e) {
                e.preventDefault(); // Prevent default form submission
                let form = $(this);
                let productid = form.find('[name="productid"]').val(); // Assuming there's a hidden input with productid

                $.ajax({
                    url: form.attr('action'), // Replace with your servlet URL
                    type: 'POST',
                    data: form.serialize(),
                    success: function(response) {
                        const newRatings = $(response).find('.phanbinhluan').html();
                        const newPagings = $(response).find('.product__pagination').html();
                        $('.dropbtn').text("All star"); // Update dropbtn text

                        $('.phanbinhluan').html(newRatings);
                        $('.product__pagination').html(newPagings);

                        // Re-bind pagination links
                        bindPaginationLinks(productid, selectedStar);
                        updateActivePage(1); // Set page 1 as active

                        // Re-bind form submission for CommentRa
                        bindCommentFormSubmission();

                        // Scroll to the top of the ratings section after updating content
                        $('html, body').animate({ scrollTop: $('.phanbinhluan').offset().top }, 'fast');
                    },
                    error: function(xhr, status, error) {
                        console.error('Error loading ratings:', error);
                    }
                });
            });
        }

        // Initial binding of form submission for CommentRa
        bindCommentFormSubmission();
    });

    // Script for RatingPr form submission
    $(document).ready(function() {
        function updateActivePage(pageR) {
            $('.pagination-link').removeClass('active');
            $('.pagination-link[data-page="' + pageR + '"]').addClass('active');
        }
        $(document).off('submit', '.RatingPr').on('submit', '.RatingPr', function(e) {
            e.preventDefault(); // Prevent default form submission
            let form = $(this);

            $.ajax({
                url: form.attr("action"), // Replace with your servlet URL
                type: 'POST',
                data: form.serialize(),
                success: function(response) {
                    const newRatings = $(response).find('.phanbinhluan').html();
                    const newPagings = $(response).find('.product__pagination').html();
                    $('.dropbtn').text("All star");
                    $('.phanbinhluan').html(newRatings);
                    $('.product__pagination').html(newPagings);
                    updateActivePage(1); // Set page 1 as active

                    // Scroll to the top of the ratings section after updating content
                    $('html, body').animate({ scrollTop: $('.phanbinhluan').offset().top }, 'fast');
                },
                error: function(xhr, status, error) {
                    console.error('Error loading ratings:', error);
                }
            });
        });
    });
</script>
<script src="js/fslightbox.js"></script>


</body>

</html>
<%--document.addEventListener('DOMContentLoaded', function () {--%>
<%--const inputs = document.querySelectorAll('.container__items input[type="radio"]');--%>

<%--inputs.forEach(input => {--%>
<%--input.addEventListener('change', event => {--%>
<%--const id = event.target.id;--%>
<%--const labelFor = document.querySelector(`label[for="${id}"]`);--%>
<%--const labelContent = labelFor.querySelector('.label-description').getAttribute('data-content');--%>
<%--console.log(`Clicked input value: ${labelContent}`);--%>
<%--});--%>
<%--});--%>
<%--});--%>