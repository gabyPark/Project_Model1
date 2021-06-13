package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class fileDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private Connection getCon() {

		// 커넥션풀 사용
		try {
			// Context 객체 생성
			Context initCTX = new InitialContext();
			// Context 사용해서 디비정보를 가져오기
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/gbDB");
			// jdbc ~ 라는 이름의 파일을 사용

			// 연결정보를 사용해서 연결
			con = ds.getConnection();

			System.out.println("DAO : 디비 연결 성공!");
			System.out.println("DAO : " + con);

		} catch (Exception e) {
			System.out.println("디비 연결 오류 발생!");
			e.printStackTrace();
		}

		return con;
	}
	//////////////////////////////////////////////////

	// 디비 자원해제 메소드
	public void closeDB() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//////////////////////////////////////////////////


	
	public int upload(String filename, String oFileName) {

		try {
			con = getCon();
			sql = "INSERT INTO filetest VALUES (?, ?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, filename);
			pstmt.setString(2, oFileName);

			return pstmt.executeUpdate();

		} catch(Exception e) {

			e.printStackTrace();

		}
		return -1;

	}

}


