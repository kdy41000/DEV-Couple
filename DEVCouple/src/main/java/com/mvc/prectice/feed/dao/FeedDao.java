package com.mvc.prectice.feed.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.feed.dto.FeedDto;

@Repository
public interface FeedDao {

	String NAMESPACE = "feedquery.";
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
