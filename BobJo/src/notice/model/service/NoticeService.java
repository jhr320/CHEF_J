package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import qna.model.dao.QnaDao;
import qna.model.vo.Qna;

public class NoticeService {

	public ArrayList<Notice> selectNoticeList(int currentPage, int boardLimit) {
		Connection conn  = getConnection();
		
		 ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, currentPage, boardLimit);

		close(conn);
		 return list;
	}
	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new NoticeDao().getListCount(conn);

		close(conn);

		return listCount;
	}
	
	public Notice selectNotice(String nId) {
		Connection conn = getConnection();
		
		// 1. 조회수 증가(업데이트)
		int result = new NoticeDao().increaseCount(conn, nId);
		
		Notice n = null;
		if(result > 0) {
			// 2. 공지사항 글 조회
			n = new NoticeDao().selectNotice(conn, nId);
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		close(conn);
		
		return n;	
	}

	public int insertNotice(Notice n) {
	Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public int updateNotice(Notice n) {
		Connection conn = getConnection();

		int result = new NoticeDao().updateNotice(conn, n);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	//////////////////////////////////////////////////////////////////////////////
	/*
	// 조회수 증가없이 공지사항 선택(수정용)
	public Notice selectNotice2(int nno) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn,  nno);
		
		close(conn);
		return n;
	}

	public int noticeDelete(int nno) {
		Connection conn = getConnection();
		int result = new NoticeDao().noticeDelete(conn, nno);
		
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 공지사항 수정 메소드
	// 상세뷰에 뿌릴 n을 셀렉트해서 가져와야 하지 않을지
	public int noticeUpdate(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().noticeUpdate(conn, n); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Notice> searchNotice(String searchCondition, String search) {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().searchNotice(conn, searchCondition, search);
		
		close(conn);
		return list;
	}*/






}
