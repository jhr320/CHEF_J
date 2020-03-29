package post.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import post.model.vo.Post;

public class PostDao {
	private Properties prop =null;
	public PostDao() {
		String fileName = PostDao.class.getResource("/sql/post/post-query.properties").getPath();
		prop = new Properties();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Post postSelect(Connection conn, String nPost) {
		Post p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
		
			String sql = prop.getProperty("postSelect");
			sql = "SELECT * FROM Board WHERE b_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nPost);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				p=new Post(
					rset.getString("B_ID"),
					rset.getInt("b_type"),
					rset.getString("b_title"),
					rset.getString("b_content"),
					rset.getString("m_no"),
					rset.getDate("b_date"),
					rset.getInt("b_count"),
					rset.getInt("b_like"),
					rset.getString("b_status")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		finally
		{	close(rset);
			close(pstmt);
		}
	
		return p;
	}

	public int postEdit(Connection conn, Post p) {
		int result = 0;
		PreparedStatement pstmt = null;
		

		try {
			
			String sql = "";// prop.getProperty("postEdit");
			sql = "UPDATE BOARD SET B_TITLE = ?, B_CONTENT=? WHERE B_ID=? AND M_NO =? ";

			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,p.getpTitle());
			pstmt.setString(2,p.getpCotent());
			pstmt.setString(3,p.getpId());
			pstmt.setString(4,p.getpWriter());


			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{
			close(pstmt);
		}
		return result;
	}

	public int postDelete(Connection conn, String nPost) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			String sql = prop.getProperty("postDelete");
			sql = "UPDATE BOARD SET B_STATUS='n' WHERE B_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nPost);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			close(pstmt);
		}
		return result;
	}

	public int postInsert(Connection conn, Post p) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			String sql = prop.getProperty("postInsert");
			sql = "INSERT INTO BOARD VALUES('B'||SEQ_BOARD.NEXTVAL,?,?"
					+ ",?,?,? "
					+ ",?,?,?,SEQ_BOARD_NUM_1.nextval)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,p.getpType());
			pstmt.setString(2,p.getpTitle());
			pstmt.setString(3,p.getpCotent());
			pstmt.setString(4,p.getpWriter());
			pstmt.setDate(5,p.getpDateWritten());
			pstmt.setInt(6,p.getpCount());
			pstmt.setInt(7,p.getpLike());
			pstmt.setString(8,"Y");
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{
			close(pstmt);
		}
		return result;
	}
	
	//****************************************************
	//조회수 (visotor).
	public int increaseCount(Connection conn, String bid) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("increaseCount");
		sql = "UPDATE BOARD SET B_COUNT=B_COUNT+1 WHERE B_ID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	//****************************************************
		//조회수 (visotor).
	public int increaseLikeCount(Connection conn, String bid) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("increaseLikeCount");
		sql = "UPDATE BOARD SET B_LIKE=B_LIKE+1 WHERE B_ID=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
