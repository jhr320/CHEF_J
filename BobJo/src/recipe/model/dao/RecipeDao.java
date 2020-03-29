package recipe.model.dao;

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

import attachment.model.vo.Attachment;
import board.model.dao.BoardDao;
import recipe.model.vo.Recipe;
import recipe.model.vo.Step;

public class RecipeDao {
	private Properties prop = new Properties();

	public RecipeDao() {

		String fileName = BoardDao.class.getResource("/sql/recipe/recipe-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
			Connection conn = getConnection();
			Statement stmt = null;
			ResultSet rset = null;
			try {
				stmt = conn.createStatement();
				/*
				 * rset = stmt.
				 * executeQuery("SELECT SEQ_SID.nextval, SEQ_RID.nextval, SEQ_FID.nextval from dual"
				 * );
				 */

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
				close(conn);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 레시피 게시글 개수 카운트
	public int getListCount(Connection conn, String nation) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nation);
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

		return listCount;
	}

	/*
	 * public ArrayList<Recipe> selectList(Connection conn, int currentPage, int
	 * boardLimit) { ArrayList<Recipe> rList = new ArrayList<>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectList");
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * int startRow = (currentPage - 1) * boardLimit + 1; int endRow = startRow +
	 * boardLimit -1;
	 * 
	 * pstmt.setInt(1, startRow); pstmt.setInt(2, endRow);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while(rset.next()) { rList.add(new
	 * Recipe(rset.getString(2),rset.getString(3),rset.getString(4),rset.getString(5
	 * ),rset.getString(6),rset.getString(7),rset.getDate(8),rset.getString(9),rset.
	 * getInt(10),rset.getInt(11),rset.getInt(12),rset.getInt(13),rset.getString(14)
	 * )); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }finally { close(rset);
	 * close(pstmt); } return rList; }
	 */

	// 레시피 상세보기
	public ArrayList<Recipe> selectRecipe(Connection conn, String rId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Recipe> list = new ArrayList<>();
		Recipe r = null;

		String query = prop.getProperty("selectRecipe");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, rId);
			

			rs = pstmt.executeQuery();

			while (rs.next()) {
				r = new Recipe(rs.getString("r_Id"), rs.getString("r_Name"), rs.getString("m_No"),
						rs.getString("r_Info"), rs.getInt("r_Count"), rs.getInt("r_CookTime"), rs.getInt("r_CookLevel"),
						rs.getString("r_In_Name"), rs.getString("r_Weight"), rs.getInt("s_Step"),
						rs.getString("s_Desc"));
				list.add(r);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	// 조회수 증가 dao
	public int increaseCount(Connection conn, String rId) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/*
	 * public ArrayList<Recipe> selectList(Connection conn, String nation) {
	 * ArrayList<Recipe> rList = new ArrayList<Recipe>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectList");
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, nation);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while (rset.next()) { rList.add(new Recipe( // 레시피명, 작성자명, 좋아요수, 날짜, 조회수
	 * rset.getString("R_ID"), rset.getString("R_NAME"), rset.getString("M_NO"),
	 * rset.getDate("R_DATE"), rset.getInt("R_COUNT"), rset.getInt("R_LIKE")
	 * 
	 * )); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rset);
	 * close(pstmt); }
	 * 
	 * return rList; }
	 */

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

	//////////////// 내가사용한메소드 이거는 내가 만들었어
	public ArrayList<Recipe> selectList(Connection conn, String nation) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Recipe> rlist = new ArrayList<Recipe>();
		Recipe r = null;

		String sql = prop.getProperty("selectList");

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, nation);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				r = new Recipe(rs.getString("r_id"), rs.getString("r_name"), rs.getString("m_no"),
						rs.getString("cate_in_id"), rs.getString("cate_fo_id"), rs.getString("cate_method_id"),
						rs.getDate("r_date"), rs.getString("r_info"), rs.getInt("r_count"), rs.getInt("r_cooktime"),
						rs.getInt("r_cooklevel"), rs.getString("r_status"));

				rlist.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return rlist;
	}

