package com.mvc.prectice.signup.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.signup.dao.SignupDao;
import com.mvc.prectice.signup.dto.SignupDto;

@Service
public class SignupBizImpl implements SignupBiz{

	@Autowired
	private SignupDao dao;
	
	@Override
	public int idchk(String id) {
		// TODO Auto-generated method stub
		return dao.idchk(id);
	}
	
	@Override
	public int emailchk(String email) {
		// TODO Auto-generated method stub
		return dao.emailchk(email);
	}

	@Override
	public int insertAllinfo(SignupDto signupdto) {
		// TODO Auto-generated method stub
		return dao.insertAllinfo(signupdto);
	}

	
}
