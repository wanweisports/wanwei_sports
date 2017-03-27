package com.park.platform.service.impl;

import com.park.common.constant.IPlatformConstant;
import com.park.common.util.StrUtil;
import com.park.platform.service.IXlsExportImportService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class XlsExportImportServiceImpl implements IXlsExportImportService {
	
	public final static String ROOT = "/template/";

    @Override
    public Workbook getWorkbook(InputStream fin, String fileName) {
        Workbook workbook = null;
        String extension = fileName.substring(fileName.lastIndexOf("."));
        try {
            if (IPlatformConstant.EXCEL_EXTENSION.equals(extension)) {
                workbook = new HSSFWorkbook(fin);
            } else if (IPlatformConstant.EXCEL_EXTENSION_X.equals(extension)) {
                workbook = new XSSFWorkbook(fin);
            }
        } catch (IOException e1) {
            throw new RuntimeException(e1);
        }
        return workbook;
        /*try{
            if (!fin.markSupported()) {
                fin = new PushbackInputStream(fin, 8);
            }
            if (POIFSFileSystem.hasPOIFSHeader(fin)) {
                return new HSSFWorkbook(fin);
            }
            if (POIXMLDocument.hasOOXMLHeader(fin)) {
                return new XSSFWorkbook(OPCPackage.open(fin));
            }

            throw new IllegalArgumentException("你的excel版本目前poi解析不了");

        } catch (Exception e){
            e.printStackTrace();
            return null;
        }*/
    }

    /**
     * 获取excel的title
     *
     * @param sheet
     * @param row
     * @return
     */
    @Override
    public List<String> getExcelTitle(Sheet sheet, int row) {
        Row excelRow = sheet.getRow(row);
        List<String> titles = new ArrayList<String>();
        for (Cell cell : excelRow) {
            if(cell != null) {
                cell.setCellType(Cell.CELL_TYPE_STRING);
                titles.add(cell.getStringCellValue().trim());
            }
        }
        return titles;
    }

    @Override
    public Workbook xlsExport(String templateName, List<Map<String, Object>> dataList) {
        System.out.println(1);
        Workbook workbook = getWorkbook(XlsExportImportServiceImpl.class.getResourceAsStream(ROOT + templateName), templateName);
        writeWorkbook(dataList, workbook, 0, 0, 2, true);
        return workbook;
    }

    @Override
    public Workbook xlsExport(InputStream inputStream, String templateName, List<Map<String, Object>> dataList, int excelTitleIndex, int createStartRowIndex) {
        Workbook workbook = getWorkbook(inputStream, templateName);
        writeWorkbook(dataList, workbook, 0, excelTitleIndex, createStartRowIndex, false);
        return workbook;
    }

    @Override
    public Workbook xlsExport(String templateName, List<Map<String, Object>> dataList, int excelTitleIndex, int createStartRowIndex, boolean deleteFirstRow) {
        Workbook workbook = getWorkbook(XlsExportImportServiceImpl.class.getResourceAsStream(ROOT + templateName), templateName);
        writeWorkbook(dataList, workbook, 0, excelTitleIndex, createStartRowIndex, deleteFirstRow);
        return workbook;
    }

    @Override
    public void xlsExport(List<Map<String, Object>> dataList, Workbook workbook, int sheetAtIndex) {
        writeWorkbook(dataList, workbook, sheetAtIndex, 0, 2, true);
    }

    @Override
    public void writeWorkbook(List<Map<String, Object>> dataList, Workbook workbook, int sheetAtIndex, int excelTitleIndex, int createStartRowIndex, boolean deleteFirstRow) {
        if (dataList != null && dataList.size() > 0) {
            List<String> excelTitle = getExcelTitle(workbook.getSheetAt(sheetAtIndex), excelTitleIndex);
            for (int i = 0; i < dataList.size(); i++) {
                Map<String, Object> map = dataList.get(i);
                Row row = workbook.getSheetAt(sheetAtIndex).createRow(i + createStartRowIndex);
                for (int z = 0; z < excelTitle.size(); z++) {
                    Cell excelCell = row.createCell(z);
                    excelCell.setCellValue(StrUtil.trimToEmpty(map.get(excelTitle.get(z))));
                }
            }
        }
        if(deleteFirstRow) {
            workbook.getSheetAt(sheetAtIndex).shiftRows(1, workbook.getSheetAt(sheetAtIndex).getLastRowNum(), -1);
        }
    }

    @Override
    public <T> List<T> xlsImport(InputStream fin, String fileName, Class<T> clazz) throws Exception {

        Workbook workbook = getWorkbook(fin, fileName);
        return xlsImport(workbook, clazz);
    }

    @Override
    public <T> List<T> xlsImport(Workbook workbook, Class<T> clazz) throws Exception {

        Sheet sheet = workbook.getSheetAt(0);
        List<T> resultList = new ArrayList<T>();

        int rowCount = sheet.getLastRowNum();
        int columnCount = sheet.getRow(0).getLastCellNum();

        Row firstExcelRow = sheet.getRow(0);

        for (int row = 2; row <= rowCount; row++) {
            Row excelRow = sheet.getRow(row);
            if (excelRow == null) continue;

            T currentRowObject = clazz.newInstance();
            for (int col = 0; col < columnCount; col++) {

                if(firstExcelRow.getCell(col) != null && excelRow.getCell(col) != null) {
                    firstExcelRow.getCell(col).setCellType(Cell.CELL_TYPE_STRING);
                    excelRow.getCell(col).setCellType(Cell.CELL_TYPE_STRING);
                    if (StringUtils.isNotBlank(firstExcelRow.getCell(col).getStringCellValue()) && StringUtils.isNotBlank(excelRow.getCell(col).getStringCellValue())) {
                        String colName = firstExcelRow.getCell(col).getStringCellValue();
                        BeanUtils.setProperty(currentRowObject, colName, excelRow.getCell(col).getStringCellValue());
                    }
                }
            }
            resultList.add(currentRowObject);

        }
        return resultList;
    }

}
