package notice.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/detail.no")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nId = request.getParameter("nId");
		NoticeService ns = new NoticeService();
		
		
		// 불러오기
		// 게시글
		Notice n = ns.selectNotice(nId);
		System.out.println(n); 
		
		SimpleDateFormat sdf =new SimpleDateFormat("");
		
		if(n !=null)
		{	
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/notice/noticeDetail.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "공지사항 세부사항 확인 오류");
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
