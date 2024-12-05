<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="util.FormatCurrency"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
  <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>
  <meta name="description" content="" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="../assetsForAdmin/assets/img/favicon/favicon.ico" />

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

  <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/fonts/boxicons.css" />

  <!-- Core CSS -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/core.css" class="template-customizer-core-css" />
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
  <link rel="stylesheet" href="../assetsForAdmin/assets/css/demo.css" />

  <!-- Vendors CSS -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

  <!-- Bootstrap CSS and DataTables CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.bootstrap5.min.css"/>

  <!-- Helpers -->
  <script src="../assetsForAdmin/assets/vendor/js/helpers.js"></script>
  <!-- jQuery, Bootstrap JS, and DataTables JS -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap5.min.js"></script>
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
          <!-- Basic Bootstrap Table -->
          <div class="card">
            <h5 class="card-header">Danh sách hóa đơn nhập hàng </h5>
            <div class="table-responsive text-nowrap">
              <table class="table table-striped" id="example2" style="width:100%">
                <thead>
                <tr>
                  <th>Mã đơn</th>
                  <th>Người nhập</th>
                  <th>Nhà cung cấp</th>
                  <th>Ngày nhập</th>
                  <th>Tổng tiền</th>
                  <th>Hành động</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <jsp:useBean id="importDAO" class="database.ImportDAO"></jsp:useBean>
                <c:forEach var="importItem" items="${importDAO.selectAll()}">
                  <tr>
                    <td id="id_import">${importItem.importId}</td>
                    <td>${importItem.importer.username}</td>
                    <td>${importItem.supplier}</td>
                    <td>${importItem.importDate.toString()}</td>
                    <td>${importItem.totalPrice}</td>
                    <td>
                      <div class="dropdown">
                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="./ImportDetail?id=${importItem.importId}">
                            <i class="bx bx-edit-alt me-1"></i> Detail
                          </a>
                          <a class="dropdown-item" href="./ChangeImport?id=${importItem.importId}">
                            <i class="bx bx-edit-alt me-1"></i> Edit
                          </a>
                          <a class="dropdown-item" href="#" onclick="deleteItem(event, '${importItem.importId}')">
                            <i class="bx bx-trash me-1"></i> Delete
                          </a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <!--/ Basic Bootstrap Table -->

          <hr class="my-5" />

          <!-- Bootstrap Dark Table -->

          <!--/ Striped Rows -->
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
              <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>
              <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
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
  <a href="Index" class="btn btn-danger btn-buy-now">Quay lại trang shopping</a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assetsForAdmin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="../assetsForAdmin/assets/js/main.js"></script>
<script>
  $(document).ready(function() {
    $('#example2').DataTable();
  });

  function deleteItem(event, id) {
    var trElement = event.target.closest('tr');
    if (!trElement) return;
    event.preventDefault();
    var confirmation = confirm("Bạn có chắc chắn muốn xóa không?");
    if (confirmation) {
      $.ajax({
        url: "/DeleteImport",
        type: "GET",
        data: { id: id },
        success: function(response) {
          // Handle success response
          console.log("Deleted item with ID: " + id);
          trElement.remove();
        },
        error: function(xhr, status, error) {
          // Handle error response
          console.error("Error deleting item: " + error);
        }
      });
    }
  }
</script>
</body>
</html>
