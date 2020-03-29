package post.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.model.vo.Post;
import post.service.PostService;
import reply.model.service.ReplyService;
import reply.model.vo.Reply;

/**
 * Servlet implementation class PostViewServlet
 */
@WebServlet("/post.view")
public class PostSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		String nPost = request.getParameter("pId");
		int type = Integer.parseInt(request.getParameter("typeOfBoard"));
		PostService ps = new PostService();
		// 조회수 +1
		ps.increaseCount(nPost);
		// 불러오기
		Post post = ps.postSelect(nPost);
		//ArrayList<Reply> listcomment = new ReplyService().selectAll(nPost , 1);
		ArrayList<Reply> listcomment = new ReplyService().selectAll(nPost , type);

		SimpleDateFormat sdf =new SimpleDateFormat("");
		
		if(post !=null)
		{	
			request.setAttribute("post", post);
			request.setAttribute("commentList", listcomment);
			request.getRequestDispatcher("views/post/postView.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "게시물이 없습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
