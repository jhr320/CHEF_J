package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attachment.model.vo.Attachment;
import common.vo.PageInfo;
import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/list.pr")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cate = request.getParameter("cate");

		String cateStr = "";
		switch (cate) {
		case "1":
			cateStr = "채소";
			break;
		case "2":
			cateStr = "과일";
			break;
		case "3":
			cateStr = "견과, 쌀";
			break;
		case "4":
			cateStr = "수산, 해산";
			break;
		case "5":
			cateStr = "건어물";
			break;
		case "6":
			cateStr = "정육";
			break;
		case "7":
			cateStr = "계란, 유제품";
			break;
		case "8":
			cateStr = "면, 양념, 오일";
			break;

		}

		ProductService pService = new ProductService();

		int listCount = pService.getListCount(cate);

		System.out.println("listCount : " + listCount);

		// 페이지 수 처리용 변수 선언
		int currentPage; // 현재 페이지
		int pageLimit; // 한 페이지 하단에 보여질 페이지 수
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한 페이지 하단에 보여질 시작 페이지
		int endPage; // 한 페이지 하단에 보여질 끝 페이지

		int boardLimit = 12; // 한 페이지에 보여질 게시글 최대 수

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

		// 1. 상품 리스트 조회
		//ArrayList<Product> pList = pService.selectList(cate);
		// ** 페이징 있는 상품 리스트 조회
		ArrayList<Product> pList = pService.selectList(cate, currentPage, boardLimit);

		ArrayList<Attachment> fList = new ArrayList<Attachment>();

		for (int i = 0; i < pList.size(); i++) {
			Attachment imgFile = pService.selectThumbnail(pList.get(i).getpId());
			fList.add(imgFile);
		}
		
		if (pList.size() != 0 && fList.size() != 0) {
			request.setAttribute("pList", pList);
			request.setAttribute("cate", cate);
			request.setAttribute("cateStr", cateStr);
			request.setAttribute("fList", fList);
			request.setAttribute("pi", pi);
			request.getRequestDispatcher("views/product/productListView.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "상품리스트 조회 실패!!");
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
