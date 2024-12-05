  console.log("Button clicked");
  const btns = document.querySelectorAll('button'); // Lựa chọn tất cả các button có class là btn-outline-primary
  btns.forEach(function (button, index) {
    button.addEventListener("click", function (event) {
      var productId = this.parentElement.parentElement.querySelector("strong").innerText; // Lấy productId từ ô strong trong hàng chứa button được click
      var productName = this.parentElement.parentElement.querySelector('input[name="product_name"]').value; // Lấy tên sản phẩm từ input có name là product_name trong hàng chứa button được click
      var unitPrice = this.parentElement.parentElement.querySelector("span").innerText; // Lấy giá nhập từ thẻ span trong hàng chứa button được click
      console.log("ProductId:", productId);
      console.log("ProductName:", productName);
      console.log("UnitPrice:", unitPrice);
    });
    console.log(button, index)
  });
