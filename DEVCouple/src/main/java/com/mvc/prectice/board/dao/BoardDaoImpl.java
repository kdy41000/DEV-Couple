package com.mvc.prectice.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int totalpage() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "totalpage");
		} catch (Exception e) {
			System.out.println("[error]:totalpage");
		}
		
		return res;
	}
	
	@Override
	public List<BoardDto> selectList(int startseq, int endseq) {
		List<BoardDto>list = new ArrayList<BoardDto>();
		PagingDto dto = new PagingDto();
		
		try {
			dto.setStartseq(startseq);
			dto.setEndseq(endseq);
			list = sqlSession.selectList(NAMESPACE + "selectList",dto);
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int totalpageId(String inputVal) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "totalpageId",inputVal);
		} catch (Exception e) {
			System.out.println("[error]:totalpageId");
		}
		
		return res;
	}

	@Override
	public List<BoardDto> searchIdList(int startseq, int endseq, String inputVal) {
		List<BoardDto>list = new ArrayList<BoardDto>();
		PagingDto dto = new PagingDto();
		try {
			dto.setStartseq(startseq);
			dto.setEndseq(endseq);
			dto.setInputval(inputVal);
			System.out.println(dto.getStartseq()+" " +dto.getEndseq() + " " + dto.getInputval());
			list = sqlSession.selectList(NAMESPACE + "searchIdList",dto);
			
			System.out.println(list.get(0).getId()+"**************Dao");
		} catch (Exception e) {
			System.out.println("[error]:searchIdList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int totalpageTitle(String inputVal) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "totalpageTitle",inputVal);
		} catch (Exception e) {
			System.out.println("[error]:totalpageTitle");
		}
		
		return res;
	}

	@Override
	public List<BoardDto> searchTitleList(int startseq, int endseq, String inputVal) {
		List<BoardDto>list = new ArrayList<BoardDto>();
		PagingDto dto = new PagingDto();
		try {
			dto.setStartseq(startseq);
			dto.setEndseq(endseq);
			dto.setInputval(inputVal);
			System.out.println(dto.getStartseq()+" " +dto.getEndseq() + " " + dto.getInputval());
			list = sqlSession.selectList(NAMESPACE + "searchTitleList",dto);
			
			System.out.println(list.get(0).getId()+"**************Dao");
		} catch (Exception e) {
			System.out.println("[error]:searchTitleList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updatecnt(int seq) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updatecnt",seq);
		} catch (Exception e) {
			System.out.println("[error]:updatecnt");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public BoardDto selectOne(int seq) {
		BoardDto dto = new BoardDto();
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne",seq);
		} catch (Exception e) {
			System.out.println("[error]:selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insertBoard(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertBoard",dto);
		} catch (Exception e) {
			System.out.println("[error]:insertBoard");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int deleteBoard(int seq) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deleteBoard",seq);
		} catch (Exception e) {
			System.out.println("[error]:deleteBoard");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateBoard(BoardDto dto) {
		int res = 0;
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getSeq());
		try {
			res = sqlSession.update(NAMESPACE + "updateBoard",dto);
		} catch (Exception e) {
			System.out.println("[error]:updateBoard");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<BoardDto> selectRecentReplyList(int seq) {
		List<BoardDto>list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectRecentReplyList",seq);
		} catch (Exception e) {
			System.out.println("[error]:selectRecentReplyList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteReply(int replyseq) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deleteReply",replyseq);
		} catch (Exception e) {
			System.out.println("[error]:deleteReply");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertReple(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertReple",dto);
		} catch (Exception e) {
			System.out.println("[error]:insertReple");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<BoardDto> selectReple(int seq) {
		List<BoardDto>list = new ArrayList<BoardDto>();
		BoardDto dto = new BoardDto();
		
		try {
			System.out.println(seq+"!!!!!!!!!!디티오에서 seq");
			list = sqlSession.selectList(NAMESPACE + "selectReple",seq);
			
			System.out.println(list.get(0).getSeq()+"**************Dao");
			
		} catch (Exception e) {
			System.out.println("[error]:selectReple");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BoardDto> selectAllPoi() {
		List<BoardDto>list = new ArrayList<BoardDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectAllPoi");
		} catch (Exception e) {
			System.out.println("[error]:selectAllPoi");
			e.printStackTrace();
		}
		return list;
	}

}
