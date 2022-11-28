package com.korea.webtoon;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class UserController {

	UserDAO user_dao;
	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
	@RequestMapping("/ulist.do")
	public String alluser( Model model ) {
		
		//DAO로 부터 검색 결과를 반환받는다.
		List<UserVO> list = user_dao.selectAllUser();
		model.addAttribute("list", list);//바인딩
		return "/WEB-INF/views/userList.jsp";//포워딩
	}
		//ApplicationContext 사용위해 객체선언 
		private ApplicationContext context;
		
		@RequestMapping("/join.do")  //  /member/join.do GET방식 요청오면 memberJoin()이 요청처리
		public String memberJoin() {
			return "/board/join"; // /board/join.jsp로 포워딩
		}
		
		@RequestMapping(value = "/join.do", method = RequestMethod.POST)
		public ModelAndView addMember(@ModelAttribute("MemberModel") MemberModel memberModel, BindingResult bindingResult) {
			//일단 ModelAndView 객체 먼저 생성해주고
			ModelAndView mav = new ModelAndView();
			
			//자바빈객체랑 BindingResult 객체 넣어서 유효성검사 실행
			new MemberValidator().validate(memberModel, bindingResult);
			if(bindingResult.hasErrors()) { //유효성검사결과 오류 있을경우 다시 join.jsp로 포워딩
				mav.setViewName("/board/join");
				return mav;
			}
			
			//유효성검사결과 오류 없을경우
			//ApplicationContext 객체 생성해서 applicationContext.xml 수동으로 가져다쓰기 
			context = new ClassPathXmlApplicationContext("/config/applicationContext.xml");
			MemberService memberService = (MemberService) context.getBean("memberService");  //memberService의 이름으로 등록된 자바빈 가져와서, MemberService객체 생성 
			MemberModel checkMemberModel = memberService.findByUserId(memberModel.getUserId()); //findByUserId에 아이디넣어서 MemberModel객체 가져오기
			
			//만약 꺼내온 자바빈 객체가 있다면, (이미 가입돼있는 ID라는 뜻)
			if(checkMemberModel != null) {
				mav.addObject("errCode", 1); //errCode를 1로올리기 (errCode:1 = 이미 등록된 ID)
				mav.setViewName("/board/join"); //다시 join.jsp로 포워딩
				return mav;
			}
			//꺼내온 자바빈 객체가 없을경우 (가져온 자바빈객체가 없다는건, 가입돼있는 ID 아니라는 의미)
			if(memberService.addMember(memberModel)) { //addMember()호출해서 자바빈객체 넣어주기. 즉 회원가입 데이터 넣어주고
				mav.addObject("errCode", 3); //errCode를 3으로 올리기 (errCode:3 = 회원가입 성공)
				mav.setViewName("/board/login"); //회원가입 완료 후, login.jsp로 포워딩(로그인 할 수 있게)
				return mav;
			}else { //꺼내온 자바빈객체는 있는데,, addMember() 실패했을경우 
				mav.addObject("errCode", 2); //errCode 2로 올려주고 (errCode:2 = 회원가입 실패)
				mav.setViewName("/board/join"); //다시 join.jsp로 포워딩
				return mav;
			}
		}
	}


}
