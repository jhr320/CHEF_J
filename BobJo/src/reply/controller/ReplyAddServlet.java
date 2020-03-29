package reply.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import reply.model.service.ReplyService;
import reply.model.vo.Reply;

/**
 * Servlet implementation class ReplyAddServlet
 */
@WebServlet("/reply.add")
public class ReplyAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String quill = request.getParameter("quillDAO");
		String writer = request.getParameter("writer");
		String pId = request.getParameter("pId");
		String name = request.getParameter("name");
		Reply reply = new Reply();
		reply.setbType(Integer.parseInt(type));
		reply.setContent(quill);
		reply.setWriterId(writer);
		reply.setBoard_Id(pId);
		reply.setName(name);
		
		Reply addedReply = new ReplyService().addComment(reply);
		SimpleDateFormat simple =  new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(addedReply);
		if(addedReply !=null)
		{	response.setContentType("application/json;charset = utf-8");
			PrintWriter out = response.getWriter();	
			JSONObject obj = new JSONObject();
			obj.put("name",		addedReply.getName());
			String mydate = simple.format(addedReply.getWrittenDate());
			obj.put("content",	addedReply.getContent()	);
			obj.put("date",	mydate);
			out.print(obj);
			//out.flush();
		
		}
		else
		{
			
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
