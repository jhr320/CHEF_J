package recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attachment.model.vo.Attachment;
import member.model.vo.Member;
import recipe.model.service.RecipeService;
import recipe.model.vo.PageInfo;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class BestRecipeListServlet
 */
@WebServlet("/bestList.re")
public class BestRecipeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestRecipeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RecipeService rService = new RecipeService();

		int listCount = rService.getListCountWhole();

		System.out.println("listCount : " + listCount);

		// 페이징

		int currentPage; // 현재 페이지
		int pageLimit; // 한 페이지 하단에 보여질 페이지 수
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한 페이지 하단에 보여질 시작 페이지
		int endPage; // 한 페이지 하단에 보여질 끝 페이지

		int boardLimit = 16; // 한 페이지에 보여질 게시글 최대 수

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

		ArrayList<Recipe> reList = rService.selectListBest(currentPage, boardLimit);

		ArrayList<Attachment> fList = new ArrayList<Attachment>();

		for (int i = 0; i < reList.size(); i++) {

			Attachment imgFile = rService.selectThumbnail(reList.get(i).getrId());
			fList.add(imgFile);
		}

		ArrayList<String> L_rId = null;

		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		if (loginUser != null) {
			String mNo = loginUser.getmNo(); // 특정 유저가 좋아요 누른 레시피
			L_rId = rService.selectLikeList(mNo);
		}

		System.out.println("첨부파일리스트 : " + fList.size());
		System.out.println("레시피 전체 리스트 : " + reList.size());
		System.out.println("좋아요레시피리스트 : " + L_rId);

		
		/* if (rList.size() != 0 && fList.size() !=0 ) { */
		if (reList.size() != 0 && fList.size() != 0) {
			request.setAttribute("reList", reList);
			/* request.setAttribute("nation", nation); */
			request.setAttribute("fList", fList);
			// **좋아요데이터도 장착,,
			request.setAttribute("L_rId", L_rId);
			request.setAttribute("pi", pi);
			request.getRequestDispatcher("views/recipe/bestRecipeListView.jsp").forward(request, response);
		

		} else {
			request.setAttribute("msg", "레시피 조회에 실패하였습니다.");
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
