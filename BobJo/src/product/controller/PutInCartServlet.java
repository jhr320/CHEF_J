package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.model.service.ProductService;
import product.model.vo.Cart;

/**
 * Servlet implementation class PutInCartServlet
 */
@WebServlet("/cart.pr")
public class PutInCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PutInCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 장바구니 담기
		request.setCharacterEncoding("utf-8");
		
		String pId = request.getParameter("pId");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String userId = request.getParameter("userId");
		
		ProductService pService = new ProductService();
		
		Cart ccc = new Cart(pId, quantity, userId);
		
		// 같은 상품 있는지 확인
		Cart same = pService.checkSameProduct(ccc);
		int result = 0;
		if(same != null) {
			// 같은 상품이 있을 때 해당 상품 수량 추가
			result = pService.addQuantity(ccc, same.getQuantity());
			System.out.println("같은 상품 있을 때 : " + result);
		}else {
			// 중복 상품 없을 때 장바구니에 담기
			result = pService.putInCart(ccc);
			System.out.println("같은 상품 없을 때 : " + result);
		}
		
		ArrayList<Cart> cartList = pService.selectCartList(userId);
		int cartSize = 0;
		if(cartList == null) {
			System.out.println("장바구니 없음");
		}else {
			cartSize = cartList.size();
			System.out.println("장바구니 크기 : " + cartSize);
		}
		HttpSession session = request.getSession();
		session.setAttribute("cartSize", cartSize);
		
		if(result > 0) {
			// 장바구니 넣기 성공
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(userId + "님의 장바구니 안 상품ID : " + pId + ", 구매수량 : " + quantity);
			
		}else {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("실패");
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
