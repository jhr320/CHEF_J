package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import product.model.service.ProductService;
import product.model.vo.Cart;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId= request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 세션에 넣어야하기때문에 Member로 받음
		Member loginUser = new MemberService().loginMember(userId, userPwd);  
		System.out.println(loginUser);
		if(loginUser != null) {
			// 로그인 성공
			//세션에 유저 담기위한 세션 선언
			HttpSession session = request.getSession();
			
//			session.setMaxInactiveInterval(interval); 로그인 후 10분 뒤 자동로그아웃
			session.setAttribute("loginUser", loginUser);
			System.out.println(loginUser);
			
			ProductService pService = new ProductService();
			ArrayList<Cart> cartList = pService.selectCartList(userId);
			
			int cartSize = 0;
			if(cartList == null) {
				System.out.println("장바구니 없음");
			}else {
				cartSize = cartList.size();
				System.out.println("장바구니 크기 : " + cartSize);
			}
			session.setAttribute("cartSize", cartSize);
			
			// 로그인 완료 후 메인페이지로
			response.sendRedirect(request.getContextPath());
			
		}else {
			System.out.println("로그인 실패");
			request.getSession().setAttribute("loginFailMsg",  "아이디 또는 비밀번호를 잘못입력하셨습니다.");
			response.sendRedirect(request.getContextPath()+"/views/member/memberLoginForm.jsp");
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
