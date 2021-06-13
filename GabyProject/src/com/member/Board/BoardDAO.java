package com.member.Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.member.Board.BoardBean;

public class BoardDAO {

	// itwill_board 테이블에 대한 DB 처리 객체
	// 공통 변수를 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비 연결 메서드 - 커넥션 풀
	// 원래 public 으로 만들었으나 보안의 문제로 private 으로 수정
	private Connection getCon() throws Exception {

		// 프로젝트 정보를 초기화
		Context initCTX = new InitialContext();
		// 해당 파일을 불러온다(Context.xml -> DB 연결 정보)
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/gbDB");

		con = ds.getConnection();

		System.out.println("DAO : 디비 연결 성공! " + con);

		return con;
	}

	/////////////////////////////////////////////////////
	// 자원 해제 메서드

	public void closeMyDB() {
		System.out.println("DAO : 자원 해제!");

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/////////////////////////////////////////////////////
	// 글쓰기 메서드
	// writePro에서 호출하면 DAO로 오는것

	public void insertBoard(BoardBean bb) {

		int bno = 0;

		try {
			// 1.2. 디비 연결
			con = getCon();

			////////////////////////////////////////////////
			// 글번호 num 계산하기
			// 3. sql 쿼리 & pstmt 객체
			// 게시판 글번호(num) 계산
			sql = "select max(num) from gb_board";

			pstmt = con.prepareStatement(sql);

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// * max(num) 결과 없을 경우 => sql null 데이터
				// rs.getInt(1) => 결과가 sql null 일 경우 [0] 리턴
				// 아닐경우 해당 숫자 리턴
				bno = rs.getInt(1) + 1; // 1번째 컬럼의 값 : 인덱스 번호 사용
			}

			System.out.println("글번호 : " + bno);

			////////////////////////////////////////////////
			// 글번호 + 글정보 => 글쓰기
			// 3. sql 쿼리 & pstmt 객체
			sql = "insert into gb_board (num,name,pass,subject,content,"
					+ "readcount,re_ref,re_lev,re_seq,date,ip,file) " + "values(?,?,?,?,?,?,?,?,?,now(),?,?)";

			pstmt = con.prepareStatement(sql);

			// ?
			pstmt.setInt(1, bno); // 위에서 계산된 글번호 저장
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); // 조회수 항상 0으로 초기화하기 때문
			pstmt.setInt(7, bno); // re_ref 답변글 그룹 == 일반글 글번호 동일
			pstmt.setInt(8, 0); // re_lev 답변글 들여쓰기 -> 일반글 들여쓰기 없음
			pstmt.setInt(9, 0); // re_seq 답변글 순서 -> 일반글은 순서 맨위에 위치
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());

			// 4. sql 실행
			pstmt.executeUpdate();

