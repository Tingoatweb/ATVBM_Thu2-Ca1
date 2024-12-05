let MY_BANK = {
    BANK_ID: 'VietinBank',
    BANK_NO: '104873782654'
};

function parseCurrency(currency) {
    // Lấy tất cả các số từ chuỗi và giữ nguyên dấu chấm
    return currency.replace(/[^\d]/g, '');
}

function getFormattedNumberString(number) {
    return new Intl.NumberFormat('vi-VN').format(number).replace(/,/g, '.');
}

let lastCheckedTransactionId = null; // Biến toàn cục để lưu trữ ID giao dịch cuối cùng đã kiểm tra
let notificationSent = false; // Biến toàn cục để đảm bảo chỉ gửi thông báo một lần
let initialDataLength = 0; // Variable to store the initial length of data.data

document.addEventListener('DOMContentLoaded', function () {

    $('#payment').change(function (e) {
        if ($(this).val() === '3') {
            var modal = document.getElementById('qrModal');
            var img = document.getElementById('QRCODE-Img');
            var paidPrice = parseCurrency(document.getElementById('totalCost').textContent); // Lấy giá trị từ #totalCost
            var paidContent = "Chuyen Khoan"; // Lấy giá trị từ #nameConsignee

            // Hiển thị modal
            modal.style.display = 'flex';

            // Đặt đường dẫn QR code
            var qrUrl = `https://img.vietqr.io/image/vietinbank-104873782654-compact2.jpg?amount=${paidPrice}&addInfo=${paidContent}&accountName=${paidContent}`;
            img.src = qrUrl;


            let checkInterval; // Biến toàn cục để lưu ID của setInterval

            setTimeout(() => {
                checkInterval = setInterval(async () => {
                    const isPaid = await checkPay(paidPrice, paidContent);
                    if (isPaid) {
                        clearInterval(checkInterval); // Dừng kiểm tra khi thanh toán thành công
                    }
                }, 1000);
            }, 20000);

            // Ẩn scrollbar trên body
            document.body.style.overflow = 'hidden';

            // Ẩn scrollbar trên body
        }
    });

    // Xử lý đóng modal khi click vào nút đóng (x)


    // Xử lý đóng modal khi click ra ngoài modal
    window.onclick = function (event) {
        var modal = document.getElementById('qrModal');
        if (event.target == modal) {
            modal.style.display = 'none';
            document.body.style.overflow = ''; // Khôi phục lại scrollbar
        }
    };
});

let isSuccess = false;

async function checkPay(total, content) {
    if (isSuccess) {
        return true; // Nếu thông báo đã được gửi, không cần kiểm tra lại
    }

    try {
        const response = await fetch('https://script.google.com/macros/s/AKfycbxpBIa6h525abwSBq3VdWg-ZAoVgf1EplAeJY4vquXIP2CvA1PNqood1nG9uGsXGSo0bQ/exec');
        const data = await response.json();

        if (initialDataLength === 0) {
            initialDataLength = data.data.length; // Lưu chiều dài ban đầu
            console.log(`Giá trị data.data.length lúc ban đầu: ${initialDataLength}`);
        }

        const lastPay = data.data[data.data.length - 1];
        const lastTotal = lastPay['Giá trị'];
        const lastContent = lastPay['Mô tả'];
        console.log(lastTotal, lastContent);

        // Kiểm tra nếu số lượng giao dịch đã tăng lên
        if (data.data.length > initialDataLength) {
            console.log(`Giá trị data.data.length khi đã chuyển khoản thành công: ${data.data.length}`);
            if (!isSuccess) {
                alert('Thanh toán thành công');
                document.getElementById('payment').value = '3'; // Đặt phương thức thanh toán thành 3
                document.getElementById('checkoutform').submit(); // Gửi form
                isSuccess = true; // Đánh dấu rằng thông báo đã được gửi
            }
            return true;
        } else {
            return false;
        }
    } catch (error) {
        console.error('ERROR', error);
        return false;
    }
}



