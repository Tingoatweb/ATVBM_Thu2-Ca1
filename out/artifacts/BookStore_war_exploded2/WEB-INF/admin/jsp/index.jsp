<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

  <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

  <meta name="description" content="" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="../assetsForAdmin/assets/img/favicon/favicon.ico" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

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

  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/apex-charts/apex-charts.css" />

  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="../assetsForAdmin/assets/vendor/js/helpers.js"></script>

  <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
  <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
  <script src="../assetsForAdmin/assets/js/config.js"></script>
</head>
<style>

  #menu-icon{
    margin-left: 110px;

  }
  .bg-menu-theme #menu-icon-toggle{
    background-color: #696cff;
    border: 7px solid #f5f5f9;
    position: absolute;
    top: 28px;
    left: 230px;
    border-radius: 50%;
    z-index: 1;
    display: block !important;
  }
  #menu-icon-toggle i{
    width: 1.5rem;
    height: 1.5rem;
  }
  #menu-icon-toggle::before{
    color:white;
    content: "\ecb0";

  }
  aside#layout-menu.layout-menu.menu-vertical.menu.bg-menu-theme.close{
    width: 100px;
  }
  aside#layout-menu.layout-menu.menu-vertical.menu.bg-menu-theme.close .menu-item div, aside#layout-menu.layout-menu.menu-vertical.menu.bg-menu-theme.close .menu-sub div{
    opacity: 0;

  }
  .bg-menu-theme.close .menu-inner > .menu-item.active > .menu-link {

    /*background-color: rgba(105, 108, 255, 0.16) !important;*/
    /*color: black;*/
  }
  .menu-header-text{
    opacity: 0;
  }
  .bg-menu-theme.close .menu-header:before {
    display: none;
  }
  .bg-menu-theme.close .app-brand-text.demo.menu-text.fw-bolder.ms-2{
    display: none;
  }
  .bg-menu-theme.close{
    text-align: center;
    display: flex;
    justify-content: center;
    flex-direction: column;
  }
  .bg-menu-theme.close #menu-icon-toggle{
    background-color: #696cff;
    border: 7px solid #f5f5f9;
    position: absolute;
    top: 28px;
    left: 70px;
    border-radius: 50%;
    z-index: 1;
    display: block !important;
  }
  .bg-menu-theme.close #menu-icon-toggle{
    transform: rotate(180deg);

  }
  /*.bg-menu-theme.close .align-items-center.bg-navbar-theme{*/
  /*  padding-left: 100px;*/
  /*}*/
  .layout-navbar.container-xxl.navbar.navbar-expand-xl.navbar-detached.align-items-center.bg-navbar-theme.close{
    width:1212px;
    margin-left: -125px;
  }

  .content-wrapper.close{
    margin-left: -151px;
    width: 1263px;
  }
  /*.container-xxl.flex-grow-1.container-p-y .row.close .card-body{*/
  /*  !*margin-left: -10px;*!*/
  /*  !*width: 500px;*!*/
  /*}*/
  .fa-regular.fa-sun{
    font-size: 20px;

  }
  .fa-regular.fa-moon{
    font-size: 20px;

  }



