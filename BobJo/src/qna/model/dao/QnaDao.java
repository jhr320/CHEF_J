package qna.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import qna.model.vo.Qna;

public class QnaDao {
	private Properties prop = new Properties();

	public QnaDao() {
		String fileName = QnaDao.class.getResource("/sql/qna/qna-query.properties").getPath();
		System.out.println(fileName);
		  prop = new Properties();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		System.out.println("리스트카운트sql : "+sql);
	
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("리스트카운트 : " + listCount);
		return listCount;
	}

	public int getListCount(Connection conn, String mId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount2");
		System.out.println("리스트카운트sql : "+sql);
		System.out.println("아이디뭐니" + mId);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("일반유저리스트카운트 : " + listCount);
		return listCount;
	}
	public ArrayList<Qna> selectQnaList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Qna> list = new ArrayList<Qna>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectQnaList");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);

			// 쿼리문 실행 시 조건절에 넣을 변수들
			// currentPage = 1 --> startRow 1 ~ endRow 10
			// currentPage = 2 --> startRow 11 ~ endRow 20

			// startRow : (currentPage - 1) * boardLimit + 1
			// endRow : startRow + boardLimit - 1
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				String qId = rset.getString("q_id");
				String qTitle = rset.getString("q_title");
				String mId = rset.getString("m_id");
				Date qDate = rset.getDate("q_date");
				String qCate = rset.getString("q_cate");
				String aStatus = rset.getString("a_status");
				
				list.add(new Qna(qId, qTitle, mId, qDate, qCate, aStatus));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public Qna selectQna(Connection conn, String qId) {
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> alist = new ArrayList<>();
		ArrayList<Date> dlist = new ArrayList<>();
		try {
		
			String sql = prop.getProperty("selectQna");
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				q = new Qna();
				q.setqId(rs.getString("q_id"));
				q.setqCate(rs.getString("q_cate"));
				q.setqTitle(rs.getString("q_title"));
				q.setqContent(rs.getString("q_content"));
				q.setOrderId(rs.getString("order_id"));
				q.setmNo(rs.getString("m_id"));
				q.setqDate(rs.getDate("q_date"));
				q.setaStatus(rs.getString("a_status"));
				alist.add(rs.getString("a_content"));
				dlist.add(rs.getDate("a_date"));
				q.setqTitle(rs.getString("q_title"));
			}
			
			//q.setaContent(/*리스트가 들어가야됨*/);
			q.setaContent(alist);
			q.setaDate(dlist);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		finally
		{	close(rs);
			close(pstmt);
		}
	
		return q;
	}



	public int insertQna(Connection conn, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertQna");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setString(3, q.getmNo());
			pstmt.setString(4, q.getOrderId());
			pstmt.setString(5, q.getqCate());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



	public ArrayList<Qna> selectQnaList(Connection conn, int currentPage, int boardLimit, String mId2) {
ArrayList<Qna> list = new ArrayList<Qna>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectQnaList2");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);

			// 쿼리문 실행 시 조건절에 넣을 변수들
			// currentPage = 1 --> startRow 1 ~ endRow 10
			// currentPage = 2 --> startRow 11 ~ endRow 20

			// startRow : (currentPage - 1) * boardLimit + 1
			// endRow : startRow + boardLimit - 1
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setString(1, mId2);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				String qId = rset.getString("q_id");
				String qTitle = rset.getString("q_title");
				String mId = rset.getString("m_id");
				Date qDate = rset.getDate("q_date");
				String qCate = rset.getString("q_cate");
				String aStatus = rset.getString("a_status");
				
				list.add(new Qna(qId, qTitle, mId, qDate, qCate, aStatus));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertAnswer(Connection conn, String qId, String aContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAnswer");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qId);
			pstmt.setString(2, aContent);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//답변 등록하면 상태 y로 변경
	public int updateAnswerStatus(Connection conn, String qId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateAnswerStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Qna selectAnswerList(Connection conn, String qId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Qna a = null;
		ArrayList<String> alist = new ArrayList<>();
		ArrayList<Date> dlist = new ArrayList<>();
		String sql = prop.getProperty("selectAnswerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				a = new Qna();
				alist.add(rs.getString("a_content"));
				dlist.add(rs.getDate("a_date"));
			}
			
			a.setaContent(alist);
			a.setaDate(dlist);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return a;
	}





}
