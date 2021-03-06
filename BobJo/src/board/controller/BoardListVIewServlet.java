package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import common.vo.PageInfo;
import post.model.vo.Post;

/**
 * Servlet implementation class BoardListVIew
 */
@WebServlet("/board.list")
public class BoardListVIewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListVIewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		BoardService bService = new BoardService();
		
		
		int typeNum = 0;
	
		//
		int currentPage =1;	
		// 한 페이지 하단에 보여질 페이지 수
		int pageLimit;
		// 전체 페이지에서 가장 마지막 페이지
		int maxPage;	
		// 하단 숫자
		int startPage;	
		// 리스트 끝
		int endPage;	
		
		//게시글 최대치
		int boardLimit = 10; 

		if(request.getParameter("currentPage") != null) {
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			typeNum = Integer.parseInt(request.getParameter("typeOfBoard"));
		}
		int listCount = bService.getListCount(typeNum);
	
		pageLimit =5;

		
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
	
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
	
		System.out.println("typenum: "+ typeNum);
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<Post> list = bService.boardSelectAll(currentPage,boardLimit ,typeNum);
		
		RequestDispatcher view = request.getRequestDispatcher("views/board/boardView.jsp?type="+typeNum);
		request.setAttribute("typeNum",typeNum);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		view.forward(request, response);		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
