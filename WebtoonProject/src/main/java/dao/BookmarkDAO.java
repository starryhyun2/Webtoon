package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BookmarkVO;

public class BookmarkDAO {

	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//버튼 클릭시 북마크 DB에 동일한 값이 존재하는지 체크하는 메소드
	public BookmarkVO select(BookmarkVO vo) {
		BookmarkVO res = sqlSession.selectOne("m.check_bookmark", vo);
		return res;
	}
	
	//동일한 값이 없다면 DB에 추가하는 메소드
	public int insert(BookmarkVO vo) {
		int res = sqlSession.insert("m.add_bookmark", vo);
		return res;
	}
	
	//동일한 값이 있다면 DB에 삭제하는 메소드
	public void del(BookmarkVO vo) {
		sqlSession.delete("m.del_bookmark", vo);
		return;
	}
	
	//내 북마크 리스트
	public List<BookmarkVO> selectList(String id) {
		List<BookmarkVO> res = sqlSession.selectList("m.list_bookmark", id);
		return res;
	}
	
	
}