</style>
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
      <div class="content-wrapper" id="content-wrapper">
        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y" >
          <div class="row" id="content-big-section">
            <div class="col-lg-8 mb-4 order-0">
              <div class="card">
                <div class="d-flex align-items-end row" >
                  <div class="col-sm-7">
                    <div class="card-body">
                      <h5 class="card-title text-primary">Congratulations John! 🎉</h5>
                      <p class="mb-4">
                        You have done <span class="fw-bold">72%</span> more sales today. Check your new badge in
                        your profile.
                      </p>

                      <a href="javascript:;" class="btn btn-sm btn-outline-primary">View Badges</a>
                    </div>
                  </div>
                  <div class="col-sm-5 text-center text-sm-left">
                    <div class="card-body pb-0 px-0 px-md-4">
                      <img
                              src="../assets/img/illustrations/man-with-laptop-light.png"
                              height="140"
                              alt="View Badge User"
                              data-app-dark-img="illustrations/man-with-laptop-dark.png"
                              data-app-light-img="illustrations/man-with-laptop-light.png"
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-4 order-1">
              <div class="row">
                <div class="col-lg-6 col-md-12 col-6 mb-4">
                  <div class="card">
                    <div class="card-body">
                      <div class="card-title d-flex align-items-start justify-content-between">
                        <div class="avatar flex-shrink-0">
                          <img
                                  src="../assets/img/icons/unicons/chart-success.png"
                                  alt="chart success"
                                  class="rounded"
                          />
                        </div>
                        <div class="dropdown">
                          <button
                                  class="btn p-0"
                                  type="button"
                                  id="cardOpt3"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false"
                          >
                            <i class="bx bx-dots-vertical-rounded"></i>
                          </button>
                          <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt3">
                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                          </div>
                        </div>
                      </div>
                      <span class="fw-semibold d-block mb-1">Profit</span>
                      <h3 class="card-title mb-2">$12,628</h3>
                      <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +72.80%</small>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-md-12 col-6 mb-4">
                  <div class="card">
                    <div class="card-body">
                      <div class="card-title d-flex align-items-start justify-content-between">
                        <div class="avatar flex-shrink-0">
                          <img
                                  src="../assets/img/icons/unicons/wallet-info.png"
                                  alt="Credit Card"
                                  class="rounded"
                          />
                        </div>
                        <div class="dropdown">
                          <button
                                  class="btn p-0"
                                  type="button"
                                  id="cardOpt6"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false"
                          >
                            <i class="bx bx-dots-vertical-rounded"></i>
                          </button>
                          <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                          </div>
                        </div>
                      </div>
                      <span>Sales</span>
                      <h3 class="card-title text-nowrap mb-1">$4,679</h3>
                      <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.42%</small>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Total Revenue -->
            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
              <div class="card">
                <div class="row row-bordered g-0">
                  <div class="col-md-8">
                    <h5 class="card-header m-0 me-2 pb-3">Total Revenue</h5>
                    <div id="totalRevenueChart" class="px-2">

                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="card-body">
                      <div class="text-center">
                        <div class="dropdown">
                          <button
                                  class="btn btn-sm btn-outline-primary dropdown-toggle"
                                  type="button"
                                  id="growthReportId"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false"
                          >
                            2022
                          </button>
                          <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
                            <a class="dropdown-item" href="javascript:void(0);">2021</a>
                            <a class="dropdown-item" href="javascript:void(0);">2020</a>
                            <a class="dropdown-item" href="javascript:void(0);">2019</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div id="growthChart"></div>
                    <div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>

                    <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                      <div class="d-flex">
                        <div class="me-2">
                          <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
                        </div>
                        <div class="d-flex flex-column">
                          <small>2022</small>
                          <h6 class="mb-0">$32.5k</h6>
                        </div>
                      </div>
                      <div class="d-flex">
                        <div class="me-2">
                          <span class="badge bg-label-info p-2"><i class="bx bx-wallet text-info"></i></span>
                        </div>
                        <div class="d-flex flex-column">
                          <small>2021</small>
                          <h6 class="mb-0">$41.2k</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--/ Total Revenue -->
            <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
              <div class="row">
                <div class="col-6 mb-4">
                  <div class="card">
                    <div class="card-body">
                      <div class="card-title d-flex align-items-start justify-content-between">
                        <div class="avatar flex-shrink-0">
                          <img src="../assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded" />
                        </div>
                        <div class="dropdown">
                          <button
                                  class="btn p-0"
                                  type="button"
                                  id="cardOpt4"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false"
                          >
                            <i class="bx bx-dots-vertical-rounded"></i>
                          </button>
                          <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                          </div>
                        </div>
                      </div>
                      <span class="d-block mb-1">Payments</span>
                      <h3 class="card-title text-nowrap mb-2">$2,456</h3>
                      <small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i> -14.82%</small>
                    </div>
                  </div>
                </div>
                <div class="col-6 mb-4">
                  <div class="card">
                    <div class="card-body">
                      <div class="card-title d-flex align-items-start justify-content-between">
                        <div class="avatar flex-shrink-0">
                          <img src="../assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
                        </div>
                        <div class="dropdown">
                          <button
                                  class="btn p-0"
                                  type="button"
                                  id="cardOpt1"
                                  data-bs-toggle="dropdown"
                                  aria-haspopup="true"
                                  aria-expanded="false"
                          >
                            <i class="bx bx-dots-vertical-rounded"></i>
                          </button>
                          <div class="dropdown-menu" aria-labelledby="cardOpt1">
                            <a class="dropdown-item" href="javascript:void(0);">View More</a>
                            <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                          </div>
                        </div>
                      </div>
                      <span class="fw-semibold d-block mb-1">Transactions</span>
                      <h3 class="card-title mb-2">$14,857</h3>
                      <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.14%</small>
                    </div>
                  </div>
                </div>
                <!-- </div>
