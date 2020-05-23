package com.mvc.prectice.board.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.prectice.board.dto.BoardDto;
import com.mvc.prectice.board.dto.PagingDto;

@Service
public interface BoardBiz {
    //초기화면
	public int totalPage(int column);
	public List<BoardDto>selectList(PagingDto dto);
	//아이디로 검색
	public int totalPageId(int column,String inputVal);
	public List<BoardDto>searchIdList(PagingDto pagingdto, String inputVal);
    //제목으로 검색
	public int totalPageTitle(int column,String inputVal);
	public List<BoardDto>searchTitleList(PagingDto pagingdto, String inputVal);
	//UpdateCnt
	public int updatecnt(int seq);
	//Detail
	public BoardDto selectOne(int seq);
	//Write
	public int insertBoard(BoardDto dto);
	//Delete
	public int deleteBoard(int seq);
	//Update
	public int updateBoard(BoardDto dto);
	//댓글 출력
	public List<BoardDto>selectRecentReplyList(int seq);
	//댓글 삭제
	public int deleteReply(int replyseq);
	
	//댓글 INSERT
	public int insertReple(BoardDto dto);
	//댓글 SELECT
	public List<BoardDto> selectReple(int seq);
	
	//poi
	public List<BoardDto> selectAllPoi();
	
	
}
