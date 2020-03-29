package mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import attachment.model.vo.Attachment;
import member.model.vo.Member;
import mypage.model.dao.MyPageDao;
import post.model.vo.Post;
import product.model.dao.ProductDao;
import product.model.vo.Product;
import qna.model.vo.Qna;
import recipe.model.vo.Recipe;

public class MyPageService {

	/*
	 * public ArrayList<Recipe> selectList(String userId) {
	 * 
	 * Connection conn = getConnection(); MyPageDao mpDao = new MyPageDao();
	 * 
	 * ArrayList<Recipe> rList = mpDao.selectList(conn, userId); close(conn);
	 * 
	 * return rList;
	 * 
	 * }
	 * 
	 * public ArrayList<Attachment> selectThumbnail(String rId) { Connection conn =
	 * getConnection(); MyPageDao mpDao = new MyPageDao();
	 * 
	 * ArrayList<Attachment> thumnail = mpDao.selectThumbnail(conn, rId);
	 * close(conn);
	 * 
	 * return thumnail;
	 * 
	 * }
	 * 
	 * public int getListCount() { Connection conn = getConnection();
	 * 
	 * int listCount = new MyPageDao().getListCount(conn);
	 * 
	 * close(conn);
	 * 
	 * return listCount;
	 * 
	 * }
	 * 
	 * public ArrayList<Recipe> selectList2(String userId, int currentPage, int
	 * boardLimit) { Connection conn = getConnection();
	 * 
	 * ArrayList<Recipe> list = new MyPageDao().selectList2(conn, userId,
	 * currentPage, boardLimit);
	 * 
	 * close(conn);
	 * 
	 * return list; }
	 */

	public ArrayList<Recipe> selectList(String userId) {

		Connection conn = getConnection();
		MyPageDao mpDao = new MyPageDao();

		ArrayList<Recipe> rList = mpDao.selectList(conn, userId);
		close(conn);

		return rList;

	}

	public Attachment selectThumbnail(String rId) {
		Connection conn = getConnection();
		MyPageDao mpDao = new MyPageDao();

		Attachment thumnail = mpDao.selectThumbnail(conn, rId);
		close(conn);

		return thumnail;

	}

	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new MyPageDao().getListCount(conn);

		close(conn);

		return listCount;

	}

	public int insertProfile(Member m, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();

		MyPageDao mpDao = new MyPageDao();

		int result1 = mpDao.insertPrMember(conn, m);
		int result2 = mpDao.insertAttachment(conn, fileList);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1;
	}

	public Member updateMember(Member m) {

		Connection conn = getConnection();
		Member updateMember = null;

		int result = new MyPageDao().updateMember(conn, m);

		if (result > 0) {
			updateMember = new MyPageDao().selectMember(conn, m.getmId());
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return updateMember;

	}

	public Member updatePwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		Member updateMember = null;
		// 1. 비밀번호 변경
		int result = new MyPageDao().updatePwd(conn, userId, userPwd, newPwd);
		// 2. updateMember select 해오기
		if (result > 0) {
			updateMember = new MyPageDao().selectMember(conn, userId);
			commit(conn);
		} else {
			rollback(conn);
		}

		return updateMember;
	}

	public int deleteMember(String mId) {
		Connection conn = getConnection();

		int result = new MyPageDao().deleteMember(conn, mId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public ArrayList<Recipe> selectList2(String userNo, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		MyPageDao mpDao = new MyPageDao();

		ArrayList<Recipe> mrList = mpDao.selectList2(conn, userNo, currentPage, boardLimit);
		close(conn);

		return mrList;
	}

	public ArrayList<Post> selectBoardList(String userNo, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		MyPageDao mpDao = new MyPageDao();

		ArrayList<Post> selectBoardList = mpDao.selectBoardList(conn, userNo, currentPage, boardLimit);
		close(conn);

		return selectBoardList;
	}

	public ArrayList<Qna> selectQnaList(String userNo, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		MyPageDao mpDao = new MyPageDao();

		ArrayList<Qna> selectQnaList = mpDao.selectQnaList(conn, userNo, currentPage, boardLimit);
		close(conn);

		return selectQnaList;
	}

}
