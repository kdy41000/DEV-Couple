package com.mvc.prectice.feed.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.feed.dto.FeedDto;

@Repository
public class FeedDaoImpl implements FeedDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FeedDto> selectList() {
		List<FeedDto>list = new ArrayList<FeedDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[error]:selectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertAllFeed(FeedDto feeddto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insertAllFeed",feeddto);
		} catch (Exception e) {
			System.out.println("[error]:insertAllFeed");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deletefeed(int feedno) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deletefeed",feedno);
		} catch (Exception e) {
			System.out.println("[error]:deletefeed");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertComment(FeedDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertComment",dto);
		} catch (Exception e) {
			System.out.println("[error]:insertComment");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public FeedDto selectComment(int feedno) {
		FeedDto dto = new FeedDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectComment",feedno);
		} catch (Exception e) {
			System.out.println("[error]:selectComment");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<FeedDto> selectCommentList() {
		List<FeedDto>list = new ArrayList<FeedDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectCommentList");
		} catch (Exception e) {
			System.out.println("[error]:selectCommentList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteMycomment(int reno) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "deleteMycomment",reno);
		} catch (Exception e) {
			System.out.println("[error]:deleteMycomment");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<FeedDto> selectCommentCountList() {
		List<FeedDto>list = new ArrayList<FeedDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectCommentCountList");
		} catch (Exception e) {
			System.out.println("[error]:selectCommentCountList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FeedDto> selectLikeCountList() {
		List<FeedDto>list = new ArrayList<FeedDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectLikeCountList");
		} catch (Exception e) {
			System.out.println("[error]:selectLikeCountList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public FeedDto selectLikeStatus(FeedDto dto) {
		FeedDto compareinfo = new FeedDto();
		try {
			compareinfo = sqlSession.selectOne(NAMESPACE + "selectLikeStatus",dto);
		} catch (Exception e) {
			System.out.println("[error]:selectLikeStatus");
			e.printStackTrace();
		}
		return compareinfo;
	}
	
	@Override
	public int insertNewlikestatus(FeedDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "insertNewlikestatus",dto);
		} catch (Exception e) {
			System.out.println("[error]:insertNewlikestatus");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int updatelikegoodstatus(FeedDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updatelikegoodstatus",dto);
		} catch (Exception e) {
			System.out.println("[error]:updatelikegoodstatus");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int updatelikebadstatus(FeedDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updatelikebadstatus",dto);
		} catch (Exception e) {
			System.out.println("[error]:updatelikebadstatus");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<FeedDto> selectComparableLikeStatus(String id) {
		List<FeedDto>list = new ArrayList<FeedDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectComparableLikeStatus",id);
		} catch (Exception e) {
			System.out.println("[error]:selectComparableLikeStatus");
			e.printStackTrace();
		}
		return list;
	}

}