	public ArrayList<Attachment> selectImages(Connection conn, String rId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Attachment> imgList = new ArrayList<>();

		String sql = prop.getProperty("selectImages");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				imgList.add(new Attachment(rset.getString("F_ID"), rset.getInt("BTYPE"), rset.getString("BPRC_ID"),
						rset.getInt("F_LEVEL"), rset.getString("F_STATUS"), rset.getString("F_PATH"),
						rset.getString("F_NAME")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return imgList;
	}

	// step 이미지
	public ArrayList<Attachment> selectStep(Connection conn, String rId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Attachment> rStepList = new ArrayList<>();

		String sql = prop.getProperty("selectStep");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Attachment att = new Attachment();
				att.setfId(rset.getString("F_ID"));
				att.setBtype(rset.getInt("BTYPE"));
				att.setBprcId(rset.getString("BPRC_ID"));
				att.setfLevel(rset.getInt("F_LEVEL"));
				att.setfStatus(rset.getString("F_STATUS"));
				att.setfPath(rset.getString("F_PATH"));
				att.setfName(rset.getString("F_NAME"));

				rStepList.add(att);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return rStepList;
	}

	/*
	 * public ArrayList<Recipe> selectReList(Connection conn, int currentPage, int
	 * boardLimit) { ArrayList<Recipe> reList = new ArrayList<>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectReList");
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
	 * while (rset.next()) { reList.add(new
	 * Recipe(rset.getString(1),rset.getString(2), rset.getString(3),
	 * rset.getString(4), rset.getInt(5), rset.getInt(6))); }
	 * 
	 * 
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rset);
	 * close(pstmt); }
	 * 
	 * return rStepList; }
	 */

	/*
	 * public ArrayList<Recipe> selectReList(Connection conn, int currentPage, int
	 * boardLimit) { ArrayList<Recipe> reList = new ArrayList<>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectReList");
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
	 * while (rset.next()) { reList.add(new Recipe(rset.getString(2),
	 * rset.getString(3), rset.getString(4), rset.getInt(5), rset.getInt(6))); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rset);
	 * close(pstmt); } return reList; }
	 */

	public int updateLike(Connection conn, String rId, String mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("insertLike");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			pstmt.setString(2, mId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		return result;

	}

	public int selectLike(Connection conn, String rId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectLike");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int selectDislike(Connection conn, String rId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectDislike");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int updatedisLike(Connection conn, String rId, String mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("insertDislike");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, rId);
			pstmt.setString(2, mId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public String insertRecipe(Connection conn, Recipe r) {
		ResultSet rset = null;
		String str = "";
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertRecipe");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getmNo());

			pstmt.setString(2, r.getrName());
			pstmt.setString(3, r.getrInfo());
			pstmt.setString(4, r.getCateFoId());
			pstmt.setString(5, r.getCateMethodId());
			pstmt.setString(6, r.getCateInId());
			pstmt.setString(7, r.getrInName());
			pstmt.setString(8, r.getrWeight());
			pstmt.setInt(9, r.getrCookTime());
			pstmt.setInt(10, r.getrCookLevel());
			pstmt.setDate(11, r.getrDate());
			result = pstmt.executeUpdate();

			if (result > 0) {
				commit(conn);
				System.out.println("List 를 가지고 온다");
				sql = prop.getProperty("getItemInserted");
				pstmt = conn.prepareStatement(sql);
				// pstmt.setString(1, r.getmNo());
				rset = pstmt.executeQuery();
				if (rset.next()) {
					str = rset.getString(1);
					System.out.println("List 를 가지고 왔다 "+ str);
				}
			} else {
				rollback(conn);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return str;
	}

	public String retriveId(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String str = null;
		String sql = prop.getProperty("retriveId");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				str = rset.getString("rId");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return str;
	}

	public String insertStep(Connection conn, ArrayList<Step> stepList) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sId = "";
		String sql = prop.getProperty("insertStep");

		try {
			Step step = stepList.get(0);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, step.getrId());
			pstmt.setInt(2, step.getsStep());
			pstmt.setString(3, step.getsDesc());
			result = pstmt.executeUpdate();
			if (result > 0) {
				for (int i = 1; i < stepList.size(); i++) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, stepList.get(i).getrId());
					pstmt.setInt(2, stepList.get(i).getsStep());
					pstmt.setString(3, stepList.get(i).getsDesc());
					result = pstmt.executeUpdate();
				}
				if (result > 0) {
					sql = prop.getProperty("getStepInserted");
					pstmt = conn.prepareStatement(sql);
					rset = pstmt.executeQuery();
					if (rset.next()) {
						sId = rset.getString(1);
						System.out.println(sId);
					}

				}
			} else {
				result = 0;
				sId = "";
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sId;
	}

	public int deleteRecipe(Connection conn, String rId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteRecipe");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public int deletetStep(Connection conn, String rId) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deletetStep");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	// 메인페이지 추천레시피 아이디 네개 셀렉
	public ArrayList<String> selectRecommendRNumbers(Connection conn) {
		ArrayList<String> rList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = prop.getProperty("selectRecommendRNumbers");

		try {

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rList.add(rs.getString(2));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);

		}

		// 3개의 r_id전달
		return rList;
	}

	public ArrayList<Recipe> selectRecommendRList(Connection conn, ArrayList<String> r_idList) {
		ArrayList<Recipe> rList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Recipe r = null;

		String sql = prop.getProperty("selectRecommendRList");

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r_idList.get(0));
			pstmt.setString(2, r_idList.get(1));
			pstmt.setString(3, r_idList.get(2));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				r = new Recipe(rs.getString("r_id"), rs.getString("r_name"), rs.getString("m_no"),
						rs.getString("cate_in_id"), rs.getString("cate_fo_id"), rs.getString("cate_method_id"),
						rs.getDate("r_date"), rs.getString("r_info"), rs.getInt("r_count"), rs.getInt("r_cooktime"),
						rs.getInt("r_cooklevel"), rs.getString("r_status"));
				rList.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		// 3개의 r_id전달
		return rList;
	}

	// 내가 누른 좋아요 리스트 불러오기

	public ArrayList<String> selectLikeList(Connection conn, String mNo) {
		ArrayList<String> L_rId = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("selectLikeList");

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				L_rId.add(rs.getString("R_ID"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("돼라: " + L_rId); // 내가 누른 레시피가 뭔지 담겨있습니다,,
		return L_rId;
	}

	public ArrayList<Recipe> selectList2(Connection conn, String nation, int currentPage, int boardLimit) {
		ArrayList<Recipe> reList = new ArrayList<Recipe>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList2");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setString(1, nation);
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
				reList.add(new Recipe(rId, rName, mNo, cateInId, cateFoId, cateMethodId, rDate, rInfo, rCount, rLike,
						rCookTime, rCookLevel, rStatus));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reList;
	}

	public ArrayList<Recipe> selectListWhole(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Recipe> reList = new ArrayList<Recipe>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectListWhole");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

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
				
				reList.add(new Recipe(rId, rName, mNo, cateInId, cateFoId, cateMethodId, rDate, rInfo, rCount, rLike,
						rCookTime, rCookLevel, rStatus));
				
				

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reList;
	}

	public int getListCountWhole(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCountWhole");

		try {
			pstmt = conn.prepareStatement(sql);
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

		return listCount;
	}

	public ArrayList<Recipe> selectListBest(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Recipe> reList = new ArrayList<Recipe>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectListBest");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

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
				
				reList.add(new Recipe(rId, rName, mNo, cateInId, cateFoId, cateMethodId, rDate, rInfo, rCount, rLike,
						rCookTime, rCookLevel, rStatus));
				
				

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reList;
	}

	public ArrayList<Step> selectstep2(Connection conn, String rId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sId = "";
		String sql = prop.getProperty("selectStep2");
		ArrayList<Step> stepList2 = null;

		try {
			/* Step step = stepList2.get(0); */
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, rId);
			/*
			 * pstmt.setInt(2, step.getsStep()); pstmt.setString(3, step.getsDesc());
			 */
			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return stepList2;
	}

}