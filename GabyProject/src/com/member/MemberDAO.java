package com.member;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// itwill_member DB 관련된 모든 처리를 하는 객체
//  DAO (Data Access object)
public class MemberDAO {

	// 필요한 레퍼런스 준비
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	/////////////////////////////////////////////
	// private 접근 지정자 : 외부에서 사용X, 자신의 클래스 안에서만 사용가능

	// 디비 연결 처리 메소드
	// 원래 public 으로 만들었으나 보안의 문제로 private 으로 수정
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

	// InsertMember(mb)
	public void memberInsert(MemberBean mb) {
		// 회원가입 처리

		// 1. 드라이버 로드

		// 2. 디비 연결
		con = getCon();
		// 위의 1,2 단계를 한번에 처리한 것

		try {
			// 3. sql 쿼리 & pstmt

			sql = "insert into gb_member values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getPw2());
			pstmt.setString(4, mb.getName());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getAddress1());
			pstmt.setString(7, mb.getAddress2());
			pstmt.setString(8, mb.getAddress3());
			pstmt.setString(9, mb.getAddress4());
			pstmt.setString(10, mb.getAddress5());
			pstmt.setString(11, mb.getTel());
			pstmt.setString(12, mb.getMobile());
			pstmt.setString(13, String.valueOf(mb.getTrait()));

			// 4. sql 실행
			pstmt.executeUpdate();

			System.out.println("DAO : sql 실행 완료!");

		} catch (SQLException e) {
			System.out.println("DAO : sql 구문 실행 에러!");
			e.printStackTrace();
		} finally {
			closeDB();
		} 
	}
	// InsertMember(mb)
	
	
	// idCheck(id,pw)
	public int idCheck(String id, String pw) {
		int result = -1;

		try {
			// 1.2 디비 연결
			con = getCon();
			// 3. sql 쿼리(select) & pstmt 객체 생성
			sql = "select pw from gb_member where id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// 아이디 있음
				if (pw.equals(rs.getString("pw"))) {
					// 아이디 O, 비밀번호 O
					result = 1;
				} else {
					// 아이디 O, 비밀번호 X
					result = 0;
				}
			} else {
				// 아이디가 없을 때
				result = -1;
			}

			System.out.println("DAO : sql 구문 실행 성공!");
			System.out.println("DAO : 로그인 체크 완료 => " + result);

		} catch (Exception e) {
			System.out.println("DAO : 로그인 체크 에러!");
			e.printStackTrace();
		} finally {
			closeDB();

		}
		return result;
	}
	// idCheck(id,pw)
	
	
	// usedID()
	public boolean usedID(String id){
		boolean result = false;

		try {
			// 1.2 디비 연결
			con = getCon();

			// 3. sql 쿼리(select) & pstmt 객체 생성
			sql = "select * from gb_member where id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
				if (rs.next()) {
					System.out.println("사용 가능한 아이디");
					result = true;
				} else {
					System.out.println("사용 불가능한 아이디");
					result = false;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;
			}
	
	// usedID()

	// getMember(id)
	public MemberBean getMember(String id) {
		// 회원 정보를 저장하는 변수
		MemberBean mb = null;

		// 1.2 디비 연결
		con = getCon();

		try {
			// 3. sql 구문 & pstmt 객체
			sql = "select * from gb_member where id=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			// DB 정보 -> MemberBean 객체 저장
			if (rs.next()) {
				mb = new MemberBean();

				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setPw2(rs.getString("pw2"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				mb.setAddress1(rs.getString("address1"));
				mb.setAddress2(rs.getString("address2"));
				mb.setAddress3(rs.getString("address3"));
				mb.setAddress4(rs.getString("address4"));
				mb.setAddress5(rs.getString("address5"));
				mb.setTel(rs.getString("tel"));
				mb.setMobile(rs.getString("mobile"));
				mb.setTrait(rs.getString("trait"));
			}

			System.out.println("DAO : 회원 정보 조회 완료!");
			System.out.println("DAO : " + mb);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return mb;
	}

	// getMember(id)
	

	// updateMember(수정할 정보 객체)
	public int updateMember(MemberBean umb){
		int result = -1;
		
		try {
		// 1.2  디비 연결
		con = getCon();
		
		// 3. sql 쿼리 (select로 본인확인) & pstmt 객체
		sql = "select pw from gb_member where id=?";
		
		// 여기서 예외 발생하기 때문에 try-catch 예외처리 해주기
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, umb.getId());
			
		// 4. sql 쿼리 실행
		rs = pstmt.executeQuery();
		
		// 5. 데이터 처리
		if(rs.next()){
			// 데이터가 있을 때 (회원)
			if(umb.getPw().equals(rs.getString("pw"))){
			
			// (3) sql 쿼리 (update) & pstmt 객체
			sql = "update gb_member set name=?,email=?,address1=?,address2=?,address3=?,address4=?,address5=?,tel=?,mobile=?,trait=? where id=?";			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, umb.getName());
			pstmt.setString(2, umb.getEmail());
			pstmt.setString(3, umb.getAddress1());
			pstmt.setString(4, umb.getAddress2());
			pstmt.setString(5, umb.getAddress3());
			pstmt.setString(6, umb.getAddress4());
			pstmt.setString(7, umb.getAddress5());
			pstmt.setString(8, umb.getTel());
			pstmt.setString(9, umb.getMobile());
			pstmt.setString(10, umb.getTrait());
			pstmt.setString(11, umb.getId());
			
			
			
			// (4) sql 쿼리 실행
			pstmt.executeUpdate();
			result = 1;
			
			} else { // 비밀번호 오류
				result = 0;
			}
		} else { // 데이터가 없을 때 (비회원)
			result = -1;
		}
		
		System.out.println("DAO : 회원정보 수정 완료 => "+result);
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// updateMember(수정할 정보 객체)


	
	// deleteMember(id, pw)
	public int deleteMember(String id, String pw){
		int result = -1;
		
		try {
			// 1.2  디비 연결
			con = getCon();
			
			// 3. sql 쿼리 (select로 본인확인) & pstmt 객체
			sql = "select pw from gb_member where id=?";
				
			// 여기서 예외 발생하기 때문에 try-catch 예외처리 해주기
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
				
			// 4. sql 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if (rs.next()){
				if(pw.equals(rs.getString("pw"))){
					// (3) sql 쿼리(delete) & pstmt 객체
					sql = "delete from gb_member where id=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					// (4) sql 실행
					pstmt.executeUpdate();
					result = 1;
				} else {
					// 비밀번호 오류
					result = 0;
				}
			} else {
				// 비회원
				result = -1;
			}
			
			System.out.println("DAO : 회원 삭제 처리 완료! => "+result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// deleteMember(id, pw)
	
	
	/*
	
	
	// ArrayList => 가변길이 배열, 데이터를 순차적으로 저장
	// => 크기를 지정하지 않아도 알아서 필요할 때 공간을 자동으로 생성
	// getMemberList();
	public ArrayList getMemberList(){
		ArrayList memberList = new ArrayList();
		
		try {
		// 1.2 디비 연결
		con = getCon();
		
		// 3. sql & pstmt
		sql = "select * from itwill_member";
		
		pstmt = con.prepareStatement(sql);
			
		// 4. sql 실행
		rs = pstmt.executeQuery();
		
		// 5. 데이터 처리
		while(rs.next()){
			// 회원 정보를 가변길이 배열에 저장
			// 회원정보 -> MemberBean -> ArrayList 한 칸
			MemberBean mb = new MemberBean();
			
			mb.setId(rs.getString("id"));
			mb.setEmail(rs.getString("email"));
			mb.setName(rs.getString("name"));
			mb.setPw(rs.getString("pw"));

			// ArraryList memberList = new ArrayList();
			// 한명의 정보를 배열 한칸에 저장
			memberList.add(mb);
			// 여기서 업캐스팅 발생
			// Object o = 
		}
		System.out.println("DAO : 회원목록 저장 완료!");
		System.out.println("DAO : memberList");
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		} 
		
		return memberList;
	}
	
	// getMemberList();
*/	
	
	
}