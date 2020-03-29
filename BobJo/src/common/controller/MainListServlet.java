package common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attachment.model.vo.Attachment;
import product.model.service.ProductService;
import product.model.vo.Product;
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class MainListServlet
 */
@WebServlet("/main.do")
public class MainListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService pService = new ProductService();
		RecipeService rService = new RecipeService();
		
		
		// 추천 레시피 리스트
		//레시피 세개 가져오기.
		ArrayList<Recipe> rList = rService.selectRecommendR();
		ArrayList<Attachment> r_fList = new ArrayList<Attachment>();
		//System.out.println("서블릿 내에있는 레시피 사진리스트 : " + r_fList);
		for(int i = 0; i < rList.size(); i++) {
			Attachment imgFile = rService.selectThumbnail(rList.get(i).getrId());
			System.out.println("rList의 rid : " + rList.get(i).getrId());
			r_fList.add(imgFile);
			System.out.println("서블릿 내에있는 레시피 사진리스트 : " + r_fList.get(i));
		}
		
				
		// 추천 물건리스트
		// 상품 네개 가져오기
		ArrayList<Product> pList = pService.selectRecommendP();		
		ArrayList<Attachment> p_fList = new ArrayList<Attachment>();
		for(int i = 0; i < pList.size(); i++) {
			Attachment imgFile = pService.selectThumbnail(pList.get(i).getpId());
			p_fList.add(imgFile);
		}
		
		// 할인 물건리스트
		
		
		if(pList != null && p_fList != null && rList != null && r_fList != null) {
			request.setAttribute("pList", pList);
			request.setAttribute("p_fList", p_fList);
			request.setAttribute("rList", rList);
			request.setAttribute("r_fList", r_fList);
			request.getRequestDispatcher("views/common/main.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "메인 조회에 실패했습니다.");
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
