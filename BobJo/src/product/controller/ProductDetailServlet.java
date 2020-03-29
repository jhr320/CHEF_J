package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attachment.model.vo.Attachment;
import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/detail.pr")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달받은 상품 번호
		request.setCharacterEncoding("UTF-8");
		String pId = request.getParameter("pId");
		
		ProductService pService = new ProductService();
		Product product = null;
		
		// 1. 게시판 정보 조회
		product = pService.selectProduct(pId);
		
		// 2. 게시판의 이미지 리스트 조회
		ArrayList<Attachment> imgList = pService.selectImages(pId);
		
		Attachment thumbnail = null;
		Attachment productDesc = null;
		Attachment productInfo = null;
		
		for(int i = 0; i<imgList.size(); i++) {
			if(imgList.get(i).getfLevel() == 1) {
				thumbnail = imgList.get(i);
			}else if(imgList.get(i).getfLevel() == 2) {
				productDesc = imgList.get(i);
			}else if(imgList.get(i).getfLevel() == 3) {
				productInfo = imgList.get(i);
			}
		}
		
		if(product != null) {
			request.setAttribute("product", product);
			request.setAttribute("thumbnail", thumbnail);
			/*request.setAttribute("productDesc", productDesc);
			request.setAttribute("productInfo", productInfo);*/
			request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "상품 조회에 실패하였습니다.");
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
