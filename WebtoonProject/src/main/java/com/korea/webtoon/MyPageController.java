package com.korea.webtoon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import myPageDAO.MyPageDAO;

@Controller
public class MyPageController {

	MyPageDAO mypage_dao;
	public void setMypage_dao(MyPageDAO mypage_dao) {
		this.mypage_dao = mypage_dao;
	}
	
	@RequestMapping("/loginTest.do")
	public String loginT() {
		return "/WEB-INF/views/loginT.jsp";
	}
	
	@RequestMapping("/myPage.do")
	public String home() {
		return "/WEB-INF/views/home.jsp";
	}
}
