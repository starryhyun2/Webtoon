package com.korea.webtoon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.Webtoon_UserDAO;
import vo.Webtoon_UserVO;

@Controller
public class MyPageController {

	
	@Autowired
	HttpServletRequest request;
	
	HttpSession session;
	
	
	Webtoon_UserDAO user_dao;					//Webtoon_UserDAO의 setter 인젝션 생성
	public void setUser_dao(Webtoon_UserDAO user_dao) {
		this.user_dao = user_dao;
	}
	
	/*
	 * @RequestMapping("/") // 기본화면 public String home() { // 회원가입 페이지를 홈으로 설정
	 * return "/WEB-INF/views/memberForm.jsp"; }
	 * 
	 * @RequestMapping("member.do") // 회원가입 페이지에서 정보들을 입력후 '회원가입' 버튼을 누르면 실행되는 메서드
	 * public String member(Webtoon_UserVO vo) { // 회원가입 페이지에서 받아온 정보들을
	 * Webtoon_UserVO에 저장
	 * 
	 * int res = user_dao.insert(vo); // user_dao의 modify메소드에게 저장된 vo객체를 넘겨 DB에 정보
	 * 저장
	 * 
	 * return "redirect:login.do"; // 회원가입 후 바로 로그인 페이지로 넘어가기 }
	 * 
	 * @RequestMapping("/login.do") // /login.do가 실행되면 loginform.jsp 화면 출력 public
	 * String login() { return "/WEB-INF/views/loginForm.jsp"; }
	 */
	
	
	@RequestMapping(value= {"/", "/list.do"})								// 로그인 페이지에서 '로그인' 버튼을 누르면 마이페이지로 이동
	public String loginTest(Model model) {						// 로그인 페이지에서 입력한 값을 vo에 넣어 저장(나중에 이건 로그인하면 세션으로 가지고 있는걸 넘겨받는거로)
		
		String id = "kws";
		
		Webtoon_UserVO user = user_dao.selectOne(id);
			
		model.addAttribute("vo", user);							// 반환 받은값을 "vo"에 바인딩
		
		return "/WEB-INF/views/myPage.jsp";						//마이페이지로 이동
	}
	
	@RequestMapping("/modify_form.do")
	public String modify_form(Model model, String id) {
		
		Webtoon_UserVO vo = user_dao.selectOne(id);
		
		model.addAttribute("vo", vo);
		
		return "/WEB-INF/views/modify_form.jsp";
		
	}
	
	@RequestMapping("/modify.do")
	@ResponseBody
	public String modify(Webtoon_UserVO vo) {
	
		int res = user_dao.update(vo);
		
		String result = "no";
		if(res == 1) {
			result = "yes";
		}
		
		return result;
	}
	
	@RequestMapping("/blog.do")
	@ResponseBody
	public String blog(Model model, Webtoon_UserVO vo) {
		
		Webtoon_UserVO id = user_dao.selectOne(vo.getId());
		List<Webtoon_UserVO> list = user_dao.selectList(vo.getUser_idx());
		
		model.addAttribute("vo", id);
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/blog.jsp";
	}
	
}
