package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import mypage.model.service.MyPageService;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/update.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Member mem = (Member) session.getAttribute("loginUser");

		/*
		 * String userId = ""; String userName = ""; String email = ""; String phone =
		 * ""; String address1 = ""; String userPwd = "";
		 */

		
		String userId=request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address1 = request.getParameter("roadFullAddr");
		String address2 = request.getParameter("addrDetail");
		String gender = request.getParameter("gender");
		String birth_year = request.getParameter("birth_year");
		String[] birth = request.getParameterValues("birth[]");
		String test1 = request.getParameter("test1");
		

		
		
		String birthday = birth_year + birth[0] + birth[1];
		
		System.out.println(birthday);
		System.out.println(address1);
		System.out.println(address2);

		
		String address = address1 + "," + address2;

	
	
		Member m = new Member(userId, userPwd, userName, email, phone, address, gender, birthday);

		Member updateMember = new MyPageService().updateMember(m);

	

		if (updateMember != null) {
			request.getSession().setAttribute("msg", "회원 정보를 성공적으로 수정했습니다.");
			request.getSession().setAttribute("loginUser", updateMember);

			request.getRequestDispatcher("views/myPageUpdate/updateMember.jsp").forward(request, response);
		}

		else {
			request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
