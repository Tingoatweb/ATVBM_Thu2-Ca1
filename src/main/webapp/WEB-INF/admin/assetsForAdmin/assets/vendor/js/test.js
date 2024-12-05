// function search(){
//   var searchInput=document.querySelector('input[name="search"]').value;
//   searchInput.addEventListener('input', function (e) {
//     let txtSearch = e.target.value.trim().toLowerCase();
//     let listProductDOM = document.querySelector('listProduct');
//     listProductDOM.forEach(item => {
//       if (item.innerText.includes(txtSearch)) {
//         item.classList.remove('hide')
//       } else {
//         item.classList.add('hide')
//       }
//     })
//
//   })
// }

//   function search() {
//     //var searchInput = document.querySelector('input[name="search"]').value.trim().toLowerCase();
//     //var listProductDOM = document.getElementById('listProductDOM'); // Chọn phần tử tbody với ID mới thêm
//     // Gửi yêu cầu AJAX đến máy chủ để lấy danh sách sản phẩm
//     var xhr = new XMLHttpRequest();
//     xhr.open('GET', '/GetListProduct', true);
//     xhr.onreadystatechange = function() {
//       if (xhr.readyState === XMLHttpRequest.DONE) {
//       if (xhr.status === 200) {
//       var products = JSON.parse(xhr.responseText); // Chuyển đổi phản hồi từ máy chủ sang một mảng sản phẩm
//       filterProducts(products);
//     } else {
//       console.error('Error fetching products:', xhr.statusText);
//     }} };
//     xhr.send();
//     }
//
//     function filterProducts(products) {
//       var searchInput = document.querySelector('input[name="search"]').value.trim().toLowerCase();
//       var listProductDOM = document.getElementById('listProductDOM');
//
//
//       // Lấy tất cả các phần tử <tr> trong listProductDOM
//       var rows = listProductDOM.getElementsByTagName('tr');
//
// // Lặp qua từng phần tử <tr> để tìm phần tử có productId tương ứng
//       for (var i = 0; i < rows.length; i++) {
//         var row = rows[i];
//         var productName = row.getAttribute('product_name');
//         if (productName === searchInput) {
//           console.error(productName);
//           // Tạo một phần tử <ul> mới để chứa danh sách sản phẩm tìm kiếm
//           var ul = document.createElement('ul');
//           // Tạo một phần tử <li> mới chứa thông tin sản phẩm
//           var li = document.createElement('li');
//           li.textContent = productName; // Thay thế với thông tin sản phẩm cần hiển thị
//           // Thêm danh sách sản phẩm tìm kiếm được vào phần tử chứa kết quả tìm kiếm
//           searchResultsContainer.appendChild(ul);
//           if (productName.includes(searchInput)) {
//             row.classList.remove('hide');
//           } else {
//             row.classList.add('hide');
//           }
//         }
//       }
// <%--  // Lặp qua danh sách sản phẩm và hiển thị hoặc ẩn sản phẩm tương ứng dựa trên giá trị tìm kiếm--%>
//     <%--  products.forEach(function(product) {--%>
// <%--    var productName = "tài";--%>
// <%--  // var productName = product.product_name.trim().toLowerCase();--%>
//     <%--  var row = listProductDOM.querySelector(`tr[productId="${product.productId}"]`);--%>
// <%--  --%>
// <%--  --%>
// <%--  if (!row) {--%>
// <%--  console.error('Không tìm thấy hàng sản phẩm');--%>
// <%--  return;--%>
// <%--}--%>
// <%--    // Tạo một phần tử <ul> mới để chứa danh sách sản phẩm tìm kiếm--%>
//     <%--    var ul = document.createElement('ul');--%>
// <%--    // Tạo một phần tử <li> mới chứa thông tin sản phẩm--%>
//     <%--    var li = document.createElement('li');--%>
// <%--    li.textContent = productName; // Thay thế với thông tin sản phẩm cần hiển thị--%>
//     <%--    // Thêm danh sách sản phẩm tìm kiếm được vào phần tử chứa kết quả tìm kiếm--%>
//         <%--    searchResultsContainer.appendChild(ul);--%>
//     <%--  if (productName.includes(searchInput)) {--%>
//     <%--  row.classList.remove('hide');--%>
//     <%--} else {--%>
//     <%--  row.classList.add('hide');--%>
//     <%--}--%>
//     <%--});--%>


// }