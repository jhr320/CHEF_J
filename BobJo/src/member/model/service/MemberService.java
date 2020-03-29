package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class MemberService {

	// 1. 로그인용 서비스
		public Member loginMember(String userId, String userPwd) {
			// JDBCTemplate 만들기
			Connection conn = getConnection();
			
			Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
			System.out.println(loginUser);
			close(conn);
			
			return loginUser;
		}

		// 아이디 중복확인
		public int idCheck(String userId) {
			Connection conn = getConnection();
			int result = new MemberDao().idCheck(conn, userId);
			
			close(conn);
			
			return result;
		}

		
		// 회원가입!!!!!!!!!!!!
		public int insertMember(Member m) {
			Connection conn = getConnection();
			
			int result = new MemberDao().insertMember(conn, m);
			
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}
		
		// 회원가입 이메일중복확인 메소드
		public int checkMemberEmail(String email) {
			//select
			Connection conn = getConnection();
			
			int result = new MemberDao().checkMemberEmail(conn, email);

			
			close(conn);
			
			return result;
		}

		public int getListCount() {
			Connection conn = getConnection();

			int listCount = new MemberDao().getListCount(conn);

			close(conn);

			return listCount;
		}

		public ArrayList<Member> selectMemberList(int currentPage, int boardLimit) {
			Connection conn  = getConnection();
			
			 ArrayList<Member> list = new MemberDao().selectMemberList(conn, currentPage, boardLimit);

			close(conn);
			 return list;
		}

		public int updateOutDate(String mNo) {
			Connection conn = getConnection();
			
			int result = new MemberDao().updateOutDate(conn, mNo);
			
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}





		public int updateStatusMember(String[] mNo, String status) {
			Connection conn = getConnection();
			
			
			int result = new MemberDao().updateStatusMember(conn, mNo, status);
			
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}

		

		public int updateGrade(String mNo, String m_grade) {
	Connection conn = getConnection();
			
			int result = new MemberDao().updateGrade(conn, mNo, m_grade);
		
			if(result > 0) {
				System.out.println("성공");
			commit(conn);
			}else {
			rollback(conn);
			System.out.println("실패");
			}
		
			close(conn);
		
		return result;
		}

		public int phoneCheck(String phone) {
			Connection conn = getConnection();
			int result = new MemberDao().phoneCheck(conn, phone);
			
			close(conn);
			
			return result;
		}

}
