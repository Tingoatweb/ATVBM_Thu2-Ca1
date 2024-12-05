<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false" %>

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
  <meta charset="UTF-8">
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
  />

  <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

  <meta name="description" content="" />

  <!-- Favicon -->
  <script defer src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
  <script defer src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
  <script defer src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css"/>

  <link rel="icon" type="image/x-icon" href="../assetsForAdmin/assets/img/favicon/favicon.ico" />

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet"
  />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/fonts/boxicons.css" />

  <!-- Core CSS -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/core.css" class="template-customizer-core-css" />
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
  <link rel="stylesheet" href="../assetsForAdmin/assets/css/demo.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

  <!-- Vendors CSS -->
  <link rel="stylesheet" href="../assetsForAdmin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="../assetsForAdmin/assets/vendor/js/helpers.js"></script>

  <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
  <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
  <script src="../assetsForAdmin/assets/js/config.js"></script>

  <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
  <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
  <script src="../assetsForAdmin/assets/js/config.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


  <style>
    .hide{
      display: none;
    }
    .table-responsive.text-nowrap {

    }
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

    .btn-light-purple {
      background-color: #e6e6ff;
      color: #5a5aff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-weight: bold;
    }

    .btn-light-purple:hover {
      background-color: #d1d1ff;
    }

    .price-total p {
      text-align: right;
      padding-right: 20px;
      padding-top: 15px;
      font-weight: bold;
    }

    .checkout__input {
      margin-bottom: 15px;
    }

    .checkout__input label {
      font-weight: bold;
    }

    .container-fluid {
      margin-top: 20px;
    }

    table {
      width: 100%;
      margin-top: 20px;
    }

    th, td {
      text-align: left;
      padding: 10px;
    }

    th {
      background-color: #f2f2f2;
    }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>


<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->
    <jsp:include page="menu.jsp"/>

    <!-- Layout container -->
    <div class="layout-page">

      <!-- Content wrapper -->
      <jsp:include page="navbar.jsp"/>

      <div class="content-wrapper" id="content-wrapper">
        <div class="container-xxl flex-grow-1 container-p-y" id="content-big-section">
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Tables /</span> List Product</h4>

          <!-- Basic Bootstrap Table -->
          <div class="card" id="cardresp">
            <h5 class="card-header">Nhập Hàng</h5>
            <div class="table-responsive text-nowrap">
                <table class="table table-striped" id="tabledata" style="width:100%">
                  <thead>
                  <tr>
                    <th>Mã sách</th>
                    <th>Tên sách</th>
                    <th>Giá nhập</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Xóa sp</th>
                  </tr>
                  </thead>
                  <tbody class="table-border-bottom-0" id="tbody">
                  </tbody>
                </table>
              <div class="container">
                <div class="price-total">
                  <p>Tổng tiền: <span>0</span><sup>đ</sup></p>
                </div>


                <div class="checkout__input">
                  <label for="ncc">Nhà cung cấp</label>
                  <input type="text" id="ncc" name="ncc" class="form-control">
                </div>
                <div class="checkout__input">
                  <label for="note">Ghi chú</label>
                  <input type="text" id="note" name="note" class="form-control">
                </div>
                <input type="submit" value="Complete Order" class="btn btn-light-purple">

                <div class="container-fluid">
                  <h5>Upload File</h5>
                  <form id="uploadForm" enctype="multipart/form-data" method="post">
                    <input type="file" name="file" id="fileInput" class="hide">
                    <input type="button" value="Upload" id="uploadButton" class="btn btn-light-purple">
                  </form>



                </div>

                <h5>Sản phẩm chưa tồn tại</h5>
                <table class="table table-striped">
                  <thead>
                  <tr>
                    <th>STT</th>
                    <th>Tên sp</th>
                  </tr>
                  </thead>
                  <tbody id="noProductsTbody"></tbody>
                </table>


              </div>


          <!--/ Basic Bootstrap Table -->

          <hr class="my-5" />

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

    </div>
    <!-- / Layout page -->
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.3/xlsx.full.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gson/2.8.8/gson.min.js"></script>

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

<!-- Page JS -->
<!-- Place this tag in your head or just before your close body tag. -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
        integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/js-lru-cache@0.1.10/dist/lru-cache.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/darkreader@4.9.80/darkreader.min.js"></script>
