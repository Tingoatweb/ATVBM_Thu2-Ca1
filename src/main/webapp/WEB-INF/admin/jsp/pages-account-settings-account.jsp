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
                    <c:set var="userId" value="${id}" />

                    <jsp:useBean id="userDAO" class="database.UserDAO"></jsp:useBean>
                    <c:set var="user" value="${userDAO.selectById(Integer.parseInt(userId))}"></c:set>

                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                          src="../assets/img/avatars/1.png"
                          alt="user-avatar"
                          class="d-block rounded"
                          height="100"
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
                      <form id="formAccountSettings" method="POST" onsubmit="return false">
                        <div class="row">
                          <div class="mb-3 col-md-6">
                            <label class="form-label">Name</label>
                            <li><img src="#">: ${user.name}</li>

                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label">Username</label>
                            <li ><img src="#">: ${user.username}</li>

                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label">Email</label>
                            <li><img src="#">: ${user.email}</li>

                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label">Phone</label>
                            <li><img src="#">: ${user.phone}</li>

                          </div>
                          <div class="mb-3 col-md-6">
                            <label class="form-label">Birthday</label>
                            <li><img src="#">: ${user.birthday.toString()}</li>

                          </div>


<%--                          <div class="mb-3 col-md-6">--%>
<%--                            <label for="address" class="form-label">Address</label>--%>
<%--                            <input type="text" class="form-control" id="address" name="address" placeholder="Address" />--%>
<%--                          </div>--%>
<%--                          <div class="mb-3 col-md-6">--%>
<%--                            <label for="state" class="form-label">State</label>--%>
<%--                            <input class="form-control" type="text" id="state" name="state" placeholder="California" />--%>
<%--                          </div>--%>
<%--                          <div class="mb-3 col-md-6">--%>
<%--                            <label for="zipCode" class="form-label">Zip Code</label>--%>
<%--                            <input--%>
<%--                              type="text"--%>
<%--                              class="form-control"--%>
<%--                              id="zipCode"--%>
<%--                              name="zipCode"--%>
<%--                              placeholder="231465"--%>
<%--                              maxlength="6"--%>
<%--                            />--%>
<%--                          </div>--%>
<%--                          <div class="mb-3 col-md-6">--%>
<%--                            <label class="form-label" for="country">Country</label>--%>
<%--                            <select id="country" class="select2 form-select">--%>
<%--                              <option value="">Select</option>--%>
<%--                              <option value="Australia">Australia</option>--%>
<%--                              <option value="Bangladesh">Bangladesh</option>--%>
<%--                              <option value="Belarus">Belarus</option>--%>
<%--                              <option value="Brazil">Brazil</option>--%>
<%--                              <option value="Canada">Canada</option>--%>
<%--                              <option value="China">China</option>--%>
<%--                              <option value="France">France</option>--%>
<%--                              <option value="Germany">Germany</option>--%>
<%--                              <option value="India">India</option>--%>
<%--                              <option value="Indonesia">Indonesia</option>--%>
<%--                              <option value="Israel">Israel</option>--%>
<%--                              <option value="Italy">Italy</option>--%>
<%--                              <option value="Japan">Japan</option>--%>
<%--                              <option value="Korea">Korea, Republic of</option>--%>
<%--                              <option value="Mexico">Mexico</option>--%>
<%--                              <option value="Philippines">Philippines</option>--%>
<%--                              <option value="Russia">Russian Federation</option>--%>
<%--                              <option value="South Africa">South Africa</option>--%>
<%--                              <option value="Thailand">Thailand</option>--%>
<%--                              <option value="Turkey">Turkey</option>--%>
<%--                              <option value="Ukraine">Ukraine</option>--%>
<%--                              <option value="United Arab Emirates">United Arab Emirates</option>--%>
<%--                              <option value="United Kingdom">United Kingdom</option>--%>
<%--                              <option value="United States">United States</option>--%>
<%--                            </select>--%>
<%--                          </div>--%>
<%--                          <div class="mb-3 col-md-6">--%>
<%--                            <label for="language" class="form-label">Language</label>--%>
<%--                            <select id="language" class="select2 form-select">--%>
<%--                              <option value="">Select Language</option>--%>
<%--                              <option value="en">English</option>--%>
<%--                              <option value="fr">French</option>--%>
<%--                              <option value="de">German</option>--%>
<%--                              <option value="pt">Portuguese</option>--%>
<%--                            </select>--%>
<%--                          </div>--%>
<%--                          <div class="mb-3 col-md-6">--%>
<%--                            <label for="timeZones" class="form-label">Timezone</label>--%>
<%--                            <select id="timeZones" class="select2 form-select">--%>
<%--                              <option value="">Select Timezone</option>--%>
<%--                              <option value="-12">(GMT-12:00) International Date Line West</option>--%>
<%--                              <option value="-11">(GMT-11:00) Midway Island, Samoa</option>--%>
<%--                              <option value="-10">(GMT-10:00) Hawaii</option>--%>
<%--                              <option value="-9">(GMT-09:00) Alaska</option>--%>
<%--                              <option value="-8">(GMT-08:00) Pacific Time (US & Canada)</option>--%>
<%--                              <option value="-8">(GMT-08:00) Tijuana, Baja California</option>--%>
<%--                              <option value="-7">(GMT-07:00) Arizona</option>--%>
<%--                              <option value="-7">(GMT-07:00) Chihuahua, La Paz, Mazatlan</option>--%>
<%--                              <option value="-7">(GMT-07:00) Mountain Time (US & Canada)</option>--%>
<%--                              <option value="-6">(GMT-06:00) Central America</option>--%>
<%--                              <option value="-6">(GMT-06:00) Central Time (US & Canada)</option>--%>
<%--                              <option value="-6">(GMT-06:00) Guadalajara, Mexico City, Monterrey</option>--%>
<%--                              <option value="-6">(GMT-06:00) Saskatchewan</option>--%>
<%--                              <option value="-5">(GMT-05:00) Bogota, Lima, Quito, Rio Branco</option>--%>
<%--                              <option value="-5">(GMT-05:00) Eastern Time (US & Canada)</option>--%>
<%--                              <option value="-5">(GMT-05:00) Indiana (East)</option>--%>
<%--                              <option value="-4">(GMT-04:00) Atlantic Time (Canada)</option>--%>
<%--                              <option value="-4">(GMT-04:00) Caracas, La Paz</option>--%>
<%--                            </select>--%>
<%--                          </div>--%>
<%--                          <div class="mb-3 col-md-6">--%>
<%--                            <label for="currency" class="form-label">Currency</label>--%>
<%--                            <select id="currency" class="select2 form-select">--%>
<%--                              <option value="">Select Currency</option>--%>
<%--                              <option value="usd">USD</option>--%>
<%--                              <option value="euro">Euro</option>--%>
<%--                              <option value="pound">Pound</option>--%>
<%--                              <option value="bitcoin">Bitcoin</option>--%>
<%--                            </select>--%>
<%--                          </div>--%>

                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2">Save changes</button>
                          <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                        </div>
                      </form>
                    </div>
                    <!-- /Account -->
                  </div>
                  <div class="card">
                    <h5 class="card-header">Delete Account</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">Are you sure you want to delete your account?</h6>
                          <p class="mb-0">Once you delete your account, there is no going back. Please be certain.</p>
                        </div>
                      </div>
                      <form id="formAccountDeactivation" onsubmit="return false">
                        <div class="form-check mb-3">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            name="accountActivation"
                            id="accountActivation"
                          />
                          <label class="form-check-label" for="accountActivation"
                            >I confirm my account deactivation</label
                          >
                        </div>
                        <button type="submit" class="btn btn-danger deactivate-account">Deactivate Account</button>
                      </form>
                    </div>
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
