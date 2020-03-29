
package board.model.dao;

import static common.JDBCTemplate.*;

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
import post.model.vo.Post;

public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board.properties").getPath();

		  prop = new Properties();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<Post> selectList(Connection conn, int currentPage, int boardLimit ,int type) {
		ArrayList<Post> list = new ArrayList<Post>();
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql  = "";
		if(type == 1) {
			sql= prop.getProperty("selectList");
		}
		else if (type == 2)
		{
			sql= prop.getProperty("selectList2");
		}

		try {
			pstmt = conn.prepareStatement(sql);

			// 쿼리문 실행 시 조건절에 넣을 변수들
			// currentPage = 1 --> startRow 1 ~ endRow 10
			// currentPage = 2 --> startRow 11 ~ endRow 20

			// startRow : (currentPage - 1) * boardLimit + 1
			// endRow : startRow + boardLimit - 1
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			System.out.println(startRow +" "+ endRow);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				String title = rset.getString("b_title");
				Date date = rset.getDate("b_date");
				String bid = rset.getString("B_id");
				String writer = rset.getString("M_NO");
				list.add(new Post(bid,title,writer,date));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}

	
	public ArrayList<Notice> selectNoticeList(Connection conn, int currentPage, int boardLimit ,int type) {
		ArrayList<Notice> list = new ArrayList<Notice>();
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");
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
				String title = rset.getString("n_title");
				Date date = rset.getDate("n_date");
				String bid = rset.getString("n_id");
				String writer = rset.getString("m_no");
				list.add(new Notice(bid,title,writer,date));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	
	
	public int getListCount(Connection conn, int type) {
		
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		// SELECT COUNT(*) FROM BOARDTYPE1
		String sql = "";
		if(type == 1) {
			sql= prop.getProperty("getListCount");
		}
		else if (type == 2)
		{
			sql= prop.getProperty("getListCount2");
		}

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
		return listCount;
	}

	// 2. 게시판 리스트 조회용 dao



	// 4. 게시판 상세 보기 dao
	public Post selectBoard(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Post b = null;

		// 쿼리문 복잡하니 스크립트 참고
		String query = prop.getProperty("selectBoard");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, bid);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return b;
	}
}
