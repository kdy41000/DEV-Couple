package com.mvc.prectice.poi.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.prectice.board.biz.BoardBiz;
import com.mvc.prectice.board.dto.BoardDto;

@Controller
public class PoiController {

	private Logger logger = LoggerFactory.getLogger(PoiController.class);
	
	@Autowired
	private BoardBiz boardbiz;
	
	@RequestMapping("/poi")
	public void Poi(HttpServletResponse response) throws IOException {
		logger.info("Poi");
		List<BoardDto>list = boardbiz.selectAllPoi();
		
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("게시판");  //엑셀파일 아래의 title지정
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		// 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    //배경색은 DARF YELLO
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());;
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    //데이터는 가운데로 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    
	    //데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("번호");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("작성자");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("제목");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("날짜");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("조회수");
    	
    	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	    //데이터 부분 생성
	    for(BoardDto dto: list) {
	    	row = sheet.createRow(rowNo++);
	    	cell = row.createCell(0);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(dto.getSeq());
	    	cell = row.createCell(1);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(dto.getId());
	    	cell = row.createCell(2);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(dto.getTitle());
	    	cell = row.createCell(3);
	    	cell.setCellStyle(bodyStyle);

	    	cell.setCellValue(format.format(dto.getWrtdate()));
	    	cell = row.createCell(4);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(dto.getCnt());
	    }
	   
	    
	    //컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=poitest.xls");
		
	    //엑셀출력
	    wb.write(response.getOutputStream());
	    wb.close();

	}
}
