import java.util.ArrayList;

import reply.model.service.ReplyService;
import reply.model.vo.Reply;

public class TestDatabase {

	public static void main(String[] args) {
		ArrayList<Reply> list = new ReplyService().selectAll("testPost",1);
		System.out.println(list);

	}

}
