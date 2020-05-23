package com.mvc.prectice.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.board.dto.BoardDto;

@Repository
public interface BoardDao {

	String NAMESPACE = "boardquery.";
	public int totalpage();
	public List<BoardDto>selectList(int startseq, int endseq);
	
	public int totalpageId(String inputVal);
	public List<BoardDto>searchIdList(int startseq, int endseq, String inputVal);
	
	public int totalpageTitle(String inputVal);
	public List<BoardDto>searchTitleList(int startseq, int endseq, String inputVal);
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
