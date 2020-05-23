package com.mvc.prectice.aboutme.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.aboutme.dto.AboutmeDto;

@Repository
public class AboutmeDaoImpl implements AboutmeDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public AboutmeDto selectOne(String id) {
		AboutmeDto dto = new AboutmeDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne",id);
		} catch (Exception e) {
			System.out.println("selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insertAboutme(AboutmeDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insertAboutme",dto);
		} catch (Exception e) {
			System.out.println("insertAboutme");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateAboutme(AboutmeDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updateAboutme",dto);
		} catch (Exception e) {
			System.out.println("updateAboutme");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteAboutme(int seq) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deleteAboutme",seq);
		} catch (Exception e) {
			System.out.println("deleteAboutme");
			e.printStackTrace();
		}
		return res;
	}

}
