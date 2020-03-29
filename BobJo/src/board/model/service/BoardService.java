package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import notice.model.vo.Notice;
import post.model.vo.Post;
public class BoardService {

	public ArrayList<Post> boardSelectAll(int currentPage, int boardLimit, int typeNum) {
		Connection conn  = getConnection();
		
		 ArrayList<Post> list = new BoardDao().selectList(conn,currentPage, boardLimit, typeNum);
		close(conn);
		 return list;
	}

	public int getListCount(int type) {
		Connection conn = getConnection();

		int listCount = new BoardDao().getListCount(conn, type);

		close(conn);

		return listCount;
	}

	public ArrayList<Notice> selectNoticeList(int currentPage, int boardLimit, int typeNum) {
		Connection conn  = getConnection();
		
		 ArrayList<Notice> list = new BoardDao().selectNoticeList(conn,currentPage, boardLimit, typeNum);
		close(conn);
		 return list;
	}

	
	
}
