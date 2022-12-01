package com.korea.webtoon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.WebtoonCommentsDAO;
import vo.WebtoonCommentsVO;


@Controller
public class WebtoonCommentsController {
	
	WebtoonCommentsDAO webtoonCommentsDAO;

	public void setWebtoonCommentsDAO(WebtoonCommentsDAO webtoonCommentsDAO) {
		this.webtoonCommentsDAO = webtoonCommentsDAO;
	}
	
	//웹툰 댓글 추가
	@RequestMapping("webtoon_reply_insert")
	public String webtoon_reply_insert(WebtoonCommentsVO vo) {
		
		//나중에 IP 추가를 위한 코드
		//vo.setIp( request.getRemoteAddr());
		webtoonCommentsDAO.insert(vo);
		return "redirect:Epi?episode_idx="+vo.getEpisode_idx();
		
	}
	
}
