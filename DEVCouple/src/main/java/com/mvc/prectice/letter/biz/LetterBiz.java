package com.mvc.prectice.letter.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.prectice.letter.dto.LetterDto;
import com.mvc.prectice.letter.dto.LetterPagingDto;

@Service
public interface LetterBiz {

	public LetterDto selectNewLetter(String id);
	
	public int getTotalPage(int column, String id);
	public List<LetterDto>selectGetLetterList(LetterPagingDto dto, String id);
	public int updateReadStatus(int letterseq);
	public LetterDto selectDetailLetter(int letterseq);
	public int insertLetter(LetterDto letterdto);
	public int sentTotalPage(int column, String id);
	public List<LetterDto>selectSentLetterList(LetterPagingDto dto, String id);
	public int deleteLetter(int letterseq);
}
