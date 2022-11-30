package com.korea.webtoon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import util.Common;
import vo.MemberVO;

@Controller
public class MyPageController {

	
	@Autowired
	HttpServletRequest request;
	
	HttpSession session;
	
	MemberDAO member_dao;					
	//Webtoon_UserDAO의 setter 인젝션 생성
	

	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	@RequestMapping("Mypage")					// 로그인 페이지에서 '로그인' 버튼을 누르면 마이페이지로 이동
	public String loginTest(Model model) {						// 로그인 페이지에서 입력한 값을 vo에 넣어 저장(지금은 로그인이 없기 때문에 넘겨받는 값이 없다.)
		
		String id ="false";
		HttpSession login = request.getSession(false);
		//id_now가 null값이 아니라면, 모델에 바인딩 해서 전송
		if(login != null) {
			String binding_tmp = (String)login.getAttribute("id");
			id=binding_tmp;
		}
		
		MemberVO user = member_dao.selectOne(id);			// 저장된 id값으로 db에 저장되어있는 user정보 한개 반환
			
		model.addAttribute("vo", user);							// 반환 받은값을 "vo"에 바인딩
		
		return Common.Mypg_PATH+"myPage.jsp";						// 마이페이지로 이동
	}
	

	@RequestMapping("modify_form.do")							// '정보 수정' 버튼 클릭시 호출
	public String modify_form(Model model, String id) {			// String id를 넘겨받아온다.
		
		MemberVO vo = member_dao.selectOne(id);				// id값으로 db에 저장되어있는 user정보 한개 반환
		
		model.addAttribute("vo", vo);							// 반환된 user 정보 바인딩
		
		return Common.Mypg_PATH+"modify_form.jsp";				// 정보수정 페이지로 이동
		
	}
	
	@RequestMapping("modify.do")								// 정보수정 페이지에서 '수정하기' 버튼 클릭시 호출
	@ResponseBody
	public String modify(MemberVO vo) {					// /modify.do?user_idx=1&name=WooSeokKing&pwd=WooSeokKing&email=WooSeokKing
		
		int res = member_dao.update(vo);							// 받아온 데이터들을 DB에 업데이트하고 업데이트가 되었다면 '1' 반환

		String result = "no";
		if(res == 1) {											// 데이터 수정이 잘되었다면
			result = "yes";										
		}
		
		return result;											
	}
	
}
