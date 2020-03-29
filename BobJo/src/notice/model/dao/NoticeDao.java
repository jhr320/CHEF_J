package notice.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
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

import notice.model.vo.Notice;
import qna.model.vo.Qna;

public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = Notice.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 1. 공지사항리스트용 dao

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
	
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
		System.out.println("NOTICE list카운트 : " + listCount);
		return listCount;
	}

	public ArrayList<Notice> selectNoticeList(Connection conn, int currentPage, int boardLimit) {
			ArrayList<Notice> list = new ArrayList<Notice>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectNoticeList");
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
				String nId = rset.getString("n_id");
				String nTitle = rset.getString("n_title");
				String nContent = rset.getString("n_content");
				String mId = rset.getString("m_id");
				Date nDate = rset.getDate("n_date");
				int nCount = rset.getInt("n_count");
				String nStatus = rset.getString("n_status");
	
				list.add(new Notice(nId, nTitle, nContent, mId, nDate, nCount, nStatus));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Notice selectNotice(Connection conn, String nId) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
		
			String sql = prop.getProperty("selectNotice");
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				n = new Notice();
				n.setnId(rs.getString("n_id"));
				n.setnTitle(rs.getString("n_title"));
				n.setnContent(rs.getString("n_content"));
				// 아이디가 필요한거라 아이디 넣음.
				n.setmNo(rs.getString("m_id"));
				n.setnDate(rs.getDate("n_date"));
				n.setnStatus(rs.getString("n_status"));
				n.setnCount(rs.getInt("n_count"));
			}
			System.out.println("dao내부의 n: "+ n);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		finally
		{	close(rs);
			close(pstmt);
		}
	
		return n;
	}

	// 3. 조회수 증가용 dao메소드
		public int increaseCount(Connection conn, String nId) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("increaseCount");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nId);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
		}

		public int insertNotice(Connection conn, Notice n) {
			int result = 0;
			PreparedStatement pstmt = null;
			System.out.println("notice : " + n);
			String sql = prop.getProperty("insertNotice");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, n.getnTitle());
				pstmt.setString(2, n.getnContent());
				pstmt.setString(3, n.getmNo());

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

		public int updateNotice(Connection conn, Notice n) {
			int result = 0;

			PreparedStatement pstmt = null;

			String sql = prop.getProperty("updateNotice");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, n.getnTitle());
				pstmt.setString(2, n.getnContent());
				pstmt.setString(3, n.getnId());

				result = pstmt.executeUpdate();
System.out.println("수정도ㅒㅆ냐안됐냐 : " + result);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}

	
	/*
	
	
	
	public int noticeInsert(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("noticeInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	// 공지 글 읽기용 조회 메소드
	public Notice selectNotice(Connection conn, int nno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String sql = prop.getProperty("selectNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				n.setnNo(rset.getInt("nno"));
				n.setnTitle(rset.getString("ntitle"));
				n.setnWriter(rset.getString("nwriter"));
				n.setnContent(rset.getString("ncontent"));
				n.setnCount(rset.getInt("ncount"));
				n.setnDate(rset.getDate("ndate"));
				n.setStatus(rset.getString("status"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return n;
	}
	
	// 공지사항 삭제용 dao
	public int noticeDelete(Connection conn, int nno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		// 상태 y->n으로 업데이트
		String sql = prop.getProperty("noticeDelete");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	public int noticeUpdate(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("noticeUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setInt(3, n.getnNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	public ArrayList<Notice> searchNotice(Connection conn, String searchCondition, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		ArrayList<Notice> list = new ArrayList<>();
		
		String sql = "";
		if(searchCondition.equals("title")) {
			sql = prop.getProperty("searchNoticeTitle");
			
		}else if(searchCondition.equals("content")) {
			sql = prop.getProperty("searchNoticeContent");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				n = new Notice();
				n.setnNo(rset.getInt("nno"));
				n.setnTitle(rset.getString("ntitle"));
				n.setnContent(rset.getString("ncontent"));
				n.setnWriter(rset.getString("nwriter"));
				n.setnCount(rset.getInt("ncount"));
				n.setnDate(rset.getDate("ndate"));
				list.add(n);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}*/

}
