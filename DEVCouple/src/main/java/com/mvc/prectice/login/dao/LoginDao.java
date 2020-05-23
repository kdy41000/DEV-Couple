package com.mvc.prectice.login.dao;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.login.dto.LoginDto;

@Repository
public interface LoginDao {

	String NAMESPACE = "loginquery.";
	public LoginDto selectInfo(LoginDto logindto);
}
