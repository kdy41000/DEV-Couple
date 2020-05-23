package com.mvc.prectice.mypage.biz;

import org.springframework.stereotype.Service;

import com.mvc.prectice.mypage.dto.MypageDto;

@Service
public interface MypageBiz {

	public MypageDto selectMyInfo(String id);
	public int reviseAllinfo(MypageDto mypagedto);
	public int deleteMyinfo(MypageDto dto);
}
