package com.korea.webtoon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BookmarkDAO;
import dao.WebtoonDAO;
import util.Common;
import vo.BookmarkVO;
import vo.WebtoonVO;

@Controller
public class BookmarkController {

	@Autowired
	HttpServletRequest request;
	
	HttpSession session;
	
	WebtoonDAO webtoon_dao;
	public void setWebtoon_dao(WebtoonDAO webtoon_dao) {
		this.webtoon_dao = webtoon_dao;
	}
	BookmarkDAO bookmark_dao;
	public void setBookmark_dao(BookmarkDAO bookmark_dao) {
		this.bookmark_dao = bookmark_dao;
	}
	
	//bookmark 호출 테스트용(메인화면 or 웹툰 상세보기 페이지에 추가되어야 할 코드들)
	@RequestMapping("/bookmarkTest.do")
	public String test(Model model) {						//저는 메인화면을 기준으로 작성했습니다.
			
		List<WebtoonVO> list = webtoon_dao.selectList();	//모든 웹툰 리스트
			
		model.addAttribute("bm", list);	
					
		session = request.getSession();
		String id = (String)session.getAttribute("id");		
			
		model.addAttribute("user", id);
			
		return Common.Mypg_PATH+"bookMark_Test.jsp";			//테스트 화면(홈화면)
			
	}
		
	@RequestMapping("/addBookmark.do")						// 북마크 버튼 클릭시 호출
	@ResponseBody
	public String addBookmark(BookmarkVO vo) {				// webtoon_idx와 user_id를 VO에 넣어서 받음							
			
		BookmarkVO res = bookmark_dao.select(vo);			// vo값을 DB에 넘겨 동일한 값을 가진 데이터가 있는지 확인
															// 있다면 1 반환
		String bookmark = "yes";						
		
		if(res != null) {									// 같은 값이 있다면 
			bookmark_dao.del(vo);							// 데이터 삭제(북마크 삭제)
			bookmark="no";										
			return bookmark;
		}
			
		bookmark_dao.insert(vo);							// 북마크 추가
			
		return bookmark;									//"yes","no"값 반환
				
	}
		
	@RequestMapping("/bookmark.do")							// 북마크 페이지
	public String bookmark(Model model) {				
						
		String id = (String)session.getAttribute("id");

		List<BookmarkVO> webtoon_name = bookmark_dao.selectList(id);//id값을 DB로 넘겨 user_id=#{id}인 모든 데이터를 list에 저장
		List<WebtoonVO> list = new ArrayList<WebtoonVO>();			//깡통 list 생성
	
		for(int i=0; i<webtoon_name.size(); i++) {			//for문을 이용해 북마크 등록한 웹툰 보기
				
			int ref = webtoon_name.get(i).getRef();			//위에서 받아온 데이터들의 ref(webtoon_idx)
				
			WebtoonVO vo = webtoon_dao.select(ref);			//ref를 보내 맞는 웹툰 데이터 하나씩 가져오기

			list.add(vo);									//깡통 list에 하나씩 저장
		}						
			
		model.addAttribute("bm", list);						//바인딩
		model.addAttribute("user", id);						//바인딩
			
		return Common.Mypg_PATH+"bookMark.jsp";
	}
	
}
