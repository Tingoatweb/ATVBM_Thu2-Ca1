<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="util.FormatCurrency"%>
<%@page isELIgnored="false" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
  />

  <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

  <meta name="description" content="" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="../assetsForAdmin/assets/img/favicon/favicon.ico" />

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet"
  />

  <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/fonts/boxicons.css" />

  <!-- Core CSS -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/core.css" class="template-customizer-core-css" />
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
  <link rel="stylesheet" href="../assetsForAdmin/assets/css/demo.css" />

  <!-- Vendors CSS -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="../assetsForAdmin/assets/vendor/js/helpers.js"></script>

  <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
  <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
  <script src="../assetsForAdmin/assets/js/config.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script type="text/javascript" charset="UTF-8" src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->
    <jsp:include page="menu.jsp"/>

    <!-- / Menu -->

    <!-- Layout container -->
    <div class="layout-page">
      <!-- Navbar -->

      <jsp:include page="navbar.jsp"/>

      <!-- / Navbar -->

      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y">
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Account Settings /</span> Account</h4>

          <div class="row">
            <div class="col-md-12">
              <ul class="nav nav-pills flex-column flex-md-row mb-3">
                <li class="nav-item">
                  <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i> Account</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="pages-account-settings-notifications.html"
                  ><i class="bx bx-bell me-1"></i> Notifications</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="pages-account-settings-connections.html"
                  ><i class="bx bx-link-alt me-1"></i> Connections</a
                  >
                </li>
              </ul>
              <div class="card mb-4">
                <h5 class="card-header">Profile Details</h5>
                <c:set var="productId" value="${id}" />
                <jsp:useBean id="productDAO" class="database.ProductDAO"></jsp:useBean>
                <c:set var="product" value="${productDAO.selectById(Integer.parseInt(productId))}"></c:set>
                <!-- Account -->
                <div class="card-body">
                  <div class="d-flex align-items-start align-items-sm-center gap-4">
                    <img
                            src="/image/${product.image}"
                            alt="user-avatar"
                            class="d-block rounded"
                            height="150"
                            width="100"
                            id="uploadedAvatar"
                    />
                    <div class="button-wrapper">
                      <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                        <span class="d-none d-sm-block">Upload new photo</span>
                        <i class="bx bx-upload d-block d-sm-none"></i>
                        <input
                                type="file"
                                id="upload"
                                class="account-file-input"
                                hidden
                                accept="image/png, image/jpeg"
                        />
                      </label>
                      <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                        <i class="bx bx-reset d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Reset</span>
                      </button>

                      <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                    </div>
                  </div>
                </div>
                <hr class="my-0" />
                <div class="card-body">
                  <form  action="ChangInf" method="post">
                    <div class="row">
                      <input name="id" type="hidden" value="${productId}">
                      <div class="mb-3 col-md-6">
                        <label for="name" class="form-label">Tên sách</label>
                        <input class="form-control" type="text" id="name" name="name" value="${product.product_name}">
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="category" class="form-label">Thể loại</label>
                        <select id="category" name="category" class="select2 form-select">
                          <jsp:useBean id="categoryDAO" class="database.CategoryDAO"/>

                          <c:forEach items="${categoryDAO.selectAll()}" var="c">
                            <option value="${c.categoryId}">${c.categoryName}</option>
                          </c:forEach>

                        </select>
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="author" class="form-label">Tác giả</label>
                        <input class="form-control" type="text" id="author" name="author" value="${product.author}">
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="publicationYear" class="form-label">Năm xuất bản</label>
                        <input type="text" class="form-control" id="publicationYear" name="publicationYear" value="${product.publicationYear}">
                      </div>
                      <div class="mb-3 col-md-6">
                        <label class="form-label" for="publisher">Nhà xuất bản</label>
                        <input type="text" class="form-control" id="publisher" name="publisher" value="${product.publisher}">
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="description" class="form-label">Mô tả</label>
                        <input type="text" class="form-control" id="description" name="description" value="${product.description}" >
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="unitPrice" class="form-label">Giá nhập</label>
                        <input class="form-control" type="text" id="unitPrice" name="unitPrice" value="${product.unitPrice}" >
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="price" class="form-label">Giá bán</label>
                        <input type="number" class="form-control" id="price" name="price" value="${product.price}">
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="price" class="form-label">Số lượng trong kho</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}">
                      </div>

                      <div class="mb-3 col-md-6">
                        <label class="form-label">Hình ảnh</label>
                        <input type="text" class="form-control" id="image" name="image" value="${product.image} ">

                      </div>
                      <div class="mt-2">
                        <button type="submit" class="btn btn-primary me-2">Save changes</button>
                        <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                      </div>

                    </div>
                  </form>
                </div>


                <!-- /Account -->
              </div>
            </div>
          </div>
        </div>
        <!-- / Content -->

        <!-- Footer -->
        <footer class="content-footer footer bg-footer-theme">
          <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
            <div class="mb-2 mb-md-0">
              ©
              <script>
                document.write(new Date().getFullYear());
              </script>
              , made with ❤️ by
              <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
            </div>
            <div>
              <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
              <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

              <a
                      href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                      target="_blank"
                      class="footer-link me-4"
              >Documentation</a
              >

              <a
                      href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                      target="_blank"
                      class="footer-link me-4"
              >Support</a
              >
            </div>
          </div>
        </footer>
        <!-- / Footer -->

        <div class="content-backdrop fade"></div>
      </div>
      <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
  </div>

  <!-- Overlay -->
  <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->

<div class="buy-now">
  <a
          href="Index"
          target="_blank"
          class="btn btn-danger btn-buy-now"
  >Quay lại trang shopping</a
  >
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assetsForAdmin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="../assetsForAdmin/assets/js/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>