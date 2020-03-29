package reply.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import reply.model.dao.ReplyDao;
import reply.model.vo.Reply;
public class ReplyService {

	public ArrayList<Reply> selectAll(String nPost, int type) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new ReplyDao().selectAll(conn, nPost, 1);
		close(conn);
		return list;
	}

	public Reply addComment(Reply reply) {
		Connection conn = getConnection();
		Reply addedReply = new ReplyDao().addComment(conn,reply);
		close(conn);
		return addedReply;
	}
	
}
	