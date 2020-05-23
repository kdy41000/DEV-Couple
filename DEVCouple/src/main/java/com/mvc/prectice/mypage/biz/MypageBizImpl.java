package com.mvc.prectice.mypage.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.mypage.dao.MypageDao;
import com.mvc.prectice.mypage.dto.MypageDto;

@Service
public class MypageBizImpl implements MypageBiz{

	@Autowired
	private MypageDao dao;
	
	@Override
	public MypageDto selectMyInfo(String id) {
		// TODO Auto-generated method stub
		return dao.selectMyInfo(id);
	}

	@Override
	public int reviseAllinfo(MypageDto mypagedto) {
		// TODO Auto-generated method stub
		return dao.reviseAllinfo(mypagedto);
	}

	@Override
	public int deleteMyinfo(MypageDto dto) {
		// TODO Auto-generated method stub
		return dao.deleteMyinfo(dto);
	}

}
