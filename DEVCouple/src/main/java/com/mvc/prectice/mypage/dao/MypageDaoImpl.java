package com.mvc.prectice.mypage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.mypage.dto.MypageDto;

@Repository
public class MypageDaoImpl implements MypageDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MypageDto selectMyInfo(String id) {
		MypageDto dto = new MypageDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectMyInfo",id);
		} catch (Exception e) {
			System.out.println("[error]:selectMyInfo");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int reviseAllinfo(MypageDto mypagedto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "reviseAllinfo",mypagedto);
		} catch (Exception e) {
			System.out.println("[error]:reviseAllinfo");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteMyinfo(MypageDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deleteMyinfo",dto);
		} catch (Exception e) {
			System.out.println("[error]:deleteMyinfo");
			e.printStackTrace();
		}
		return res;
	}

}
