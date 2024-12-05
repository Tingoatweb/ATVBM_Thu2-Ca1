package util;

import org.apache.poi.ss.usermodel.*;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import static javax.json.Json.createArrayBuilder;

public class ReadExcelFile {
    public JsonArray readExcel(String file_path){
        JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
        try {
            FileInputStream inputStream = new FileInputStream(new File(file_path));
            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            DataFormatter dataFormatter = new DataFormatter();
            //now read excel row and cell
            for (Row row: sheet){
                JsonArrayBuilder value = createArrayBuilder();
                for (Cell cell: row){
                    String cell_value=dataFormatter.formatCellValue(cell);
                    value.add(cell_value);
                }
                arrayBuilder.add(value);
            }
            workbook.close(); // Đóng workbook khi đã sử dụng xong
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return arrayBuilder.build();
    }

}