package org.bansang.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.bansang.dto.GroupMemberDTO;

import lombok.extern.java.Log;

@Log
public class ReadGroupExcel {

	// excel �뙆�씪濡쒕��꽣 洹몃９ �젙蹂대�� �씫�뒗�떎.
	public List<GroupMemberDTO> readGroupFromExcelFile(String excelFilePath) throws IOException {
	    List<GroupMemberDTO> listGroup = new ArrayList<GroupMemberDTO>();
	    FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
	 
	    Workbook workbook = getWorkbook(inputStream, excelFilePath);
	    Sheet firstSheet = workbook.getSheetAt(0);
	    Iterator<Row> iterator = firstSheet.iterator();
	    
	    // �몢踰덉㎏ row遺��꽣 泥댄겕 (泥ル쾲吏� row�뒗 �뀒�씠釉� �젙蹂� row)
	    iterator.next();
	 
	    while (iterator.hasNext()) {
	        Row nextRow = iterator.next();
	        Iterator<Cell> cellIterator = nextRow.cellIterator();
	        GroupMemberDTO dto = new GroupMemberDTO();
	 
	        while (cellIterator.hasNext()) {
	            Cell nextCell = cellIterator.next();
	            int columnIndex = nextCell.getColumnIndex();
	            log.info("===================");
	            log.info("" + columnIndex + ", " + (String)getCellValue(nextCell));
	            log.info("===================");
	 
	            switch (columnIndex) {
	            case 0:
	                dto.setMemberName((String) getCellValue(nextCell));
	                break;
	            case 1:
	                dto.setMemberEmail((String) getCellValue(nextCell));
	                break;
	            }
	        }
	        listGroup.add(dto);
	    }
	 
	    workbook.close();
	    inputStream.close();
	 
	    return listGroup;
	}
	
	// cell 媛믪쓽 �삎�떇�쓣 紐⑤몢 string�쑝濡�
	@SuppressWarnings("deprecation")
	private Object getCellValue(Cell cell) {
	    switch (cell.getCellType()) {
	    case Cell.CELL_TYPE_STRING:
	        return cell.getStringCellValue();
	 
	    case Cell.CELL_TYPE_BOOLEAN:
	        return cell.getBooleanCellValue();
	 
	    case Cell.CELL_TYPE_NUMERIC:
	        return cell.getNumericCellValue();
	    }
	    return null;
	}
	
	// xlsx�뙆�씪�씤吏� xls�뙆�씪�씤吏� �뙋蹂�
	private Workbook getWorkbook(FileInputStream inputStream, String excelFilePath)
	        throws IOException {
	    Workbook workbook = null;
	 
	    if (excelFilePath.endsWith("xlsx")) {
	        workbook = new XSSFWorkbook(inputStream);
	    } else if (excelFilePath.endsWith("xls")) {
	        workbook = new HSSFWorkbook(inputStream);
	    } else {
	        throw new IllegalArgumentException("The specified file is not Excel file");
	    }
	 
	    return workbook;
	}
}