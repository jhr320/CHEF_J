package post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.model.vo.Post;
import post.service.PostService;

/**
 * Servlet implementation class PostEditedServlet
 */
@WebServlet("/post.edited")
public class PostEditedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostEditedServlet() {
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
		int type = Integer.parseInt(request.getParameter("typeOfBoard"));
		String pId = (String) request.getParameter("pId");
		String pCotent = (String) request.getParameter("quillData");
		String title = request.getParameter("display_title");
		String writer = (String) request.getParameter("writer");
		Post post = new Post();
		
		System.out.println(pId + "from servlet");
		System.out.println(writer + "from servlet" );
		post.setpTitle(title);
		post.setpId(pId);
		post.setpCotent(pCotent);
		post.setpType(type);
		post.setpWriter(writer);
	
		int result = new PostService().postEdit(post);
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
