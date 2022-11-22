package com.korea.webtoon;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;

import dao.WebtoonDAO;

@Controller
public class WebtoonController {
	WebtoonDAO webtoon_DAO;

	public void setWebtoon_DAO(WebtoonDAO webtoon_DAO) {
		this.webtoon_DAO = webtoon_DAO;
	}
	
	
	
	

}
