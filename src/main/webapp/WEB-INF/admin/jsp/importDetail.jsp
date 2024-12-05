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
                    <c:set var="importId" value="${id}" />

                    <jsp:useBean id="importDAO" class="database.ImportDAO"></jsp:useBean>
                    <c:set var="importedItem" value="${importDAO.selectById(Integer.parseInt(importId))}"></c:set>
<%--                    <c:set var="importDetails" value="${import.importDetailList}"/>--%>

                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                          <p>Mã đơn: ${importId}</p>
                          <p>Người nhập: ${importedItem.importer.username}</p>
                        <p>Ngày nhập: ${importedItem.importDate.toString()}</p>
                        <p>Nhà cung cấp: ${importedItem.supplier}</p>
                        <p>Ghi chú đơn hàng: ${importedItem.note}</p>
                        </div>
                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                      <div class="table-responsive text-nowrap">
                        <table class="table ">
                          <thead>
                          <tr class="hide">
                            <th>Mã sách</th>
                            <th>Tên sách</th>
                            <th>Số lượng</th>
                            <th>Giá nhập</th>
                          </tr>
                          </thead>

                          <tbody class="list-product">
                          <c:forEach var="importDetail" items="${importedItem.getImportDetailList()}">

                            <tr>
                              <td>${importDetail.product.productId}</td>
                              <td>${importDetail.product.product_name}</td>
                              <td>${importDetail.numberOfWarehouses}</td>
                              <td >${importDetail.unitPrice}</td>
                            </tr>
                          </c:forEach>

                          </tbody>

                        </table>
                      </div>
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
        href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/"
        target="_blank"
        class="btn btn-danger btn-buy-now"
        >Upgrade to Pro</a
      >
    </div>

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
