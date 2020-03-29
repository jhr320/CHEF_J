package order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/selectOrder.me")
public class OrderMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//접속자 아이디
		String mNo = request.getParameter("mNo");
		
		ArrayList<Order> list = new OrderService().selectOrderList(mNo);
		//	번호에 따라 아이디 중복확인, 핸드폰 번호 중복확인 할 것 일단은 아이디만 해보기
		System.out.println(list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/qna/qnaInsert.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
