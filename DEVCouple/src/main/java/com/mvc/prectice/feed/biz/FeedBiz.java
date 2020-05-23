package com.mvc.prectice.feed.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.prectice.feed.dto.FeedDto;

@Service
public interface FeedBiz {

	public List<FeedDto>selectList();
	public int insertAllFeed(FeedDto feeddto);
	public int deletefeed(int feedno);
	public int insertComment(FeedDto dto);
	public FeedDto selectComment(int feedno);
	public List<FeedDto>selectCommentList();
	public int deleteMycomment(int reno);
	public List<FeedDto>selectCommentCountList();
	public List<FeedDto>selectLikeCountList();
	public FeedDto selectLikeStatus(FeedDto dto);
	public int insertNewlikestatus(FeedDto dto);
	public int updatelikegoodstatus(FeedDto dto);
	public int updatelikebadstatus(FeedDto dto);
	public List<FeedDto>selectComparableLikeStatus(String id);
	
}
