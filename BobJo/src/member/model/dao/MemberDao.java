package member.model.dao;

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

import member.model.vo.Member;
import notice.model.vo.Notice;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		// 생성자에 프로퍼티파일 미리 불러오기
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 로그인용 loginUser select메소드
	public Member loginMember(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		Member loginUser = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rs = pstmt.executeQuery();

			
			if(rs.next()) {
				loginUser = new Member(
						rs.getString("m_no"),
						rs.getString("m_id"),
						rs.getString("m_pwd"),
						rs.getString("m_name"),
						rs.getDate("m_ent_date"),
						rs.getString("email"),
						rs.getString("phone"),
						rs.getString("addr"),
						rs.getString("gender"),
						rs.getString("nickname"),
						//생일때문에 너무 고통스러움..
						rs.getString("birth"),
						rs.getString("m_grade"),
						rs.getDate("m_out_date"),
						rs.getString("m_status"),
						rs.getString("m_intro")
						);
			}

			System.out.println("로그인유저: " + loginUser);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loginUser;
	}

	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	//회원가입 Dao
	public int insertMember(Connection conn, Member m) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getmId());
			pstmt.setString(2, m.getmPwd());
			pstmt.setString(3, m.getmName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddr());
			pstmt.setString(7, m.getGender());
			pstmt.setString(8, m.getBirth());
					
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		
		return result;
	}
	
	// 회원가입 이메일중복확인 메소드
	public int checkMemberEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		
		String sql = prop.getProperty("checkMemberEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		
		return result;
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
		System.out.println("NOTICE list카운트 : " + listCount);
		return listCount;
	}

	public ArrayList<Member> selectMemberList(Connection conn, int currentPage, int boardLimit) {
	ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = prop.getProperty("selectMemberList");
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

			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new Member(
						rs.getString("m_no"),
						rs.getString("m_id"),
						rs.getString("m_name"),
						rs.getDate("m_ent_date"),
						rs.getString("email"),
						rs.getString("phone"),
						rs.getString("addr"),
						rs.getString("gender"),
						rs.getString("nickname"),
						//생일때문에 너무 고통스러움..
						rs.getString("birth"),
						rs.getString("m_grade"),
						rs.getDate("m_out_date"),
						rs.getString("m_status"),
						rs.getString("m_intro")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int updateOutDate(Connection conn, String mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateOutDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return result;
	}



	public int updateStatusMember(Connection conn, String[] mNo, String status) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateStatusMember");
		
		try {
			
			for(int i = 0; i < mNo.length; i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, status);
				pstmt.setString(2, mNo[i]);
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateGrade(Connection conn, String mNo, String m_grade) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		System.out.println("G : "+ m_grade);
		System.out.println("mNo : "+ mNo);
		
		String sql = prop.getProperty("updateGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_grade);
			pstmt.setString(2, mNo);
			
			
			result = pstmt.executeUpdate();
			System.out.println("적용된 값:"+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int phoneCheck(Connection conn, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("phoneCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	
}
