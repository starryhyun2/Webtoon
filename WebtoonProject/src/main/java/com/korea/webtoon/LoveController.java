package com.korea.webtoon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.LoveDAO;
import vo.LoveVO;
import vo.WebtoonCommentsVO;

@Controller
public class LoveController {

	LoveDAO love_dao;

	public void setLove_dao(LoveDAO love_dao) {
		this.love_dao = love_dao;
	}

	//댓글 좋아요 기능 
	@RequestMapping("giveLove.do")
	@ResponseBody
	public String give_love(WebtoonCommentsVO vo) {
		LoveVO love_vo =love_dao.findByID_comments(vo);
		
		System.out.println(vo.getComments_idx());
		int love = vo.getLove();
		if(love_vo== null) {
			love+=1;
			vo.setLove(love);
			love_dao.insert(vo);
			love_dao.update_love(vo);

			return "clear";
		}else {
			love-=1;
			vo.setLove(love);
			love_dao.delete(vo);
			love_dao.update_love(vo);
			return "cancle";
		}
	}


}
