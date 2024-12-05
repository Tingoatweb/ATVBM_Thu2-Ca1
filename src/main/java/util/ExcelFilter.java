package util;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ExcelFilter {
    public static void main(String[] args) {
        String inputFile = "C:\\Users\\ADMIN\\Downloads\\Book1.xlsx"; // Đường dẫn đến file hóa đơn nhập hàng
        String dataFile = "C:\\Users\\ADMIN\\Downloads\\category_data (4).xls"; // Đường dẫn đến file chứa dữ liệu sản phẩm

        try {
            List<String> invoiceProducts = readExcelFile(inputFile);
            List<String> dataProducts = readExcelFile(dataFile);

            Set<String> filteredProducts = new HashSet<>(dataProducts);
            filteredProducts.retainAll(invoiceProducts);

            System.out.println("Filtered Products:");
            for (String product : filteredProducts) {
                System.out.println(product);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static List<String> readExcelFile(String filePath) throws IOException {
        List<String> products = new ArrayList<>();
        FileInputStream fileInputStream = new FileInputStream(filePath);
        Workbook workbook = new XSSFWorkbook(fileInputStream);
        Sheet sheet = workbook.getSheetAt(0); // Giả sử dữ liệu ở sheet đầu tiên

        for (Row row : sheet) {
            Cell cell = row.getCell(0); // Giả sử tên sản phẩm ở cột đầu tiên
            if (cell != null) {
                products.add(cell.getStringCellValue().trim());
            }
        }

        workbook.close();
        fileInputStream.close();

        return products;
    }
}

