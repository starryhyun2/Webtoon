package com.korea.webtoon;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.WebtoonDAO;
import util.Common;
import vo.EpisodeVO;

@Controller
public class WebtoonController {
	WebtoonDAO webtoon_DAO;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext app;

	public void setWebtoon_DAO(WebtoonDAO webtoon_DAO) {
		this.webtoon_DAO = webtoon_DAO;
	}
	
	@RequestMapping("/show")
	public String showEpi(Model model, int idx) {
		model.addAttribute("vo", webtoon_DAO.selectOne(idx));
		model.addAttribute("epi",webtoon_DAO.selectEpi(idx));
		return Common.SHOW_PATH+"show_page.jsp";
	}
	
	@RequestMapping("/Epi")
	public String Epiindex(Model model,int episode_idx) {
		EpisodeVO epi = webtoon_DAO.selectOne1(episode_idx);
		model.addAttribute("epi",epi);
		
		String webPath = "/resources/"+epi.getPath()+"/"+epi.getEpisodeName();
		String savePath = app.getRealPath(webPath);//절대경로
		
		
		//파일 갯수를 확인하기 위해서
		File saved = new File(savePath);
		int cnt = saved.listFiles().length;
			
		model.addAttribute("cnt", cnt);
		return Common.SHOW_PATH+"epi_index.jsp";
	}
	
	@RequestMapping("/addEpi_form")
	public String addEpi_form(int episode_idx) {
		
		return Common.ADMIN_PATH+"admin_addEpi_form.jsp";
	}
	
	
	
	

}
