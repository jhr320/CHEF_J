package common.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import attachment.model.vo.Attachment;
import attachment.service.AttachmentService;
import common.MyFileRenamePolicy;
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;
import recipe.model.vo.Step;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/upload.image1")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileUpload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		if (ServletFileUpload.isMultipartContent(request)) {

			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "/resources/step_Image/";
			int maxSize = 1024 * 1024 * 10;
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			ArrayList<String> changeFiles = new ArrayList<>();
			// 원본 파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<>();

			// getFileNames() -> form에서 전송 된 파일 리스트들의 name 값을 반환
			Enumeration<String> files = multipartRequest.getFileNames();
			// -> 전송 순서 역순으로 쌓여 있음

			while (files.hasMoreElements()) {
				String name = files.nextElement();

				String regex_step = "\\w*step$";
				String regex_com = "\\w*imgcom$";
				// 파일이 null이 아닌 경우
				if (multipartRequest.getFilesystemName(name) != null) {
					// getFilessystemName() --> 리네임 된 파일명 리턴
					String changeName = multipartRequest.getFilesystemName(name);
					// getOriginFileName() --> 사용자가 업로드한 파일명 리턴
					String originName = name;
					changeFiles.add(changeName);
					originFiles.add(originName);

				}
			}

			String mNo = multipartRequest.getParameter("userID"); // 작성자 userID
			String rName = multipartRequest.getParameter("reciepeTitle"); // 레시피명
			String rInfo = multipartRequest.getParameter("reciepeIntro"); // 요리소개

			String cateFoId = multipartRequest.getParameter("category1"); // 종류별id
			String cateMethodId = multipartRequest.getParameter("category2"); // 방법별id
			String cateInId = multipartRequest.getParameter("category3"); // 재료별id

			// 임시 적용
			String rInNameTemp = multipartRequest.getParameter("inTitle"); // 재료명
			String rWeightTemp = multipartRequest.getParameter("inWeight"); // 용량

			String rInName = rInNameTemp.replace("\"", "");
			String rWeight = rWeightTemp.replace("\"", "");
			// 날짜 자동 생성
			Recipe recipe = new Recipe(mNo.substring(1, mNo.length() - 1), rName.substring(1, rName.length() - 1),
					rInfo.substring(1, rInfo.length() - 1), cateFoId.substring(1, cateFoId.length() - 1),
					cateMethodId.substring(1, cateMethodId.length() - 1), cateInId.substring(1, cateInId.length() - 1),
					rInName, rWeight);
			System.out.println("reciping being added" + recipe);
			String rct = multipartRequest.getParameter("cookInfo");

			int rCookTime = Integer.parseInt(rct.substring(1, rct.length() - 1));
			String rcl = multipartRequest.getParameter("difficulty");

			int rCookLevel = Integer.parseInt(rcl.replace("\"", ""));

			recipe.setrCookLevel(rCookLevel);
			recipe.setrCookTime(rCookTime);

			String rId = new RecipeService().insertRecipe(recipe);

			ArrayList<Step> stepList = new ArrayList<Step>();

			if (!rId.equals("") || !rId.isEmpty()) {
				System.out.println("스탭을 추가해요!");
				String step_text_temp = multipartRequest.getParameter("step_text");
				String step_text = step_text_temp.substring(1, step_text_temp.length() - 1);

				String[] temp = step_text.split(",");
				int i2 = 0;

				for (String string : temp) {
					Step step = new Step();
					step.setrId(rId);
					step.setsStep(i2++);
					step.setsDesc(string.substring(1, string.length() - 1));
					stepList.add(step);
				}

				String sId = "";
				sId = new RecipeService().insertStep(stepList);

				if (sId.equals("") || sId.isEmpty()) {
					new RecipeService().deleteRecipe(rId);
				}
				/////////////////////////
				else {

					ArrayList<Attachment> fileList = new ArrayList<>();
					// 전송 순서 역순으로 파일이 저장되어 있으므로 반복문을 역으로 수행하기
					for (int i = originFiles.size() - 1; i >= 0; i--) {
						Attachment at = new Attachment();
						at.setfPath(savePath);
						// 진짜 이름
						at.setfName(originFiles.get(i));
						// change Name
						at.setChangeName(changeFiles.get(i));
						at.setBtype(3);
						at.setBprcId(rId);

						fileList.add(at);
					}

					// 7. 사진 게시판 작성용 비즈니스 로직을 처리할 서비스 요청

					int result = new AttachmentService().addFile(fileList);

					if (result > 0) {
						/* response.sendRedirect(request.getContextPath()); */
						request.getRequestDispatcher("/main.do").forward(request, response);

					} else {
						// 실패 시 저장 된 사진 삭제
						
							for (int i = 0; i < changeFiles.size(); i++) {
								// 파일 시스템에 저장 된 이름으로 파일 객체 생성함
								File failedFile = new File(savePath + changeFiles.get(i));
								failedFile.delete();
							}
							if (!sId.equals("") || !sId.isEmpty()) {
								new RecipeService().deletetStep(sId);
							}
							if (!rId.equals("") || !rId.isEmpty()) {
								new RecipeService().deleteRecipe(rId);
							}
						
						request.setAttribute("msg", "레시피 등록 실패!!");
						request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

					}
				}
				/////////////////////////

			}
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
