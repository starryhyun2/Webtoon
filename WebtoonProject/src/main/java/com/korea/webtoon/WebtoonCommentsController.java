package com.korea.webtoon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.LoveDAO;
import dao.WebtoonCommentsDAO;
import vo.WebtoonCommentsVO;


@Controller
public class WebtoonCommentsController {
	
	WebtoonCommentsDAO webtoonCommentsDAO;

	LoveDAO love_dao;

	public void setWebtoonCommentsDAO(WebtoonCommentsDAO webtoonCommentsDAO) {
		this.webtoonCommentsDAO = webtoonCommentsDAO;
	}
	
	public void setLove_dao(LoveDAO love_dao) {
		this.love_dao = love_dao;
	}
	
	//웹툰 댓글 추가
	@RequestMapping("webtoon_reply_insert")
	public String webtoon_reply_insert(WebtoonCommentsVO vo) {
		
		//나중에 IP 추가를 위한 코드
		//vo.setIp( request.getRemoteAddr());
		int episode_idx = vo.getEpisode_idx();
		webtoonCommentsDAO.update_step(episode_idx);
		webtoonCommentsDAO.insert(vo);
		return "redirect:Epi?episode_idx="+vo.getEpisode_idx();
		
	}
	
	//웹툰 댓글 수정 코드
	@RequestMapping("modify_wc.do")
	public String modify_wc(WebtoonCommentsVO vo) {
		webtoonCommentsDAO.update(vo);
		return "redirect:Epi?episode_idx="+vo.getEpisode_idx();
	}
	
	//웹툰 댓글 삭제 코드
	@RequestMapping("del_wc.do")
	public String del_wc(WebtoonCommentsVO vo) {
		int epi = vo.getEpisode_idx();
		webtoonCommentsDAO.delete(vo);
		return "redirect:Epi?episode_idx="+epi;
	}
	
}
