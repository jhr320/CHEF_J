package qna.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class QnaDetailServlet
 */
@WebServlet("/detail.qna")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String qId = request.getParameter("qId");
		QnaService qs = new QnaService();
		
		
		// 불러오기
		// 게시글
		Qna qna = qs.selectQna(qId);
		 
		 // 답변 여러개
		SimpleDateFormat sdf =new SimpleDateFormat("");
		
		//ArrayList<Reply> listcomment = new ReplyService().selectAll("testPost" , 1);
		
		if(qna !=null)
		{	
			request.setAttribute("qna", qna);
			request.getRequestDispatcher("views/qna/qnaDetail.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "문의내역 세부사항 확인 오류");
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
