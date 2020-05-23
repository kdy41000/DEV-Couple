package com.mvc.prectice.letter.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.letter.dto.LetterDto;
import com.mvc.prectice.letter.dto.LetterPagingDto;

@Repository
public interface LetterDao {

	String NAMESPACE = "letterquery.";
	public LetterDto selectNewLetter(String id);
	
	public int getTotalPage(String id);
	public List<LetterDto>selectGetLetterList(int startseq, int endseq, String id);
	public int updateReadStatus(int letterseq);
	public LetterDto selectDetailLetter(int letterseq);
	public int insertLetter(LetterDto letterdto);
	public int sentTotalPage(String id);
	public List<LetterDto>selectSentLetterList(int startseq, int endseq, String id);
	public int deleteLetter(int letterseq);
}
