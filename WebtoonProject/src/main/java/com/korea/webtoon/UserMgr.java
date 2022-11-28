package com.korea.webtoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserMgr {
private DBConnectionMgr pool;
	
	public UserMgr() {
		pool= DBConnectionMgr.getInstance();
	}
	
	//ID중복확인 - true 중복 (존재)
	public boolean checkId(String id) {
		Connection con = null; //java.sql import
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false; //초기화
		try {
			con = pool.getConnection();
			sql = "select ID from WEBTOON_USER where ID=?"; //아이티 포커스
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag; //id중복확인
	}
	

	
	
	//회원가입 : 배열로 들어오는 값 처리
	
	public boolean insertUser(UserBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert WEBTOON_USER(USER_IDX,id,pwd,name,email)"
					+ "values(?,?,?,?,)" ;
			pstmt = con.prepareStatement(sql);
			///////////////////////////////////////////////////////////////////////
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(6, bean.getEmail());
				
	} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	
	//로그인
	public boolean loginUser(String ID, String PWD) {  //한 개 이상 (프라이머리키가 있어서 t/f값으로 체크 가능하다.)
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = " select ID from WEBTOON_USER where ID=? and PWD=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ID); //세팅. 순서중요
			pstmt.setString(2, PWD);
			rs = pstmt.executeQuery(); //실행
			flag = rs.next(); //true면 로그인 성공. 없으면(false) 로그인 실패
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag; 
	}
}
	

	
