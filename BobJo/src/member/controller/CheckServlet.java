package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class CheckServlet
 */
@WebServlet("/Check.me")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String phone = request.getParameter("phone");
		//	번호에 따라 아이디 중복확인, 핸드폰 번호 중복확인 할 것 일단은 아이디만 해보기
		String userId = request.getParameter("userId");
		
		if(code.equals("1")) {
			int result = new MemberService().idCheck(userId);
			//아이디중복
			
			
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.print("fail");
			}else {
				out.print("success");
			}
			
			
		}else {
			int result = new MemberService().phoneCheck(phone);
			
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.print("fail");
			}else {
				out.print("success");
			}
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