<script>
  $(document).ready(function() {
    // Khi người dùng click vào nút "Upload"
    $('#uploadButton').click(function() {
      // Kích hoạt sự kiện click vào input file
      $('#fileInput').click();
    });

    // Khi người dùng chọn file
    $('#fileInput').change(function(event) {
      var file = event.target.files[0];
      var validExtensions = ['xlsx', 'xls'];
      var fileExtension = file.name.split('.').pop().toLowerCase();

      if (validExtensions.indexOf(fileExtension) === -1) {
        alert('Tệp không hợp lệ. Vui lòng chọn tệp Excel (.xlsx hoặc .xls).');
        return;
      }
      var reader = new FileReader();
      reader.onload = function(e) {
        var data = new Uint8Array(e.target.result);
        var workbook = XLSX.read(data, { type: 'array' });
        var sheetName = workbook.SheetNames[0];
        var sheet = workbook.Sheets[sheetName];
        var jsonData = XLSX.utils.sheet_to_json(sheet);

        var productNames = [];
        jsonData.forEach(function(row) {
          productNames.push(row['Product Name']);
        });

        $.ajax({
          url: '/Upload2',
          type: 'POST',
          contentType: 'application/json',
          data: JSON.stringify({productNames: productNames}),
          success: function (response) {

            // Parse the JSON response
            var products = response.products;
            var noProducts = response.noProducts;

            //them du lieu vao bang
            var tbody = document.getElementById('tbody');
            tbody.innerHTML = '';
            products.forEach(function (product) {
              var tr = document.createElement('tr');

              var idTd = document.createElement('td');
              var idP = document.createElement('p');
              idP.name = 'productId';
              idP.id = 'productId';
              idP.setAttribute('data-product-id', product.product_id);
              idP.textContent = product.product_id;
              idTd.appendChild(idP);

              var nameTd = document.createElement('td');
              nameTd.className = 'titleProduct';
              nameTd.textContent = product.product_name;

              var unitPriceTd = document.createElement('td');
              var unitPriceInput = document.createElement('input');
              unitPriceInput.name = 'unitPrice';
              unitPriceInput.type = 'number';
              unitPriceInput.className = 'input-value';
              unitPriceInput.value = product.unitPrice;
              unitPriceInput.setAttribute('oninput', 'calculateTotal()');
              unitPriceInput.setAttribute('onclick', 'inputChange()');
              unitPriceTd.appendChild(unitPriceInput);

              var quantityTd = document.createElement('td');
              var quantityInput = document.createElement('input');
              quantityInput.name = 'numberOfWarehouses';
              quantityInput.type = 'number';
              quantityInput.className = 'input-value';
              quantityInput.value = product.quantity;
              quantityInput.min = 1;
              quantityInput.setAttribute('oninput', 'calculateTotal()');
              quantityInput.setAttribute('onclick', 'inputChange()');
              quantityTd.appendChild(quantityInput);

              var totalPriceTd = document.createElement('td');
              var totalPriceInput = document.createElement('input');
              totalPriceInput.name = 'totalPrice';
              totalPriceInput.type = 'number';
              totalPriceInput.readOnly = true;
              totalPriceInput.value = (product.unitPrice * product.quantity).toFixed(2);
              totalPriceTd.appendChild(totalPriceInput);

              var deleteButtonTd = document.createElement('td');
              var deleteButton = document.createElement('button');
              deleteButton.type = 'button';
              deleteButton.className = 'btn btn-sm btn-outline-primary';

              var deleteSpan = document.createElement('span');
              deleteSpan.className = 'cart-delete';
              deleteSpan.textContent = 'Xóa';

              deleteButton.appendChild(deleteSpan);
              deleteButtonTd.appendChild(deleteButton);

              tr.appendChild(idTd);
              tr.appendChild(nameTd);
              tr.appendChild(unitPriceTd);
              tr.appendChild(quantityTd);
              tr.appendChild(totalPriceTd);
              tr.appendChild(deleteButtonTd);
              tbody.appendChild(tr);
            });
            deleteCart();
            inputChange();
            cartTotal();

            //them du lieu vao bang
            var tbody2 = document.getElementById('noProductsTbody');
            tbody2.innerHTML = '';
            noProducts.forEach(function (product) {
              var tr = document.createElement('tr');

              var stt = document.createElement('td');
              stt.className = 'number';
              stt.textContent = product.stt;

              var nameTd = document.createElement('td');
              nameTd.className = 'titleProduct';
              nameTd.textContent = product.product_name;

              tr.appendChild(stt);
              tr.appendChild(nameTd);

              tbody2.appendChild(tr);
            });

          },
          error: function(xhr, status, error) {
            console.error('Error:', error);
          }
        });
      };
      reader.readAsArrayBuffer(file);
    });
  });
