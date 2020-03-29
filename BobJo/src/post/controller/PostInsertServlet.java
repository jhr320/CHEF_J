package post.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import post.model.vo.Post;
import post.service.PostService;

/**
 * Servlet implementation class PostInsertServlet
 */
@WebServlet("/post.insert")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pCotent = (String) request.getParameter("quillData");
		String writer = (String) request.getParameter("writer");
		int type = Integer.parseInt(request.getParameter("type"));
		String title = request.getParameter("display_title");
		
		Post post = 
				new Post("null",type,title,
						pCotent,writer,new Date(System.currentTimeMillis())
						,0,0,"n");
		
		int result = new PostService().postInsert(post);
		String url = "board.list?currentPage=1&typeOfBoard="+type;
		if (result > 0) {
			response.sendRedirect(url);
		} else {
			request.setAttribute("msg", "실패하였습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
