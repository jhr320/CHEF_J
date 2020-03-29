package mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import attachment.model.vo.Attachment;
import common.MyFileRenamePolicy;
import member.model.service.MemberService;
import member.model.vo.Member;
import mypage.model.service.MyPageService;

/**
 * Servlet implementation class InsertProfileServlet
 */
@WebServlet("/insert.pr")
public class InsertProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertProfileServlet() {
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
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		
		

		if (member != null) {
		} else {
			request.getRequestDispatcher("views/member/memberLoginForm.jsp").forward(request, response);
		}
		MyPageService mpService = new MyPageService();

		
		
		
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "/resources/profile/";
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			/* ArrayList<String> changeFiles = new ArrayList<>(); */
			/*
			 * ArrayList<String> changeFiles = new ArrayList<>(); ArrayList<String>
			 * originFiles = new ArrayList<>();
			 */
			
			ArrayList<String> changeFiles = new ArrayList<>();
			// 원본 파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<>();

			Enumeration<String> files = multipartRequest.getFileNames();

			while (files.hasMoreElements()) {
				String name = files.nextElement();

				if (multipartRequest.getFilesystemName(name) != null) {
					// getFilessystemName() --> 리네임 된 파일명 리턴
					String changeName = multipartRequest.getFilesystemName(name);
					// getOriginFileName() --> 사용자가 업로드한 파일명 리턴
					String originName = multipartRequest.getOriginalFileName(name);
					
					changeFiles.add(changeName);
					originFiles.add(originName);

				
				}

			}
			String bprcId = member.getmId();
			String nickname = multipartRequest.getParameter("nickname");
			String mIntro = multipartRequest.getParameter("mIntro");
			/* String mId = multipartRequest.getParameter("mId"); */
			member.setNickname(nickname);
			member.setmIntro(mIntro);
			
			
	
					
			
			

			ArrayList<Attachment> fileList = new ArrayList<>();
			
			
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setBprcId(bprcId);
				at.setfPath(savePath);
				at.setfName(originFiles.get(i));
				at.setChangeName(changeFiles.get(i));
				
				/*
				 * if(i == originFiles.size() -1) { at.setfLevel(0); }else { at.setFLevel(1); }
				 */
				fileList.add(at);
			}

			System.out.println(member);
			System.out.println(fileList);
			
			
			  int result = new MyPageService().insertProfile(member, fileList);
			  
		/* Member updateProfile = new MyPageService().updateProfile(member); */
			 	
			  System.out.println("fileList : " + fileList);
			/* System.out.println("mId"+mId); */
			  System.out.println("nickname"+nickname);
			  System.out.println("mIntro"+mIntro);
			  System.out.println("bprcId"+bprcId);
		

			if (result > 0 ) {
				/* request.getSession().setAttribute("loginUser", userId); */
				/* request.setAttribute("userId", userId); */
				request.setAttribute("fileList", fileList);
				/* request.setAttribute("mId", mId); */
				request.setAttribute("nickname", nickname);
				request.setAttribute("mIntro", mIntro);
				request.setAttribute("bprcId", bprcId);
				
				request.setAttribute("msg", "프로필 변경에 성공했습니다.");
				
				
				
			
			} else {
				for(int i = 0; i < changeFiles.size(); i++) {
					// 파일 시스템에 저장 된 이름으로 파일 객체 생성함
					File failedFile = new File(savePath + changeFiles.get(i));
					failedFile.delete();
				}

			request.setAttribute("msg", "프로필등록실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
