package attachment.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import attachment.dao.AttachmentDao;
import attachment.model.vo.Attachment;
public class AttachmentService {

	public int addFile(ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		int result = 0;
		result =new AttachmentDao().addFile(conn,fileList);
		
		if(result >0)
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
