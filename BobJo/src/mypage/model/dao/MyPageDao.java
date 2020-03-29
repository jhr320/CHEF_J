package mypage.model.dao;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

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

import attachment.model.vo.Attachment;
import board.model.dao.BoardDao;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import post.model.vo.Post;
import product.model.vo.Product;
import qna.model.vo.Qna;
import recipe.model.vo.Recipe;

public class MyPageDao {
	private Properties prop = new Properties();

	public MyPageDao() {

		String fileName = MyPageDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*
	 * public ArrayList<Recipe> selectList(Connection conn, String userId) {
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * ArrayList<Recipe> rlist = new ArrayList<Recipe>(); Recipe r = null;
	 * 
	 * String sql = prop.getProperty("selectList");
	 * 
	 * try {
	 * 
	 * pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, userId);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) {
	 * 
	 * r = new Recipe(
	 * 
	 * rs.getString("r_id"), rs.getString("r_name"), rs.getString("m_no"),
	 * rs.getDate("r_date"), rs.getInt("r_count"), rs.getInt("r_like")
	 * 
	 * );
	 * 
	 * rlist.add(r); } System.out.println(rlist);
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rs);
	 * close(pstmt); }
	 * 
	 * return rlist; }
	 * 
	 * public ArrayList<Attachment> selectThumbnail(Connection conn, String rId) {
	 * PreparedStatement pstmt = null; ResultSet rset = null; Attachment thumbnail =
	 * null;
	 * 
	 * ArrayList<Attachment> thumbnail2 = new ArrayList<Attachment>(); String sql =
	 * prop.getProperty("selectThumbnail");
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, rId); rset =
	 * pstmt.executeQuery();
	 * 
	 * while (rset.next()) { thumbnail = new Attachment(rset.getString("F_ID"),
	 * rset.getInt("BTYPE"), rset.getString("BPRC_ID"), rset.getInt("F_LEVEL"),
	 * rset.getString("F_STATUS"), rset.getString("F_PATH"),
	 * rset.getString("F_NAME"), rset.getString("CHNAGE_NAME"));
	 * System.out.println(thumbnail + "zz"); thumbnail2.add(thumbnail);
	 * System.out.println(thumbnail2); } } catch (SQLException e) {
	 * e.printStackTrace(); } finally { close(rset); close(pstmt); }
	 * 
	 * return thumbnail2; }
	 * 
	 * public int getListCount(Connection conn) { int listCount = 0;
	 * 
	 * Statement stmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("getListCount");
	 * 
	 * try { stmt = conn.createStatement(); rset = stmt.executeQuery(sql);
	 * 
	 * if (rset.next()) { listCount = rset.getInt(1); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rset);
	 * close(stmt); } return listCount; }
	 * 
	 * public ArrayList<Recipe> selectList2(Connection conn, String userId, int
	 * currentPage, int boardLimit) { ArrayList<Recipe> list = new
	 * ArrayList<Recipe>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectList");
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * int startRow = (currentPage - 1) * boardLimit + 1; int endRow = startRow +
	 * boardLimit - 1; System.out.println(startRow + " " + endRow); pstmt.setInt(1,
	 * startRow); pstmt.setInt(2, endRow);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while (rset.next()) {
	 * 
	 * String rId = rset.getString("r_id"); String rName = rset.getString("r_name");
	 * String mNo = rset.getString("m_no"); Date rDate = rset.getDate("r_date"); int
	 * rCount = rset.getInt("rCount"); int rLike = rset.getInt("r_like");
	 * list.add(new Recipe(rId, rName, mNo, rDate, rCount)); } } catch (SQLException
	 * e) { e.printStackTrace(); } finally { close(rset); close(pstmt); } return
	 * list; }
	 */

	public ArrayList<Recipe> selectList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Recipe> rlist = new ArrayList<Recipe>();
		Recipe r = null;

		String sql = prop.getProperty("selectList");

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				r = new Recipe(

						rs.getString("r_id"), rs.getString("r_name"), rs.getString("m_no"), rs.getDate("r_date"),
						rs.getInt("r_count"), rs.getInt("r_like")

				);

				rlist.add(r);
			}
			System.out.println(rlist);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return rlist;
	}

	public Attachment selectThumbnail(Connection conn, String rId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment thumbnail = null;

		String sql = prop.getProperty("selectThumbnail");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				thumbnail = new Attachment(rset.getString("F_ID"), rset.getInt("BTYPE"), rset.getString("BPRC_ID"),
						rset.getInt("F_LEVEL"), rset.getString("F_STATUS"), rset.getString("F_PATH"),
						rset.getString("F_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return thumbnail;
	}

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
		return listCount;
	}

	/*
	 * public ArrayList<Recipe> selectList2(Connection conn, String userId, int
	 * currentPage, int boardLimit) { ArrayList<Recipe> list = new
	 * ArrayList<Recipe>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectList");
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * 
	 * int startRow = (currentPage - 1) * boardLimit + 1; int endRow = startRow +
	 * boardLimit - 1; System.out.println(startRow +" "+ endRow); pstmt.setInt(1,
	 * startRow); pstmt.setInt(2, endRow);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while (rset.next()) {
	 * 
	 * 
	 * String rId = rset.getString("r_id"); String rName = rset.getString("r_name");
	 * String mNo = rset.getString("m_no"); Date rDate = rset.getDate("r_date"); int
	 * rCount = rset.getInt("rCount"); int rLike = rset.getInt("r_like");
	 * list.add(new Recipe(rId, rName, mNo, rDate, rCount ,rLike )); } } catch
	 * (SQLException e) { e.printStackTrace(); } finally { close(rset);
	 * close(pstmt); } return list; }
	 */
	public int insertPrMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;

		int result = 0;
		System.out.println(m);
		String sql = prop.getProperty("insertPrMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getNickname());
			pstmt.setString(2, m.getmIntro());
			pstmt.setString(3, m.getmId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("insertAttachment");

		try {
			for (int i = 0; i < fileList.size(); i++) {

				Attachment at = fileList.get(i);
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, at.getBprcId());
				pstmt.setString(2, at.getfPath());
				pstmt.setString(3, at.getfName());
				pstmt.setString(4, at.getChangeName());

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 회원 정보 수정
	public int updateMember(Connection conn, Member m) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getAddr());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getBirth());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member selectMember(Connection conn, String mId) {
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				mem = new Member(rset.getString("m_no"), rset.getString("m_id"), rset.getString("m_pwd"),
						rset.getString("m_name"), rset.getDate("m_ent_date"), rset.getString("email"),
						rset.getString("phone"), rset.getString("addr"), rset.getString("gender"),
						rset.getString("nickname"), rset.getString("birth"), rset.getString("m_grade"),
						rset.getDate("m_out_date"), rset.getString("m_status"), rset.getString("m_intro"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mem;
	}

	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updatePwd");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int deleteMember(Connection conn, String mId) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("deleteMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	///

	public ArrayList<Recipe> selectList2(Connection conn, String userNo, int currentPage, int boardLimit) {
		ArrayList<Recipe> mrList = new ArrayList<Recipe>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList2");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setString(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				String rId = rset.getString("r_id");
				String rName = rset.getString("r_name");
				String mNo = rset.getString("m_no");
				String cateInId = rset.getString("cate_in_id");
				String cateFoId = rset.getString("cate_fo_id");
				String cateMethodId = rset.getString("cate_method_id");
				Date rDate = rset.getDate("r_date");
				String rInfo = rset.getString("r_info");
				int rCount = rset.getInt("r_count");
				int rLike = rset.getInt("r_like");
				int rCookTime = rset.getInt("r_cooktime");
				int rCookLevel = rset.getInt("r_cooklevel");
				String rStatus = rset.getString("r_status");
				mrList.add(new Recipe(rId, rName, mNo, cateInId, cateFoId, cateMethodId, rDate, rInfo, rCount, rLike,
						rCookTime, rCookLevel, rStatus));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mrList;
	}

	public ArrayList<Post> selectBoardList(Connection conn, String userNo, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Post> selectBoardList = new ArrayList<Post>();
		Post p = null;

		String sql = prop.getProperty("selectBoardList");
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				

				p = new Post(
					rs.getString("b_id"),
					rs.getInt("b_type"),
					rs.getString("b_title"),
					rs.getString("b_content"),
					rs.getString("m_no"),
					rs.getDate("b_date"),
					rs.getInt("b_count"),
					rs.getInt("b_like"),
					rs.getString("b_status"),
					rs.getInt("b_num")
			
						

				);

				selectBoardList.add(p);
			}
			System.out.println(selectBoardList);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return selectBoardList;

	}

	public ArrayList<Qna> selectQnaList(Connection conn, String userNo, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Qna> selectQnaList = new ArrayList<Qna>();
		Qna q = null;

		String sql = prop.getProperty("selectQnaList");
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				
	

				q = new Qna(
					rs.getString("q_id"),
					rs.getString("q_title"),
					rs.getString("m_no"),
					rs.getDate("q_date"),
					rs.getString("q_cate"),
					rs.getString("a_status")
			
						

				);

				selectQnaList.add(q);
			}
			System.out.println(selectQnaList);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return selectQnaList;

	}

	///

	/*
	 * public ArrayList<Recipe> selectList2(Connection conn, int currentPage, int
	 * boardLimit) { ArrayList<Recipe> mrList = new ArrayList<>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectList2");
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * int startRow = (currentPage - 1) * boardLimit + 1; int endRow = startRow +
	 * boardLimit - 1;
	 * 
	 * pstmt.setInt(1, startRow); pstmt.setInt(2, endRow);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while (rset.next()) { mrList.add(new Product( // 필드 채워넣기
	 * rset.getString("PID"), rset.getString("CATE_IN_ID"),
	 * rset.getString("P_NAME"), rset.getInt("P_PRICE"),
	 * rset.getString("P_SHORT_DESC"), rset.getString("P_SALE_UNIT"),
	 * rset.getString("P_WEIGHT"), rset.getInt("P_STOCK"))); } } catch (SQLException
	 * e) { e.printStackTrace(); } finally { close(rset); close(pstmt); } return
	 * list; }
	 */

}
