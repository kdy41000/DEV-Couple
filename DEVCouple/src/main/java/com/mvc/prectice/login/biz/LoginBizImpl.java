package com.mvc.prectice.login.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.login.dao.LoginDao;
import com.mvc.prectice.login.dto.LoginDto;

@Service
public class LoginBizImpl implements LoginBiz{

	@Autowired
	private LoginDao dao;
	
	@Override
	public LoginDto selectInfo(LoginDto logindto) {
		// TODO Auto-generated method stub
		return dao.selectInfo(logindto);
	}

}
