package com.mvc.prectice.letter.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.letter.dto.LetterDto;
import com.mvc.prectice.letter.dto.LetterPagingDto;

@Repository
public class LetterDaoImpl implements LetterDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public LetterDto selectNewLetter(String id) {
		LetterDto dto = new LetterDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectNewLetter",id);
		} catch (Exception e) {
			System.out.println("[error]:selectNewLetter");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int getTotalPage(String id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "LetterGettotalpage",id);
		} catch (Exception e) {
			System.out.println("[error]:LetterGettotalpage");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<LetterDto> selectGetLetterList(int startseq, int endseq, String id) {
		List<LetterDto>letterList = new ArrayList<LetterDto>();
		LetterPagingDto pagingdto = new LetterPagingDto();
		
		try {
			pagingdto.setStartseq(startseq);
			pagingdto.setEndseq(endseq);
			pagingdto.setId(id);
			letterList = sqlSession.selectList(NAMESPACE + "selectGetLetterList",pagingdto);
		} catch (Exception e) {
			System.out.println("[error]:selectGetLetterList");
			e.printStackTrace();
		}
		return letterList;
	}

	@Override
	public int updateReadStatus(int letterseq) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updateReadStatus",letterseq);
		} catch (Exception e) {
			System.out.println("[error]:updateReadStatus");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public LetterDto selectDetailLetter(int letterseq) {
		LetterDto letterdto = new LetterDto();
		
		try {
			letterdto = sqlSession.selectOne(NAMESPACE + "selectDetailLetter",letterseq);
		} catch (Exception e) {
			System.out.println("[error]:selectDetailLetter");
			e.printStackTrace();
		}
		return letterdto;
	}

	@Override
	public int insertLetter(LetterDto letterdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertLetter",letterdto);
		} catch (Exception e) {
			System.out.println("[error]:insertLetter");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int sentTotalPage(String id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "LetterSenttotalpage",id);
		} catch (Exception e) {
			System.out.println("[error]:LetterSenttotalpage");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<LetterDto> selectSentLetterList(int startseq, int endseq, String id) {
		List<LetterDto>letterList = new ArrayList<LetterDto>();
		LetterPagingDto pagingdto = new LetterPagingDto();
		
		try {
			pagingdto.setStartseq(startseq);
			pagingdto.setEndseq(endseq);
			pagingdto.setId(id);
			letterList = sqlSession.selectList(NAMESPACE + "selectSentLetterList",pagingdto);
		} catch (Exception e) {
			System.out.println("[error]:selectSentLetterList");
			e.printStackTrace();
		}
		return letterList;
	}

	@Override
	public int deleteLetter(int letterseq) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deleteLetter",letterseq);
		} catch (Exception e) {
			System.out.println("[error]:deleteLetter");
			e.printStackTrace();
		}
		return res;
	}

}
