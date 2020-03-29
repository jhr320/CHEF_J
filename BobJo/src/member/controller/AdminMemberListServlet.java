package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.vo.PageInfo;
import member.model.service.MemberService;
import member.model.vo.Member;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import order.model.service.OrderService;
import order.model.vo.Order;

/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/memberList.admin")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		// 서비스 선언
		MemberService mService = new MemberService();
		OrderService oService = new OrderService();
		
		
				// 1_2. 페이징 처리 추가
				// 페이지 수 처리용 변수 선언
				// * currentPage : 현재 페이지
				// 기본적으로 게시판은 1 페이지부터 시작함
				int currentPage = 1;	
				
				// 한 페이지 하단에 보여질 페이지 수
				// * pageLimit : 한 페이지 하단에 보여질 페이지 수
				int pageLimit;
				
				// 전체 페이지에서 가장 마지막 페이지
				// * maxPage : 총 페이지의 마지막 수
				int maxPage;
				
				// 한 페이지 하단에 보여질 시작 페이지
				int startPage;
				
				// 한 페이지 하단에 보여질 끝 페이지
				int endPage;	
				
				// 한 페이지에 보여질 게시글 최대 수
				int boardLimit = 10; 
				
				// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 시 해당 페이지를 currentPage로 적용
				if(request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
					
				}
				
				// 리스트 갯수 파악
				int listCount = mService.getListCount();
				
				System.out.println("현재페이지: " + currentPage);
				pageLimit = 10;
				
				// * maxPage : 총 페이지의 마지막 수
				// 글 개수가 105개이면 페이지 수는 10개가 아닌 짜투리 5개까지 한 페이지로 쳐서 11페이지
				// 전체 게시글 수 / 한페이지에 보여질 개수 -> 올림 처리
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				
				// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
				// 나의 현재 페이지(currentPage)에서 pageLimit만큼을 나누고 다시 곱한 뒤 1을 더한다
				// 1 / 10 * 10 + 1 -> 1
				// 5 / 10 * 10 + 1 -> 1
				// 11 / 10 * 10 + 1 -> 11
				// 15 / 10 * 10 + 1 -> 11
				// 여기서 한 가지 예외 상황은 10(20, 30, ...)
				// 10 / 10 * 10 + 1 -> 11
				// 그것을 막기 위해 currentPage - 1을 한다
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
				// * endPage : 현재 페이지에서 보여질 마지막 페이지 수
				endPage = startPage + pageLimit - 1;
				
				// 하지만 마지막 페이지 수가 총 페이지 수보다 클 경우
				// 만약 maxPage가 13인데 endPage가 20일수는 없으므로
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				// 페이지 정보를 공유할 VO 객체 PageInfo 클래스를 만들자~~
				PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
				
				// // 멤버리스트 가져오기
				ArrayList<Member> list = mService.selectMemberList(currentPage, boardLimit);

				// 주문리스트 가져오기
				//ArrayList<Order> olist = oService.SelectOrderList(currentPage, boardLimit);
				
				System.out.println("시작2 : " + currentPage);

			
				RequestDispatcher view = request.getRequestDispatcher("views/admin/memberAdmin.jsp");
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
