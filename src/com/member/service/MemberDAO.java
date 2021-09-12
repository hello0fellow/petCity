package com.member.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public MemberDAO() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "koreait", "0000");
			System.out.println("연결 성공 : " + conn);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}	// => MemberDAO 클래스 만들고 나서 UserRegister 서블릿에 가서 확인해본다.
	
	
//	서블릿에서 DAO가 잘 연결된걸 확인하고 나면 (console에 연결 성공 : conn 확인!)
//	회원정보를 테이블에 저장하는 메소드를 설정해준다.
	
	public int signUp(MemberVO vo) {
		System.out.println("MemberDAO 클래스의 signUp() 메소드 실행");
		
//		분명 예외가 뜰테니... 예외처리를 해준다!
		try {
//			sql 명령문을 만들어 넣어주자
			String sql = "insert into member (id, pw, name, email, nickname) "
					+ "values (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getNickname());
			
//			정상적으로 실행되면 1이 리턴된다.
			return pstmt.executeUpdate();	
					
		} catch (Exception e) {
			e.printStackTrace();
		}
//		오류가 발생되면 -1을 리턴시킨다. 
		return -1;
	}
	
}
