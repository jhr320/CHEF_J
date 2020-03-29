package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import attachment.model.vo.Attachment;
import board.model.vo.Board;
import common.vo.PageInfo;
import member.model.vo.Member;
import mypage.model.service.MyPageService;
import post.model.vo.Post;
import qna.model.vo.Qna;

/**
 * Servlet implementation class RecipeListServlet
 */
@WebServlet("/myQnalist.mp")
public class myQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public myQnaListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginUser");

		String userId = "";
		String userNo = "";

		if (m != null) {
			userId = m.getmId();
			userNo = m.getmNo();
		} else {
			request.getRequestDispatcher("views/member/memberLoginForm.jsp").forward(request, response);
		}

		MyPageService mpService = new MyPageService();

		int listCount = mpService.getListCount();

		System.out.println("listCount : " + listCount);

		// 페이지 수 처리용 변수 선언
		int currentPage; // 현재 페이지
		int pageLimit; // 한 페이지 하단에 보여질 페이지 수
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한 페이지 하단에 보여질 시작 페이지
		int endPage; // 한 페이지 하단에 보여질 끝 페이지

		int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 수

		// * currentPage : 현재 페이지
		// 기본적으로 게시판은 1 페이지부터 시작함
		currentPage = 1;

		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 시 해당 페이지를 currentPage로 적용
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// * pageLimit : 한 페이지 하단에 보여질 페이지 수
		pageLimit = 5;

		// * maxPage : 총 페이지의 마지막 수
		// 전체 게시글 수 / 한페이지에 보여질 개수 -> 올림 처리
		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
		// 나의 현재 페이지(currentPage)에서 pageLimit만큼을 나누고 다시 곱한 뒤 1을 더한다
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		// * endPage : 현재 페이지에서 보여질 마지막 페이지 수
		endPage = startPage + pageLimit - 1;

		// 하지만 마지막 페이지 수가 총 페이지 수보다 클 경우
		// 만약 maxPage가 13인데 endPage가 20일수는 없으므로
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 페이지 정보를 공유할 VO 객체 PageInfo 클래스를 만들자~~
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

		ArrayList<Qna> list = mpService.selectQnaList(userNo, currentPage, boardLimit);

		
		
		System.out.println("보드 리스트 : " + list.size());
		System.out.println("userNo" + userNo);

		if (list.size() != 0 && list.size() != 0) {
			request.setAttribute("userNo", userNo);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

			request.getRequestDispatcher("views/myPageUpdate/myQna.jsp").forward(request, response);

		} else {
			request.setAttribute("msg", "게시글 조회에 실패했습니다.");
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
