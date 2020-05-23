package com.mvc.prectice.signup.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.signup.dto.SignupDto;

@Repository
public class SignupDaoImpl implements SignupDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int idchk(String id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "idchk",id);
		} catch (Exception e) {
			System.out.println("[error]:idchk");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int emailchk(String email) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "emailchk",email);
		} catch (Exception e) {
			System.out.println("[error]:emailchk");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertAllinfo(SignupDto signupdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertAllinfo",signupdto);
		} catch (Exception e) {
			System.out.println("[error]:insertAllinfo");
			e.printStackTrace();
		}
		return res;
	}

}