<div class="row"> -->
                <div class="col-12 mb-4">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                        <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                          <div class="card-title">
                            <h5 class="text-nowrap mb-2">Profile Report</h5>
                            <span class="badge bg-label-warning rounded-pill">Year 2021</span>
                          </div>
                          <div class="mt-sm-auto">
                            <small class="text-success text-nowrap fw-semibold"
                            ><i class="bx bx-chevron-up"></i> 68.2%</small
                            >
                            <h3 class="mb-0">$84,686k</h3>
                          </div>
                        </div>
                        <div id="profileReportChart"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <!-- Order Statistics -->
            <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
              <div class="card h-100">
                <div class="card-header d-flex align-items-center justify-content-between pb-0">
                  <div class="card-title mb-0">
                    <h5 class="m-0 me-2">Order Statistics</h5>
                    <small class="text-muted">42.82k Total Sales</small>
                  </div>
                  <div class="dropdown">
                    <button
                            class="btn p-0"
                            type="button"
                            id="orederStatistics"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                    >
                      <i class="bx bx-dots-vertical-rounded"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                      <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                      <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                      <a class="dropdown-item" href="javascript:void(0);">Share</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex flex-column align-items-center gap-1">
                      <h2 class="mb-2">8,258</h2>
                      <span>Total Orders</span>
                    </div>
                    <div id="orderStatisticsChart"></div>
                  </div>
                  <ul class="p-0 m-0">
                    <li class="d-flex mb-4 pb-1">
                      <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary"
                            ><i class="bx bx-mobile-alt"></i
                            ></span>
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <h6 class="mb-0">Electronic</h6>
                          <small class="text-muted">Mobile, Earbuds, TV</small>
                        </div>
                        <div class="user-progress">
                          <small class="fw-semibold">82.5k</small>
                        </div>
                      </div>
                    </li>
                    <li class="d-flex mb-4 pb-1">
                      <div class="avatar flex-shrink-0 me-3">
                        <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <h6 class="mb-0">Fashion</h6>
                          <small class="text-muted">T-shirt, Jeans, Shoes</small>
                        </div>
                        <div class="user-progress">
                          <small class="fw-semibold">23.8k</small>
                        </div>
                      </div>
                    </li>
                    <li class="d-flex mb-4 pb-1">
                      <div class="avatar flex-shrink-0 me-3">
                        <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <h6 class="mb-0">Decor</h6>
                          <small class="text-muted">Fine Art, Dining</small>
                        </div>
                        <div class="user-progress">
                          <small class="fw-semibold">849k</small>
                        </div>
                      </div>
                    </li>
                    <li class="d-flex">
                      <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-secondary"
                            ><i class="bx bx-football"></i
                            ></span>
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <h6 class="mb-0">Sports</h6>
                          <small class="text-muted">Football, Cricket Kit</small>
                        </div>
                        <div class="user-progress">
                          <small class="fw-semibold">99</small>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!--/ Order Statistics -->

            <!-- Expense Overview -->
            <div class="col-md-6 col-lg-4 order-1 mb-4">
              <div class="card h-100">
                <div class="card-header">
                  <ul class="nav nav-pills" role="tablist">
                    <li class="nav-item">
                      <button
                              type="button"
                              class="nav-link active"
                              role="tab"
                              data-bs-toggle="tab"
                              data-bs-target="#navs-tabs-line-card-income"
                              aria-controls="navs-tabs-line-card-income"
                              aria-selected="true"
                      >
                        Income
                      </button>
                    </li>
                    <li class="nav-item">
                      <button type="button" class="nav-link" role="tab">Expenses</button>
                    </li>
                    <li class="nav-item">
                      <button type="button" class="nav-link" role="tab">Profit</button>
                    </li>
                  </ul>
                </div>
                <div class="card-body px-0">
                  <div class="tab-content p-0">
                    <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                      <div class="d-flex p-4 pt-3">
                        <div class="avatar flex-shrink-0 me-3">
                          <img src="../assets/img/icons/unicons/wallet.png" alt="User" />
                        </div>
                        <div>
                          <small class="text-muted d-block">Total Balance</small>
                          <div class="d-flex align-items-center">
                            <h6 class="mb-0 me-1">$459.10</h6>
                            <small class="text-success fw-semibold">
                              <i class="bx bx-chevron-up"></i>
                              42.9%
                            </small>
                          </div>
                        </div>
                      </div>
                      <div id="incomeChart"></div>
                      <div class="d-flex justify-content-center pt-4 gap-2">
                        <div class="flex-shrink-0">
                          <div id="expensesOfWeek"></div>
                        </div>
                        <div>
                          <p class="mb-n1 mt-1">Expenses This Week</p>
                          <small class="text-muted">$39 less than last week</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--/ Expense Overview -->

            <!-- Transactions -->
            <div class="col-md-6 col-lg-4 order-2 mb-4">
              <div class="card h-100">
                <div class="card-header d-flex align-items-center justify-content-between">
                  <h5 class="card-title m-0 me-2">Transactions</h5>
                  <div class="dropdown">
                    <button
                            class="btn p-0"
                            type="button"
                            id="transactionID"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                    >
                      <i class="bx bx-dots-vertical-rounded"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="transactionID">
                      <a class="dropdown-item" href="javascript:void(0);">Last 28 Days</a>
                      <a class="dropdown-item" href="javascript:void(0);">Last Month</a>
                      <a class="dropdown-item" href="javascript:void(0);">Last Year</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <ul class="p-0 m-0">
                    <li class="d-flex mb-4 pb-1">
                      <div class="avatar flex-shrink-0 me-3">
                        <img src="../assets/img/icons/unicons/paypal.png" alt="User" class="rounded" />
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <small class="text-muted d-block mb-1">Paypal</small>
                          <h6 class="mb-0">Send money</h6>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                          <h6 class="mb-0">+82.6</h6>
                          <span class="text-muted">USD</span>
                        </div>
                      </div>
                    </li>
                    <li class="d-flex mb-4 pb-1">
                      <div class="avatar flex-shrink-0 me-3">
                        <img src="../assets/img/icons/unicons/wallet.png" alt="User" class="rounded" />
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <small class="text-muted d-block mb-1">Wallet</small>
                          <h6 class="mb-0">Mac'D</h6>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                          <h6 class="mb-0">+270.69</h6>
                          <span class="text-muted">USD</span>
                        </div>
                      </div>
                    </li>
                    <li class="d-flex mb-4 pb-1">
                      <div class="avatar flex-shrink-0 me-3">
                        <img src="../assets/img/icons/unicons/chart.png" alt="User" class="rounded" />
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <small class="text-muted d-block mb-1">Transfer</small>
                          <h6 class="mb-0">Refund</h6>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                          <h6 class="mb-0">+637.91</h6>
                          <span class="text-muted">USD</span>
                        </div>
                      </div>
                    </li>
                    <li class="d-flex mb-4 pb-1">
                      <div class="avatar flex-shrink-0 me-3">
                        <img src="../assets/img/icons/unicons/cc-success.png" alt="User" class="rounded" />
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <small class="text-muted d-block mb-1">Credit Card</small>
                          <h6 class="mb-0">Ordered Food</h6>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                          <h6 class="mb-0">-838.71</h6>
                          <span class="text-muted">USD</span>
                        </div>
                      </div>
                    </li>
                    <li class="d-flex mb-4 pb-1">
                      <div class="avatar flex-shrink-0 me-3">
                        <img src="../assets/img/icons/unicons/wallet.png" alt="User" class="rounded" />
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <small class="text-muted d-block mb-1">Wallet</small>
                          <h6 class="mb-0">Starbucks</h6>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                          <h6 class="mb-0">+203.33</h6>
                          <span class="text-muted">USD</span>
                        </div>
                      </div>
                    </li>
                    <li class="d-flex">
                      <div class="avatar flex-shrink-0 me-3">
                        <img src="../assets/img/icons/unicons/cc-warning.png" alt="User" class="rounded" />
                      </div>
                      <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                        <div class="me-2">
                          <small class="text-muted d-block mb-1">Mastercard</small>
                          <h6 class="mb-0">Ordered Food</h6>
                        </div>
                        <div class="user-progress d-flex align-items-center gap-1">
                          <h6 class="mb-0">-92.45</h6>
                          <span class="text-muted">USD</span>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!--/ Transactions -->
          </div>
        </div>
        <!-- / Content -->

        <!-- Footer -->
        <footer class="content-footer footer bg-footer-theme">
          <button id="toggle-dark-mode">
            <i class="fa-regular fa-moon" id="icontype"></i>
          </button>
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

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assetsForAdmin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/popper/popper.js"></script>
<script src="../assetsForAdmin/assets/vendor/js/bootstrap.js"></script>
<script src="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assetsForAdmin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="../assetsForAdmin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="../assetsForAdmin/assets/js/main.js"></script>

<!-- Page JS -->
<script src="../assetsForAdmin/assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<%--    <script src="../assetsForAdmin/assets/js/menuadmin.js"></script>--%>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var toggle = document.getElementById("menu-icon-toggle");
    var sidebar = document.getElementById("layout-menu");
    var searchbar = document.getElementById("layout-navbar");
    var contentnew = document.getElementById("content-wrapper");
    // bigcontent = document.getElementById('content-big-section');

    toggle.addEventListener("click", function () {
      sidebar.classList.toggle("close");
      searchbar.classList.toggle("close");
      contentnew.classList.toggle("close");
      // bigcontent.classList.toggle("close");
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
</body>
</html>
