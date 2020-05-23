package com.mvc.prectice.aboutme.biz;

import org.springframework.stereotype.Service;

import com.mvc.prectice.aboutme.dto.AboutmeDto;

@Service
public interface AboutmeBiz {

	public AboutmeDto selectOne(String id);
	public int insertAboutme(AboutmeDto dto);
	public int updateAboutme(AboutmeDto dto);
	public int deleteAboutme(int seq);
}
