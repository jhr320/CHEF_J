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
import product.model.service.ProductService;
import product.model.vo.Cart;

/**
 * Servlet implementation class OrderPaymentServlet
 */
@WebServlet("/orderPay")
public class OrderPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 결제 성공했을 경우
		 * 1. 장바구니 해당상품 삭제
		 * 2. 주문 db에 저장
		 * 3. order id값 추출
		 * 4. 주문한 만큼 상품 재고 삭제*/
		request.setCharacterEncoding("utf-8");
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int cartSize = (int) request.getSession().getAttribute("cartSize");
		String str = request.getParameter("pids");
		System.out.println("getParameter 확인 : " + str);
		String[] pIdArr = str.split(",");
		
		// 폼에서 넘겨온 정보
		String addr = request.getParameter("addr");			// 배송지
		String rName = request.getParameter("r_name");		// 수령인 이름
		String rPhone = request.getParameter("r_phone");	// 수령인 연락처
		String rPlease = request.getParameter("r_please");	// 배송시 요청사항
		int chong = Integer.parseInt(request.getParameter("chong"));	// 결제 총 금액
		
		ProductService pService = new ProductService();
		
		
		OrderService oService = new OrderService();
		// 2-1. shopping_order(주문번호,주문자(회원고유번호),받는사람 이름,받는사람 연락처,배송지,배송시 요청사항,총 결제금액,주문날짜)
		// -> 주문번호 리턴 가능할까?
		String orderId = "";
		System.out.println("회원고유번호 : " + m.getmNo());
		int r1 = oService.insertOrder(m.getmNo(), rName, rPhone, addr, rPlease, chong);
		System.out.println("insertOrder");
		if(r1 > 0) {
			orderId = oService.selectOrderId(m.getmNo());
			System.out.println("selectOrderId");
		}
		
		System.out.println("주문 번호 : " + orderId);
		// 2-2. 주문번호에 대한 주문 상품 상세 데이터(order_detail)
		/*주문상세고유번호,주문고유번호,상품고유번호,구매수량,(상품별 총)상품금액 */
		// -> 삭제하기 전에 조회해서 가져오던가 해야겟다...
		int result = 0;		// 장바구니 상품 삭제
		int result2 = 0;	// 주문 상세 insert
		int result3 = 0;	// 상품 재고 수정
		ArrayList<Cart> cartList = pService.selectCartList(m.getmId());
		
		for(int i = 0; i < pIdArr.length; i++) {
			for(Cart c : cartList) {
				if(c.getpId().equals(pIdArr[i])) {
					// 장바구니에 있는 상품과 주문하려는 상품이 같은 경우
					result2 = oService.insertDetailOrder(orderId, c.getpId(), c.getQuantity(), c.getpPrice() * c.getQuantity());
					
					//1. 장바구니 해당상품 삭제
					if(result2 > 0) {
						String pId = pIdArr[i];
						result = pService.deleteCart(m.getmId(), pId);
						System.out.println(pId + " 상품 삭제");
						
						ArrayList<Cart> cartList2 = pService.selectCartList(m.getmId());
						
						if(cartList2 != null){
							cartSize = cartList2.size();
						}else {
							cartSize = 0;
						}
					}
					
					// 상품 재고 수정
					//result3 = oService.updateProductStock(c.getpId(), c.getQuantity());
				}
			}
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("orderId", orderId);
		session.setAttribute("cartSize", cartSize);
		request.setAttribute("orderId", orderId);
		request.getRequestDispatcher("views/order/orderSuccessView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
