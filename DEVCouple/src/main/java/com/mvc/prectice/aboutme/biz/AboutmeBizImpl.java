package com.mvc.prectice.aboutme.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.aboutme.dao.AboutmeDao;
import com.mvc.prectice.aboutme.dto.AboutmeDto;

@Service
public class AboutmeBizImpl implements AboutmeBiz{

	@Autowired
	private AboutmeDao dao;
	
	@Override
	public AboutmeDto selectOne(String id) {
		// TODO Auto-generated method stub
		return dao.selectOne(id);
	}

	@Override
	public int insertAboutme(AboutmeDto dto) {
		// TODO Auto-generated method stub
		return dao.insertAboutme(dto);
	}

	@Override
	public int updateAboutme(AboutmeDto dto) {
		// TODO Auto-generated method stub
		return dao.updateAboutme(dto);
	}

	@Override
	public int deleteAboutme(int seq) {
		// TODO Auto-generated method stub
		return dao.deleteAboutme(seq);
	}

}
