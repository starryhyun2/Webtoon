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
	
	
	@RequestMapping(value= {"/", "/list.do"})					// 로그인 페이지에서 '로그인' 버튼을 누르면 마이페이지로 이동
	public String loginTest(Model model) {						// 로그인 페이지에서 입력한 값을 vo에 넣어 저장(지금은 로그인이 없기 때문에 넘겨받는 값이 없다.)
		
		String id = "WooSeokKing";								// 샘플데이터에 있는 id값을 임의로 저장
		
		Webtoon_UserVO user = user_dao.selectOne(id);			// 저장된 id값으로 db에 저장되어있는 user정보 한개 반환
			
		model.addAttribute("vo", user);							// 반환 받은값을 "vo"에 바인딩
		
		return "/WEB-INF/views/myPage.jsp";						// 마이페이지로 이동
	}
	
	@RequestMapping("/modify_form.do")							// '정보 수정' 버튼 클릭시 호출
	public String modify_form(Model model, String id) {			// String id를 넘겨받아온다.
		
		Webtoon_UserVO vo = user_dao.selectOne(id);				// id값으로 db에 저장되어있는 user정보 한개 반환
		
		model.addAttribute("vo", vo);							// 반환된 user 정보 바인딩
		
		return "/WEB-INF/views/modify_form.jsp";				// 정보수정 페이지로 이동
		
	}
	
	@RequestMapping("/modify.do")								// 정보수정 페이지에서 '수정하기' 버튼 클릭시 호출
	@ResponseBody
	public String modify(Webtoon_UserVO vo) {					// /modify.do?user_idx=1&name=WooSeokKing&pwd=WooSeokKing&email=WooSeokKing
		
		int res = user_dao.update(vo);							// 받아온 데이터들을 DB에 업데이트하고 업데이트가 되었다면 '1' 반환
		
		String result = "no";
		if(res == 1) {											// 데이터 수정이 잘되었다면
			result = "yes";										
		}
		
		return result;											
	}
	
}
