package com.mvc.prectice.signup.dao;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.signup.dto.SignupDto;

@Repository
public interface SignupDao {

	String NAMESPACE = "signupquery.";
	public int idchk(String id);
	public int emailchk(String email);
	public int insertAllinfo(SignupDto signupdto);
}
