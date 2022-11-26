package com.korea.webtoon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import util.Common;
import vo.MemberVO;

@Controller
public class MemberController {
	
	MemberDAO member_dao;
	
	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}

	@RequestMapping("login_form")
	public String login_form() {
		
		return Common.MEMB_PATH+"login_form.jsp";
	}
	
	@RequestMapping("/login_check.do")
	@ResponseBody
	public String login( MemberVO vo ) {
		
		String id = vo.getId();
		String pwd = vo.getPwd();
		
		//DAO에게 id를 요청
		vo = member_dao.loginCheck( id );
		
		if( vo == null ) {//DB에 아이디가 존재하지 않는다
			return "{'result':'no_id'}";
		}
		
		//아이디는 존재함
		if( !vo.getPwd().equals(pwd) ) {
			return "{'result':'no_pwd'}";
		}
		
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
	public String sign_check() {
		return "{'result':'clear'}";
	}
	
	
}
