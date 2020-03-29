package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import qna.model.dao.QnaDao;
import qna.model.vo.Qna;

public class QnaService {

	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new QnaDao().getListCount(conn);

		close(conn);

		return listCount;
	}

	public int getListCount(String mId) {
		Connection conn = getConnection();

		int listCount = new QnaDao().getListCount(conn, mId);

		close(conn);

		return listCount;
	}
	public ArrayList<Qna> selectQnaList(int currentPage, int boardLimit) {
		Connection conn  = getConnection();
		
		 ArrayList<Qna> list = new QnaDao().selectQnaList(conn, currentPage, boardLimit);

		close(conn);
		 return list;
	}

	public Qna selectQna(String qId) {
		Connection conn = getConnection();
		
		Qna q = new QnaDao().selectQna(conn, qId);
		
		close(conn);
		
		return q;	
	}

	public int insertQna(Qna q) {
		Connection conn = getConnection();
		
		int result = new QnaDao().insertQna(conn, q);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Qna> selectQnaList(int currentPage, int boardLimit, String mId) {
		Connection conn  = getConnection();
		
		 ArrayList<Qna> list = new QnaDao().selectQnaList(conn, currentPage, boardLimit, mId);

		close(conn);
		 return list;
	}

	public Qna insertAnswer(String qId, String aContent) {
		Connection conn = getConnection();
		Qna a = null;
		QnaDao qDao = new QnaDao();
		
		// 1. 답변넣기
		int result = qDao.insertAnswer(conn, qId, aContent);
		
		
		if(result > 0) {
			System.out.println("1. 답변 삽입 완료");
			commit(conn);

			// 2. 답변여부 N->Y 업데이트
			int result2 = qDao.updateAnswerStatus(conn, qId);
			if(result2 > 0) {
				System.out.println("2. N->Y 업데이트완료");
				commit(conn);
				// 3. 삽입한 댓글 적용된 리스트 가져오기.
				a = qDao.selectAnswerList(conn, qId);
				System.out.println("3. 가져온 a데이터 : " + a);
			}else {
				rollback(conn);
			}
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return a;
	}


}
