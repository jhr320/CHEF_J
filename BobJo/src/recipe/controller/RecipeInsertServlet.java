package recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import common.MyFileRenamePolicy;
import recipe.model.service.RecipeService;
import recipe.model.vo.Ingredient;
import recipe.model.vo.Recipe;
import recipe.model.vo.Step;

/**
 * Servlet implementation class RecipeInsertServlet
 */
@WebServlet("/insert.re")
public class RecipeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root + "/resources/recipe_uploadFiles/";
			
			

			MultipartRequest multipartRequest 
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
		
			
			}
		String rName = request.getParameter("rName");
		String rInfo = request.getParameter("rInfo");
		String cateFoId = request.getParameter("cateFoId");
		String cateMethodId = request.getParameter("cateMethodId");
		String cateInId = request.getParameter("cateIndId");
		int rCookTime = Integer.parseInt(request.getParameter("rCookTime"));
		int rCookLevel = Integer.parseInt(request.getParameter("rCookLevel"));
		String rId = request.getParameter("rId");
		String rInName = request.getParameter("rInName");
		String rWeight = request.getParameter("rWeight");
		String sId = request.getParameter("sId");
		int sStep = Integer.parseInt(request.getParameter("sStep"));
		String sDesc = request.getParameter("sDesc");
		
		
		Recipe r = new Recipe();
		r.setrName(rName);
		r.setrInfo(rInfo);
		r.setCateFoId(cateFoId);
		r.setCateMethodId(cateMethodId);
		r.setCateInId(cateInId);
		r.setrCookTime(rCookTime);
		r.setrCookLevel(rCookLevel);
		r.setrId(rId);
		r.setrInName(rInName);
		r.setrWeight(rWeight);
		r.setsId(sId);
		r.setsStep(sStep);
		r.setsDesc(sDesc);
		
		ArrayList<Step> stepList= new ArrayList<>();
		ArrayList<Ingredient> ingredientList = new ArrayList<>();
		
		
		
		int result = new RecipeService().insertRecipe(r, stepList, ingredientList);
		
		if(result > 0) {
			response.sendRedirect("list.re");
		}else {
			
			request.setAttribute("msg", "레시피 등록 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
