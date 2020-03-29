package order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.Cart;

/**
 * Servlet implementation class OrderSheetServlet
 */
@WebServlet("/ordersheet")
public class OrderSheetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSheetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주문서(장바구니 페이지에서 주문하기 버튼을 눌렀을 때)
		/* 장바구니 페이지에서 가져올것
		 * 1. 상품 정보 리스트
		 * 2. 로그인 유저(아마 세션에서 가져올듯)
		 */
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String userId = "";
		if(m != null) {
			userId = m.getmId();
		}else {
			request.getRequestDispatcher("views/member/memberLoginForm.jsp").forward(request, response);
		}
		
		// 체크된 상품의 상품ID
		String str = request.getParameter("pids");
		//System.out.println("테스트 : " + str);
		String[] pIdArr = str.split(",");
		
		ProductService pService = new ProductService();
		
		ArrayList<Cart> cartList = pService.selectCartList(userId);
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("pIdArr", pIdArr);
		request.setAttribute("pids", str);
		request.getRequestDispatcher("views/order/orderSheetView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
