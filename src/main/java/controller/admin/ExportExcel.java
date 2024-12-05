//package controller.admin;
//
//import org.apache.poi.openxml4j.opc.OPCPackage;
//import org.apache.poi.xssf.usermodel.XSSFCell;
//import org.apache.poi.xssf.usermodel.XSSFRow;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.IOException;
//
//public class ExportExcel {
////    public static void exportExcel() throws IOException {
////        FileOutputStream file = new FileOutputStream("write.xlsx");
////             XSSFWorkbook workbook = new XSSFWorkbook();
////            XSSFSheet workSheet = workbook.createSheet("name");
////            XSSFRow row;
////            XSSFCell cellA;
////            XSSFCell cellB;
////            for (int i = 0; i < 10; i++) {
////                row = workSheet.createRow((short) i);
////                cellA = row.createCell((short) 0);
////                cellA.setCellValue(i + 1);
////                cellB = row.createCell((short) 1);
////                cellB.setCellValue((i + 2));
////            }
////            workbook.write(file);
////            file.flush();
////            file.close();
////            workbook.close();
////
////        // No need to close workbook or file manually, try-with-resources handles it
////    }
//
//    public static void exportExcel() throws IOException {
//        FileOutputStream file = null;
//        XSSFWorkbook workbook = null;
//        try {
//            file = new FileOutputStream("write.xlsx");
//            workbook = new XSSFWorkbook();
//            XSSFSheet workSheet = workbook.createSheet("name");
//
//            // Lặp qua các hàng
//            for (int i = 0; i < 10; i++) {
//                XSSFRow row = workSheet.createRow(i);
//                XSSFCell cellA = row.createCell(0);
//                cellA.setCellValue(i + 1);
//                XSSFCell cellB = row.createCell(1);
//                cellB.setCellValue(i + 2);
//            }
//
//            // Ghi workbook vào file
//            workbook.write(file);
//        } finally {
//            // Đảm bảo đóng tài nguyên
//            if (file != null) {
//                file.close();
//            }
//            if (workbook != null) {
//                workbook.close();
//            }
//        }
//    }
//
//
//    public static void main(String[] args) throws IOException {
//        exportExcel();
//
//    }
//}
