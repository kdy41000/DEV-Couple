package com.mvc.prectice.feed.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.feed.dao.FeedDao;
import com.mvc.prectice.feed.dto.FeedDto;

@Service
public class FeedBizImpl implements FeedBiz{

	@Autowired
	private FeedDao dao;
	
	@Override
	public List<FeedDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public int insertAllFeed(FeedDto feeddto) {
		// TODO Auto-generated method stub
		return dao.insertAllFeed(feeddto);
	}

	@Override
	public int deletefeed(int feedno) {
		// TODO Auto-generated method stub
		return dao.deletefeed(feedno);
	}

	@Override
	public int insertComment(FeedDto dto) {
		// TODO Auto-generated method stub
		return dao.insertComment(dto);
	}

	@Override
	public FeedDto selectComment(int feedno) {
		// TODO Auto-generated method stub
		return dao.selectComment(feedno);
	}

	@Override
	public List<FeedDto> selectCommentList() {
		// TODO Auto-generated method stub
		return dao.selectCommentList();
	}

	@Override
	public int deleteMycomment(int reno) {
		// TODO Auto-generated method stub
		return dao.deleteMycomment(reno);
	}

	@Override
	public List<FeedDto> selectCommentCountList() {
		// TODO Auto-generated method stub
		return dao.selectCommentCountList();
	}

	@Override
	public List<FeedDto> selectLikeCountList() {
		// TODO Auto-generated method stub
		return dao.selectLikeCountList();
	}

	@Override
	public FeedDto selectLikeStatus(FeedDto dto) {
		// TODO Auto-generated method stub
		return dao.selectLikeStatus(dto);
	}
	
	@Override
	public int insertNewlikestatus(FeedDto dto) {
		// TODO Auto-generated method stub
		return dao.insertNewlikestatus(dto);
	}
	
	@Override
	public int updatelikegoodstatus(FeedDto dto) {
		// TODO Auto-generated method stub
		return dao.updatelikegoodstatus(dto);
	}
	
	@Override
	public int updatelikebadstatus(FeedDto dto) {
		// TODO Auto-generated method stub
		return dao.updatelikebadstatus(dto);
	}

	@Override
	public List<FeedDto> selectComparableLikeStatus(String id) {
		// TODO Auto-generated method stub
		return dao.selectComparableLikeStatus(id);
	}


}
