package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dao.MemberDao;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout.me")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String mNo = loginUser.getmNo();
		int result = new MemberService().updateOutDate(mNo); 
		
		if(result>0) {
			System.out.println("로그아웃 완료");
			
		}else {
			System.out.println("로그아웃 데이터 저장 실패");
		}
		// session에 저장된 값들을 지움 -> 로그인 되어 있던 회원의 정보를 없애 로그아웃 시킴
		request.getSession().invalidate(); // 해당 세션 만료
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
