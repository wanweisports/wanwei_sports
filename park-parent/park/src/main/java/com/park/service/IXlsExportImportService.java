package com.park.service;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface IXlsExportImportService {

    public Workbook getWorkbook(InputStream fin, String fileName);

    public List<String> getExcelTitle(Sheet sheet, int row);

    public Workbook xlsExport(String templateName, List<Map<String, Object>> dataList);

    public Workbook xlsExport(InputStream inputStream, String templateName, List<Map<String, Object>> dataList, int excelTitleIndex, int createStartRowIndex);

    public Workbook xlsExport(String templateName, List<Map<String, Object>> dataList, int excelTitleIndex, int createStartRowIndex, boolean deleteFirstRow);

    public void xlsExport(List<Map<String, Object>> dataList, Workbook workbook, int sheetAtIndex);
    
    public void writeWorkbook(List<Map<String, Object>> dataList, Workbook workbook, int sheetAtIndex, int excelTitleIndex, int createStartRowIndex, boolean deleteFirstRow);

    public<T> List<T> xlsImport(InputStream fin, String fileName, Class<T> clazz) throws Exception;

    public <T> List<T> xlsImport(Workbook workbook, Class<T> clazz) throws Exception;

}
