package com.korea.webtoon;


import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import util.Common;
import vo.MemberVO;

@Controller
public class MemberController {
	
	MemberDAO member_dao;
	
	//세션 정보를 다루기 위한 request 생성

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession login;
	
	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}

	//로그아웃 버튼 클릭시
	@RequestMapping("logout.do")
	public String logout() {
		
		HttpSession login = request.getSession();
		login.removeAttribute("id");
		
		
		return "redirect:mainToon.do";
	}
	
	@RequestMapping("login_form")
	public String login_form() {
		
	    String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("prevPage", referrer);
		return Common.MEMB_PATH+"login_form.jsp";
	}
	
	@RequestMapping("/login_check.do")
	@ResponseBody
	public String login( MemberVO vo ) {
		
		String id = vo.getId();
		String pwd = vo.getPwd();
		
		System.out.println(id);
		System.out.println(pwd);
		//DAO에게 id를 요청
		vo = member_dao.loginCheck( id );
		
		if( vo == null ) {//DB에 아이디가 존재하지 않는다
			return "{'result':'no_id'}";
		}
		
		//아이디는 존재함
		if( !vo.getPwd().equals(pwd) ) {
			return "{'result':'no_pwd'}";
		}

		//로그인 정보를 세션에 저장
		login = request.getSession(false);
		login.setAttribute("id", id); //id 바인딩

		//이전 페이지 바인딩 해놓은 세션 제거
		request.getSession().removeAttribute("prevPage");

		//로그인 가능
		return "{'result':'clear'}";
	}

	//회원가입 방법 선택 창
	@RequestMapping("sign_up_form")
	public String sign_up_form() {

		return Common.MEMB_PATH+"sign_up_form.jsp";
	}

	//이메일로 회원가입
	@RequestMapping("sign_up_phone")
	public String sign_up_phone() {

		return Common.MEMB_PATH+"sign_up_phone.jsp";
	}

	//폰 번호로 회원가입
	@RequestMapping("sign_up_email")
	public String sign_up_email() {

		return Common.MEMB_PATH+"sign_up_email.jsp";
	}
	//회원가입 정보 확인
	@RequestMapping("sign_check.do")
	@ResponseBody
	public String sign_check(MemberVO vo) {
		String phonenum = vo.getPhonenum();
		String email = vo.getEmail();

		//인증을 위한 난수 생성
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 6; i++) { 
			int index = rnd.nextInt(3);
			switch (index) {
			case 0:
				key.append((char) (rnd.nextInt(26) + 97));
				break;
			case 1:
				key.append((char) (rnd.nextInt(26) + 65));
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				break;
			}
		}

		String sKey = key.toString();

		if(phonenum != null) {
			vo.setEmail("");
			member_dao.sendMessage(phonenum, sKey);
		}else {
			vo.setPhonenum("");
			member_dao.sendEmail(email, sKey);
		}
		//회원가입 정보 세션 저장
		login = request.getSession();
		login.setAttribute("member", vo); //vo 바인딩
		
		//인증을 위한 KEY 세션에 저장
		login.setAttribute("sKey", sKey);
		return "{'result':'clear'}";
	}

	//회원가입 인증
	@RequestMapping("certifiacion_form")
	public String certifiacion_form() {

		return Common.MEMB_PATH+"certifiacion_form.jsp";
	}


	//인증 화면에서 클라이언트 입력메시지와 서버가 송신한 메시지가 일치한지 확인
	@RequestMapping("sKey_check.do")
	@ResponseBody
	public String sKey_check(String Key) {
		String sKey = (String) login.getAttribute("sKey");
		if(sKey.equals(Key)) {
			MemberVO vo = (MemberVO) login.getAttribute("member");
			member_dao.insert(vo);
			
			login.removeAttribute("member");
			login.removeAttribute("sKey");
			return "{'result':'clear'}";
		}
		return "{'result':'false'}";

	}

	
}
