package com.korea.webtoon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.WebtoonDAO;
import util.Common;

@Controller
public class WebtoonController {
	WebtoonDAO webtoon_DAO;

	public void setWebtoon_DAO(WebtoonDAO webtoon_DAO) {
		this.webtoon_DAO = webtoon_DAO;
	}
	
	@RequestMapping("/show")
	public String showPage(Model model, int idx) {
		model.addAttribute("vo", webtoon_DAO.selectOne(idx));
		return Common.SHOW_PATH+"show_page.jsp";
	}
	
	
	
	

}
