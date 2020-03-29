package post.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import post.dao.PostDao;
import post.model.vo.Post;
public class PostService {

	public Post postSelect(String nPost) {
		Connection conn = getConnection();
		Post p = new PostDao().postSelect(conn,nPost);
		close(conn);
		return p;
	}

	public int postEdit(Post p) {
		Connection conn = getConnection();
		int result =  new PostDao().postEdit(conn,p);
		if(result>0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int postDelete(String nPost) {
		Connection conn = getConnection();
		int result =  new PostDao().postDelete(conn,nPost);
		if(result>0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int postInsert(Post p) {
		Connection conn = getConnection();
		int result=  new PostDao().postInsert(conn,p);
		if(result>0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int increaseCount(String string) {
		Connection conn = getConnection();
		int result=  new PostDao().increaseCount(conn,string);
		if(result>0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	public int increaseLikeCount(String string) {
		Connection conn = getConnection();
		int result=  new PostDao().increaseLikeCount(conn,string);
		if(result>0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

}
