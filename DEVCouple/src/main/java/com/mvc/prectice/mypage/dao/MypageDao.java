package com.mvc.prectice.mypage.dao;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.mypage.dto.MypageDto;

@Repository
public interface MypageDao {

	String NAMESPACE = "mypagequery.";
	public MypageDto selectMyInfo(String id);
	public int reviseAllinfo(MypageDto mypagedto);
	public int deleteMyinfo(MypageDto dto);
	
}
