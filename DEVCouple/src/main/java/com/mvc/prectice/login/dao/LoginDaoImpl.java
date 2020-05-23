package com.mvc.prectice.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.login.dto.LoginDto;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public LoginDto selectInfo(LoginDto logindto) {
		LoginDto dto = new LoginDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectInfo",logindto);
		} catch (Exception e) {
			System.out.println("[error]:selectInfo");
			e.printStackTrace();
		}
		return dto;
	}

}
