package recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import recipe.model.dao.RecipeDao;
import recipe.model.service.RecipeService;

/**
 * Servlet implementation class RecipeLikeServlet
 */
@WebServlet("/like.re")
public class RecipeLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String rId = request.getParameter("rId");
		int result = new RecipeService().isLike(rId);
		
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("fail");
		}else {
			out.print("success");
		}*/
		String mId = ((Member)request.getSession().getAttribute("loginUser")).getmId();
		String rId = request.getParameter("rId");
		RecipeService rService = new RecipeService();
		int rLike = rService.updateLike(rId, mId);
		
		System.out.println("좋아요 : " + rLike);
		response.getWriter().print(rLike);
		request.setAttribute("rLike", rLike);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
