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
 * Servlet implementation class deleteMemberServlet
 */
@WebServlet("/delete2.me")
public class deleteMemberServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteMemberServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		int result = new MyPageService().deleteMember(m.getmId());
		
		if(result > 0) {
			HttpSession session = request.getSession();
			
			session.removeAttribute("loginUser"); // 로그인 세션 정보 삭제
			
			session.setAttribute("msg", "회원 탈퇴가 완료되었습니다. 그동안 chef J를 이용해 주셔서 감사합니다.");
			response.sendRedirect(request.getContextPath());
			
		}else {
			request.setAttribute("msg", "회원 탈퇴에 실패하였습니다.");
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