//xoa san pham khoi danh sach nhap
  function deleteCart() {
    var cartItem = document.querySelectorAll("tbody.table-border-bottom-0 tr ");
    for (var i=0; i<cartItem.length; i++){
      var productT= document.querySelectorAll(".cart-delete")
      productT[i].addEventListener("click", function (even){
        var cartDelete = even.target
        var cartItemR = cartDelete.parentElement.parentElement.parentElement
        cartItemR.remove()
        cartTotal();
      })

      // console.log(productT)
    }

  }

  //thay doi so luong thi gia tien cung thay doi theo
  function inputChange(){
    var cartItem = document.querySelectorAll("tbody.table-border-bottom-0 tr ");
    for (var i=0; i<cartItem.length; i++){
      var inputValue= document.querySelectorAll(".input-value")
      inputValue[i].addEventListener("change", function (){
        cartTotal();
      })
      // console.log(productT)
    }
  }

  //nhap hang
  function collectDataFromTable() {
    var data = [];
    var rows = document.querySelectorAll('tbody.table-border-bottom-0 tr');
    var note = document.getElementById('note').value;
    if (note === null || note === "") note = " ";

    var ncc = document.getElementById('ncc').value;
    if (ncc === null || ncc === "") ncc = " ";

    rows.forEach(function(row) {
      var productId = row.querySelector('p[data-product-id]').dataset.productId;
      var productName = row.querySelector('.titleProduct').innerText;
      var numberOfWarehouses = row.querySelector('input[name="numberOfWarehouses"]').value;
      var unitPrice = row.querySelector('input[name="unitPrice"]').value;
      var totalPrice = row.querySelector('input[name="totalPrice"]').value;


      var item = {
        productId: productId,
        productName: productName,
        numberOfWarehouses: numberOfWarehouses,
        unitPrice: unitPrice,
        totalPrice: totalPrice,
        note: note,
        ncc: ncc
      };

      data.push(item);
    });

    return data;
  }
  document.querySelector('input[type="submit"]').addEventListener('click', function(event) {
    event.preventDefault(); // Ngăn chặn hành động mặc định của nút submit

    var tableRows = document.querySelectorAll('tbody.table-border-bottom-0 tr');

    // Kiểm tra nếu không có dòng nào trong bảng
    if (tableRows.length === 0) {
      alert("Vui lòng nhập sản phẩm vào bảng trước khi hoàn tất đơn hàng!");
      return; // Dừng lại và không tiếp tục thực hiện request
    }

    var data = collectDataFromTable();


    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/CompleteOrderServlet2', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          // Hiển thị thông báo nhập hàng thành công
          alert("Nhập hàng thành công!");

          // Làm mới trang sau một khoảng thời gian ngắn
          setTimeout(function() {
            window.location.reload(); // Làm mới trang sau 1 giây
          }, 1000); // 1000 milliseconds = 1 giây
        } else {
          console.error('Error:', xhr.statusText);
        }
      }
    };
    xhr.send(JSON.stringify(data));
  });

  function cartTotal() {
    var cartItem = document.querySelectorAll("tbody.table-border-bottom-0 tr");
    var totalAll = 0;

    cartItem.forEach(function(row) {
      var numberOfWarehouses = parseFloat(row.querySelector('input[name="numberOfWarehouses"]').value);
      var unitPrice = parseFloat(row.querySelector('input[name="unitPrice"]').value);
      var totalPrice = numberOfWarehouses * unitPrice;
      totalAll += totalPrice;
    });

    var cartTotalA = document.querySelector(".price-total span");
    cartTotalA.innerHTML = totalAll.toLocaleString('de-DE') + '<sup>đ</sup>';
  }


  //tinh tong tien
  function calculateTotal() {
    var cartItems = document.querySelectorAll("tbody.table-border-bottom-0 tr");
    cartItems.forEach(function(row) {
      var numberOfWarehouses = parseFloat(row.querySelector('input[name="numberOfWarehouses"]').value);
      var unitPrice = parseFloat(row.querySelector('input[name="unitPrice"]').value);
      var totalPrice = numberOfWarehouses * unitPrice;
      row.querySelector('input[name="totalPrice"]').value = totalPrice.toFixed(2);
      cartTotal();
    });

  }
</script>
</body>
</html>
