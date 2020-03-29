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
import order.model.service.OrderService;
import order.model.vo.Order;
import order.model.vo.OrderDetail;

/**
 * Servlet implementation class MyOrderListServlet
 */
@WebServlet("/myOrder")
public class MyOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주문 완료 후 주문 조회 버튼 클릭 시 마이페이지 내 주문 리스트로 이동
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		// 로그인 유저의 주문 조회
		OrderService oService = new OrderService();
		String mNo = m.getmNo();
		ArrayList<OrderDetail> oList = oService.selectMyOrder(mNo);

		request.setAttribute("oList", oList);
		request.getRequestDispatcher("views/myPageUpdate/myOrder.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
