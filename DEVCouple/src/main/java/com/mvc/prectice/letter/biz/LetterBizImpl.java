package com.mvc.prectice.letter.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.letter.dao.LetterDao;
import com.mvc.prectice.letter.dto.LetterDto;
import com.mvc.prectice.letter.dto.LetterPagingDto;

@Service
public class LetterBizImpl implements LetterBiz{

	@Autowired
	private LetterDao dao;
	
	@Override
	public LetterDto selectNewLetter(String id) {
		// TODO Auto-generated method stub
		return dao.selectNewLetter(id);
	}

	@Override
	public int getTotalPage(int column, String id) {
		int totalpage = (int)Math.ceil((double)dao.getTotalPage(id)/column);
		return totalpage;
	}
	
	@Override
	public List<LetterDto> selectGetLetterList(LetterPagingDto dto, String id) {
		int currentpage = dto.getCurrentpage();
		int column = dto.getColumn();
		
		int startseq = column * (currentpage - 1) + 1;
		int endseq = column * currentpage;
		
		return dao.selectGetLetterList(startseq,endseq,id);
	}
	
	@Override
	public int updateReadStatus(int letterseq) {
		// TODO Auto-generated method stub
		return dao.updateReadStatus(letterseq);
	}

	@Override
	public LetterDto selectDetailLetter(int letterseq) {
		// TODO Auto-generated method stub
		return dao.selectDetailLetter(letterseq);
	}

	@Override
	public int insertLetter(LetterDto letterdto) {
		// TODO Auto-generated method stub
		return dao.insertLetter(letterdto);
	}

	@Override
	public int sentTotalPage(int column, String id) {
		int totalpage = (int)Math.ceil((double)dao.sentTotalPage(id)/column);
		return totalpage;
	}

	@Override
	public List<LetterDto> selectSentLetterList(LetterPagingDto dto, String id) {
		int currentpage = dto.getCurrentpage();
		int column = dto.getColumn();
		
		int startseq = column * (currentpage - 1) + 1;
		int endseq = column * currentpage;
		
		return dao.selectSentLetterList(startseq,endseq,id);
	}

	@Override
	public int deleteLetter(int letterseq) {
		// TODO Auto-generated method stub
		return dao.deleteLetter(letterseq);
	}

}
