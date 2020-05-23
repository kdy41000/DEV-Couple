package com.mvc.prectice.aboutme.dao;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.aboutme.dto.AboutmeDto;

@Repository
public interface AboutmeDao {

	String NAMESPACE = "aboutmequery.";
	public AboutmeDto selectOne(String id);
	public int insertAboutme(AboutmeDto dto);
	public int updateAboutme(AboutmeDto dto);
	public int deleteAboutme(int seq);
}
