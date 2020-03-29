package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import board.model.service.BoardService;
import qna.model.service.QnaService;
import qna.model.vo.Qna;


/**
 * Servlet implementation class AnswerInsertServlet
 */
@WebServlet("/insert.answer")
public class AnswerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qId = request.getParameter("qId");
		String aContent = request.getParameter("aContent");
		
		// 답변여부 update시키기.
		// 예를들어 q1 댓글리스트 전부 가져오기. 작성일도 가져와야해서 list<Qna>로 가져오는게 맞음.
		Qna a = new QnaService().insertAnswer(qId, aContent);
		// 댓글을 insert 해주고 갱신 된 댓글 리스트를 다시 불러오기 위해
		// ArrayList로 리턴 받는다.
		
		// 리스트를 클라이언트로 보내줄 때 간편한 Gson을 이용해서 보내주자
		response.setContentType("application/json; charset=utf-8"); 
		
		// Gson으로 값을 보내게 되면 Date 형식이 바뀌어서 출력 되는 것을 확인할 수 있다.
		// 따라서 Gson 생성 시 Date 포맷을 원하고자 하는 포맷으로 바꿔서 생성해보자.
		/*Gson gson = new Gson();*/
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(a, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
