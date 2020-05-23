package com.mvc.prectice.signup.biz;

import org.springframework.stereotype.Service;

import com.mvc.prectice.signup.dto.SignupDto;

@Service
public interface SignupBiz {

	public int idchk(String id);
	public int emailchk(String email);
	public int insertAllinfo(SignupDto signupdto);
}
