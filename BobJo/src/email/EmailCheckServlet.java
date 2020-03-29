package email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import member.model.service.MemberService;

/**
 * Servlet implementation class test
 */
@WebServlet("/email.me")
public class EmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmailCheckServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// db에 해당 이메일이 있는지 확인
		String email = request.getParameter("email");
		System.out.println(email);
		int result = new MemberService().checkMemberEmail(email);
		
		String keynum = request.getParameter("keynum");
		System.out.println("서블릿서블릿: " + keynum);
		// 2. ajax를 이용한 중복체크
		//PrintWriter out = response.getWriter();
		
		if (result > 0) {
			System.out.println(result);
			// 중복된 이메일이 있어 인증안됨
			
			//request.setAttribute("msg", "이미 있는 이메일주소입니다.");
			//out.print("fail");
			//gson.toJson(rlist, response.getWriter());
			
			response.setContentType("application/json; charset=utf-8");
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson("이미 있는 이메일주소입니다.", response.getWriter());
		} else {
			response.setContentType("application/json; charset=utf-8"); 
			// 이메일 중복확인 완료시

			// mail server 설정
			String host = "smtp.naver.com";
			String user = "rlawlgus0420@naver.com"; // 자신의 네이버 계정
			String password = "sydghkT{!@7}";// 자신의 네이버 패스워드

			// 메일 받을 주소
			String to_email = "rlawlgus0420@naver.com";

			// SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");

			// 이게무슨.. 용도일까...
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "Chef J"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("Chef J 회원가입 인증메일입니다.");
				// 메일 내용
				msg.setText("안녕하세요, ChefJ 입니다. 이메일 인증 번호는 " + keynum + "입니다.");

				Transport.send(msg);
				System.out.println("이메일 전송");

			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}

			// 세션에 인증키 저장
			response.setContentType("application/json; charset=utf-8");
			System.out.println("테스트1(서블릿내부) : " + keynum);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson("success", response.getWriter());

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