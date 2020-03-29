package reply.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import reply.model.vo.Reply;

public class ReplyDao {
	private Properties prop = null;

	public ArrayList<Reply> selectAll(Connection conn, String nPost, int type) {
		prop = new Properties();
		ArrayList<Reply> list = new ArrayList<Reply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("you are here");
		try {
			String sql = "";
			System.out.println(nPost + " " + type);
			sql = "SELECT * FROM reply where BR_ID = ? AND BTYPE = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nPost);
			pstmt.setInt(2, type);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				String cid = rset.getString("c_ID");
				int btye = rset.getInt("btype");
				String brid = rset.getString("br_id");
				String mno = rset.getString("m_no");
				String content = rset.getString("c_content");
				Date date = rset.getDate("c_date");
				String status = rset.getString("c_status");
				String m_name = rset.getString("m_name");
				Reply comment = new Reply(cid, btye, brid, mno, content, date, status, m_name);
			
				list.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println("returning: " + list.size());
		return list;
	}

	public Reply addComment(Connection conn, Reply r) {
		Reply added = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = 
				"INSERT INTO reply(C_ID, btype , br_id , m_no ,c_content , c_date , c_status , M_NAME,R_NUM)"+ 
				"VALUES('C'||SEQ_REPLY.nextval,?, ?, ?,?,sysdate,'Y',?,  SEQ_REPLY_NUM.nextval)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getbType());
			pstmt.setString(2, r.getBoard_Id());
			pstmt.setString(3, r.getWriterId());
			pstmt.setString(4, r.getContent());
			pstmt.setString(5, r.getName());
			result = pstmt.executeUpdate();
			if(result>0)
			{
				sql = "SELECT 'C'||SEQ_REPLY.currval from dual";
				close(pstmt);
				pstmt = conn.prepareStatement(sql);
				
				
				rset = pstmt.executeQuery();
				String str = "";
				if(rset.next())
				{
					str = rset.getString(1);
					System.out.println(str + "currval is this");
				}
				
				sql = "SELECT * FROM REPLY WHERE C_ID =  ?";
				close(pstmt);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, str);
				close(rset);
				rset = pstmt.executeQuery();
				if(rset.next())
				{
					added = new Reply();
					added.setcId(rset.getString("C_ID"));
					added.setWrittenDate(rset.getDate("C_DATE"));
					added.setbType(rset.getInt("BTYPE"));
					added.setContent(rset.getString("C_CONTENT"));
					added.setWriterId(rset.getString("M_NO"));
					added.setBoard_Id(rset.getString("BR_ID"));
					added.setName(rset.getString("M_NAME"));
				}
				System.out.println("added is " + added);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return added;
	}
}