			System.out.println("DAO : 글쓰기 성공! 글번호 : " + bno);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 발생 여부와 상관없이 반드시 한번 실행
			closeMyDB();
		}
	}

	// 글쓰기 메서드

	// boardList / getBoardCount()
	public int getBoardCount() {
		int cnt = 0;

		try {
			// 1.2 디비 연결
			con = getCon();

			// 3. sql 생성(select) & pstmt 객체
			sql = "select count(*) from gb_board";

			pstmt = con.prepareStatement(sql);

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// rs.getInt("count(*)");
				cnt = rs.getInt(1);
			}
			
			System.out.println("DAO : 글 개수 조회 -> "+cnt);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return cnt;
	}

	// boardList / getBoardCount()

	
	// boardList / getBoardList()
	public ArrayList getBoardList() {

		ArrayList boardList = new ArrayList();

		try {
			// 1.2 디비연결
			con = getCon();

			// 3. sql 작성 & pstmt 객체
			// sql = "select * from itwill_board";			
			 
			// 게시글을 마지막 쓴 글이 제일 위로 올라오도록 정렬하는 DB 구문
			// re_ref(num) 기준으로 정렬 내림차순, re_seq 오름차순 정렬
			// limit 시작행-1, 개수
			sql = "select * from gb_board";
//					+ " order by re_ref desc, re_seq asc"
//					+ " limit 0,5";
			
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			while(rs.next()){  // 데이터가 있을 때마다 처리
				// 게시판 글 저장 -> BoardBean 저장 -> ArrayList 저장
				BoardBean bb = new BoardBean();
				
				// 회원 정보를 가변길이 배열에 저장
				// 회원정보 -> BoardBean -> ArrayList 한 칸
				// DB 데이터 -> BoardBean 객체
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				
				// ArraryList boardList = new ArrayList();
				// 한명의 정보를 배열 한칸에 저장
				boardList.add(bb);
			} // while
			
			System.out.println("DAO : 게시판 글 저장 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return boardList;
	}
	
	// boardList / getBoardList()
	
	
	// getBoardList(startRow, pageSize)
	public ArrayList getBoardList(int startRow, int pageSize) {
		ArrayList boardList = new ArrayList();

		try {
			// 1.2 디비연결
			con = getCon();

			// 3. sql 작성 & pstmt 객체
			// re_ref(num) 기준으로 정렬 내림차순, re_seq 오름차순 정렬
			// limit 시작행-1, 개수
			sql = "select * from gb_board" + " order by re_ref desc, re_seq asc" + " limit ?,?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			while (rs.next()) { // 데이터가 있을 때마다 처리
				// 게시판 글 저장 -> BoardBean 저장 -> ArrayList 저장
				BoardBean bb = new BoardBean();

				// 회원 정보를 가변길이 배열에 저장
				// 회원정보 -> BoardBean -> ArrayList 한 칸
				// DB 데이터 -> BoardBean 객체
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));

				// ArraryList boardList = new ArrayList();
				// 한명의 정보를 배열 한칸에 저장
				boardList.add(bb);

			} // while

			System.out.println("DAO : 게시판 글 저장 완료!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return boardList;
	}
	// getBoardList(startRow, pageSize)
	
	
	// 조회수 업데이트 updateReadCount(num)
	public void updateReadCount(int num) {

		try {
			// 1.2 디비 연결
			con = getCon();

			// 3. sql 쿼리 & pstmt 객체
			// 기존의 조회수를 1 증가
			sql = "update gb_board set readcount=readcount+1 where num=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);

			// 4. sql 실행
			pstmt.executeUpdate();

			System.out.println("DAO : 조회수 1 증가!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
	}

	// 조회수 업데이트 updateReadCount(num)

	// 글 정보 조회 getBoard(num);
	public BoardBean getBoard(int num) {
		BoardBean bb = null;

		try {
			// 1.2 디비 연결
			con = getCon();

			// 3. sql 구문 & pstmt 객체
			sql = "select * from gb_board where num=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// DB -> BoardBean 객체
				bb = new BoardBean();

				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));

			} // if
			System.out.println("DAO : 해당 글 저장 완료!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return bb;
	}

	// 글 정보 조회 getBoard(num);
	
	
	// 글 정보 수정 updateBoard(bb);
	public int updateBoard(BoardBean bb){
		int result = -1;
		// -1  아이디 없음, 0 비밀번호 오류, 1 정상처리 
		
		try {
		// 1.2 디비 연결
			con = getCon();
		
		// 3. sql 작성 (select - 글이 있는지 판단) & pstmt 객체
			sql = "select pass from gb_board where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			
		// 4. sql 실행
			rs = pstmt.executeQuery();
			
		// 5. 데이터 처리
			if(rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
					// 3. sql 작성 (update - 해당 글 수정) & pstmt 객체
					sql = "update gb_board set name=?,subject=?, "
							+ "content=? where num=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getNum());
					// 4. sql 실행
					result = pstmt.executeUpdate();
					// result = 1;
					System.out.println("DAO : 글 수정 - 정상 수정");
				
				} else {
					// 비밀번호 오류
					System.out.println("DAO : 글 수정 - 비밀번호 오류");
					result = 0;
				}
			} else {
				// 글 없음
				result = -1;
				System.out.println("DAO : 글 수정 - 글 오류");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		return result;
	}
	
	// 글 정보 수정 updateBoard(bb);
	
	
	// 글 삭제 deleteBoard(bb);
	public int deleteBoard(BoardBean bb){
		int result = -1;
		
		try {
		// 1.2 디비 연결
			con = getCon();
		
		// 3. sql 작성(select) & pstmt 객체 생성
			sql = "select pass from gb_board where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
		
		// 4. sql 실행
			rs = pstmt.executeQuery();
				
		// 5. 데이터 처리
			if (rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
					// 3. sql 작성(delete) & pstmt 객체 생성
					sql = "delete from gb_board where num=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bb.getNum());
					
					// 4. sql 실행 (삭제된 글의 수를 리턴)
					result = pstmt.executeUpdate();
					
				} else {
					// 글 비밀번호 오류
					result = 0;
				}
			} else {
				// 글이 없음
				result = -1;
			}
			
			System.out.println("DAO : 글 삭제 처리 -> "+result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		return result;
	}
	
	// 글 삭제 deleteBoard(bb);
	
	
	// reInsertBoard(bb) 답글 달기
	public void reInsertBoard(BoardBean bb){
		
		int num = 0;
		
		try {
			
			// 1.2 디비 연결
			con = getCon();
			
			// 3. sql 구문 & pstmt 객체
			// -> 답글번호 계산 (num)
			sql = "select max(num) from gb_board";
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if (rs.next()){
				num = rs.getInt(1) + 1;
			}
			
			System.out.println("DAO : 답글번호 확인 ->"+num);
			
///////////////////////////////////////////////////////////////////////
			// -> 답글 순서 재배치
			// re_ref 값이 같은 그룹, re_seq 기존의 값보다 큰 값이 있을 때 1 증가
			sql = "update gb_board set re_seq=re_seq+1 "
					+ "where re_ref=? and re_seq>?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			pstmt.executeUpdate();
			System.out.println("DAO : 답글 순서 재배치!");
			
///////////////////////////////////////////////////////////////////////
			// -> 답글 작성
			// 3. sql 구문 & pstmt 객체
			sql = "insert into gb_board(num,name,pass,subject,content,"
					+ "readcount,re_ref,re_lev,re_seq,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);  // 조회수 0
			pstmt.setInt(7, bb.getRe_ref()); // 답글 ref : 일반글(원글)의 ref값 사용
			pstmt.setInt(8, bb.getRe_lev()+1);
			pstmt.setInt(9, bb.getRe_seq()+1);
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 답글 작성 완료!");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// reInsertBoard(bb) 답글 달기
	
	
	// getBoardCount(search)  //  오버로딩
	public int getBoardCount(String search) {
		int cnt = 0;

		try {
			// 1.2 디비 연결
			con = getCon();

			// 3. sql 생성(select) & pstmt 객체
			// where 대상(컬럼) like 값
			// 값 - 데이터가 값이랑 정확하게 일치
			// %값 - ~값 으로 끝나는 데이터
			// 값 %- 값~ 으로 시작하는 데이터
			// %값% - 값을 포함하는 데이터
			
			// 전체 (all)
			if(search.equals("all")){
			sql = "select count(*) from gb_board";
			} else {
			sql = "select count(*) from gb_board "
					+ "where subject like ?";
			}
			
			pstmt = con.prepareStatement(sql);
			
			if(search.equals("all")){}	
			else {
			pstmt.setString(1, "%"+search+"%");
			}
			
			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				// rs.getInt("count(*)");
				cnt = rs.getInt(1);
			}

			System.out.println("DAO : 글 개수 조회 -> " + cnt);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return cnt;
	}
	// getBoardCount(search)
	
	
	// getBoardList(startRow, pageSize, search) // 오버로딩
	public ArrayList getBoardList(int startRow, int pageSize, String search) {
		ArrayList boardList = new ArrayList();

		try {
			// 1.2 디비연결
			con = getCon();

			// 3. sql 작성 & pstmt 객체
			// re_ref(num) 기준으로 정렬 내림차순, re_seq 오름차순 정렬
			// limit 시작행-1, 개수
			if(search.equals("all")){
			sql = "select * from gb_board"
					+ " order by re_ref desc, re_seq asc" 
					+ " limit ?,?";				
			} else {
			sql = "select * from gb_board"
					+ " where subject like ?"
					+ " order by re_ref desc, re_seq asc" 
					+ " limit ?,?";
			}
			
			pstmt = con.prepareStatement(sql);

			if (search.equals("all")){
				pstmt.setInt(1, startRow - 1);
				pstmt.setInt(2, pageSize);				
			} else{				
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, startRow - 1);
				pstmt.setInt(3, pageSize);
			}

			// 4. sql 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			while (rs.next()) { // 데이터가 있을 때마다 처리
				// 게시판 글 저장 -> BoardBean 저장 -> ArrayList 저장
				BoardBean bb = new BoardBean();

				// 회원 정보를 가변길이 배열에 저장
				// 회원정보 -> BoardBean -> ArrayList 한 칸
				// DB 데이터 -> BoardBean 객체
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));

				// ArraryList boardList = new ArrayList();
				// 한명의 정보를 배열 한칸에 저장
				boardList.add(bb);

			} // while

			System.out.println("DAO : 게시판 글 저장 완료!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return boardList;
	}
	// getBoardList(startRow, pageSize)

}
