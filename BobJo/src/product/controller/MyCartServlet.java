package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.Cart;

/**
 * Servlet implementation class MyCartServlet
 */
@WebServlet("/myCart")
public class MyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유저의 장바구니 페이지 이동
		Member m = (Member)request.getSession().getAttribute("loginUser");
		String userId = "";
		if(m != null) {
			userId = m.getmId();
			
			ProductService pService = new ProductService();
			
			// 해당 유저의 아이디의 장바구니 상품들을 가져와 ArrayList에 담기
			ArrayList<Cart> cartList = pService.selectCartList(userId);
			
			request.setAttribute("cartList", cartList);
			request.getRequestDispatcher("views/product/cartListView.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("views/member/memberLoginForm.jsp").forward(request, response);
		}
		
		
		
		/*if(cartList.size() != 0) {
			request.setAttribute("cartList", cartList);
			request.getRequestDispatcher("views/product/cartListView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "장바구니 리스트 조회 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
