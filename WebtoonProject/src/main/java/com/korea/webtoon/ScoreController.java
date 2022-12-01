package com.korea.webtoon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ScoreDAO;
import vo.ScoreVO;

@Controller
public class ScoreController {
	
	ScoreDAO score_dao;

	public void setScore_dao(ScoreDAO score_dao) {
		this.score_dao = score_dao;
	}
	
	//별점 주기 기능을 위한 메서드
	@RequestMapping("giveScore.do")
	@ResponseBody
	public String giveScore(ScoreVO score_vo) {
		
		//검색을 위한 id 확인
		ScoreVO base_score_vo = score_dao.findByIdEpiId(score_vo);
		
		//만약 별점을 처음 주었다면 그대로 반환
		if( base_score_vo == null ) {
			score_dao.updateScore(score_vo);
			return "{'result':'clear'}";
		}
		
		//만약 별점을 이미 주었다면 기존에 주었던 별점을 수정
		score_dao.fixScore(score_vo,base_score_vo);
		return "{'result':'already_id'}";
		
		
		
	}
	
	@RequestMapping("delScore.do")
	@ResponseBody
	public String delScore() {
		return "{'result':'clear'}";
	}
}
