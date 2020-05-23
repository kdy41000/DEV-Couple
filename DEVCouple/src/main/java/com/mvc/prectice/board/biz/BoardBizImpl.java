package com.mvc.prectice.board.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.board.dao.BoardDao;
import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;

@Service
public class BoardBizImpl implements BoardBiz{

	@Autowired
	private BoardDao dao;
	
	@Override
	public int totalPage(int column) {
		int totalpage = (int)Math.ceil((double)dao.totalpage()/column);
		return totalpage;
	}
	
	@Override
	public List<BoardDto> selectList(PagingDto dto) {
		int currentpage = dto.getCurrentpage();
		int column = dto.getColumn();
		
		int startseq = column * (currentpage - 1) + 1;
		int endseq = column * currentpage;
		return dao.selectList(startseq, endseq);
	}

	@Override
	public int totalPageId(int column, String inputVal) {
		int totalpage = (int)Math.ceil((double)dao.totalpageId(inputVal)/column);
		return totalpage;
	}

	@Override
	public List<BoardDto> searchIdList(PagingDto dto, String inputVal) {
		int currentpage = dto.getCurrentpage();
		int column = dto.getColumn();
		
		int startseq = column * (currentpage - 1) + 1;
		int endseq = column * currentpage;
		return dao.searchIdList(startseq, endseq, inputVal);
	}

	@Override
	public int totalPageTitle(int column, String inputVal) {
		int totalpage = (int)Math.ceil((double)dao.totalpageTitle(inputVal)/column);
		return totalpage;
	}

	@Override
	public List<BoardDto> searchTitleList(PagingDto dto, String inputVal) {
		int currentpage = dto.getCurrentpage();
		int column = dto.getColumn();
		
		int startseq = column * (currentpage - 1) + 1;
		int endseq = column * currentpage;
		return dao.searchTitleList(startseq, endseq, inputVal);
	}
	
	@Override
	public int updatecnt(int seq) {
		// TODO Auto-generated method stub
		return dao.updatecnt(seq);
	}

	@Override
	public BoardDto selectOne(int seq) {
		
		return dao.selectOne(seq);
	}

	@Override
	public int insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.insertBoard(dto);
	}
	@Override
	public int deleteBoard(int seq) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(seq);
	}

	@Override
	public int updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.updateBoard(dto);
	}
	
	@Override
	public List<BoardDto> selectRecentReplyList(int seq) {
		// TODO Auto-generated method stub
		return dao.selectRecentReplyList(seq);
	}

	@Override
	public int deleteReply(int replyseq) {
		// TODO Auto-generated method stub
		return dao.deleteReply(replyseq);
	}

	@Override
	public int insertReple(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.insertReple(dto);
	}

	@Override
	public List<BoardDto> selectReple(int seq) {
		// TODO Auto-generated method stub
		return dao.selectReple(seq);
	}

	@Override
	public List<BoardDto> selectAllPoi() {
		// TODO Auto-generated method stub
		return dao.selectAllPoi();
	}

}
