package recipe.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import attachment.model.vo.Attachment;
import mypage.model.dao.MyPageDao;
import recipe.model.dao.RecipeDao;
import recipe.model.vo.Recipe;
import recipe.model.vo.Step;

public class RecipeService {

	public int getListCount(String nation) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().getListCount(conn,nation);
		
		close(conn);
		
		
		return listCount;
		
	}

	 
	  public Attachment selectThumbnail(String rId) { 
		 Connection conn = getConnection(); 
		 RecipeDao rDao = new RecipeDao();
	  
	  Attachment thumnail = rDao.selectThumbnail(conn, rId); 
	  close(conn);
	  
	  return thumnail;
	  
	  }
	 
	public ArrayList<Recipe> selectList(String nation) {
		
		  Connection conn = getConnection(); 
		  RecipeDao rDao = new RecipeDao();
		  
		  ArrayList<Recipe> rList = rDao.selectList(conn,nation); 
		  close(conn);
		  
		  return rList;

	}

	// 레시피 상세보기
	public ArrayList<Recipe> selectRecipe(String rId) {
		Connection conn = getConnection();
		RecipeDao rDao = new RecipeDao();
		ArrayList<Recipe> list = null;
		
		int result = rDao.increaseCount(conn, rId);
		
		if(result > 0) {
			commit(conn);
			list = rDao.selectRecipe(conn,rId);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return list;
	}





	public ArrayList<Attachment> selectImages(String rId) {
		Connection conn = getConnection();
		RecipeDao rDao = new RecipeDao();
		
		ArrayList<Attachment> imgList = rDao.selectImages(conn,rId);
		
		close(conn);
		
		return imgList;
	}




	//step 이미지 불러오기
	public ArrayList<Attachment> selectStep(String rId) {
		Connection conn = getConnection();
		RecipeDao rDao = new RecipeDao();
		
		/*
		 * ArrayList<Attachment> imgList =rDao.selectStep(conn,rId); return imgList;
		 */
		
		ArrayList<Attachment> rStepList= rDao.selectStep(conn, rId);
		return rStepList;
	}





	/*
	 * public ArrayList<Recipe> selectReList(int currentPage, int boardLimit) {
	 * Connection conn = getConnection();
	 * 
	 * ArrayList<Recipe> reList = new RecipeDao().selectReList(conn, currentPage,
	 * boardLimit);
	 * 
	 * close(conn);
	 * 
	 * return reList; }
	 */


	public int updateLike(String rId,String mId) {
		RecipeDao rDao = new RecipeDao();
		Connection conn = getConnection();
		int result =  rDao.updateLike(conn, rId, mId);
		
		
		if(result > 0) {
			commit(conn);
			result = rDao.selectLike(conn, rId);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}





	public int updateDislike(String rId, String mId) {
		RecipeDao rDao = new RecipeDao();
		Connection conn = getConnection();
		int result =  rDao.updatedisLike(conn, rId, mId);
		
		if(result > 0) {
			commit(conn);
			result = rDao.selectDislike(conn,rId);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
		
	}






	public String insertRecipe(Recipe recipe) {
		Connection conn = getConnection();
		
		String result = new RecipeDao().insertRecipe(conn,recipe);
		if(!result.equals("") && !result.isEmpty())
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;

	}






	public String retriveId() {
		Connection conn = getConnection();
		String str = new RecipeDao().retriveId(conn);
		return str;
	}





	public String insertStep(ArrayList<Step> step) {
		Connection conn = getConnection();
		String result = new RecipeDao().insertStep(conn,step);
		
		if(!result.equals("") || !result.isEmpty()) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}





	public void deleteRecipe(String rId) {
		Connection conn = getConnection();

		int result = new RecipeDao().deleteRecipe(conn,rId);
		if(result > 0) {
			commit(conn);
			
			
		}else {
			rollback(conn);
			System.out.println("지우기 실패");
		}
		close(conn);
	}






	public void deletetStep(String rId) {
		Connection conn = getConnection();

		int result = new RecipeDao().deletetStep(conn,rId);
		if(result > 0) {
			commit(conn);
			
			
		}else {
			rollback(conn);
			System.out.println("지우기 실패");
		}
		close(conn);
	}

	public ArrayList<Recipe> selectRecommendR() {

        Connection conn = getConnection(); 
        RecipeDao rDao = new RecipeDao();
        ArrayList<Recipe> rList = null;
        
        ArrayList<String> r_idList = rDao.selectRecommendRNumbers(conn); 
        if(r_idList != null) {
           rList = rDao.selectRecommendRList(conn, r_idList);
        }
        
        close(conn);
        
        return rList;
   }


	//내가 누른 좋아요 리스트 셀렉해오기
	
	  public ArrayList<String> selectLikeList(String mNo) {
	  
	  Connection conn = getConnection(); RecipeDao rDao = new RecipeDao();
	  
	  
	  ArrayList<String> L_rId = rDao.selectLikeList(conn, mNo);
	  System.out.println("돼라2: " + L_rId);
	  
	  
	  
	  close(conn); return L_rId;
	  
	  }
	 

		public ArrayList<Recipe> selectList2(String nation, int currentPage, int boardLimit) {
			Connection conn = getConnection();
			RecipeDao rDao = new RecipeDao();

			ArrayList<Recipe> reList = rDao.selectList2(conn, nation, currentPage, boardLimit);
			close(conn);

			return reList;
		}


		public ArrayList<Recipe> selectListWhole(int currentPage, int boardLimit) {
			Connection conn = getConnection();
			RecipeDao rDao = new RecipeDao();

			ArrayList<Recipe> reList = rDao.selectListWhole(conn, currentPage, boardLimit);
			close(conn);

			return reList;
		}


		public int getListCountWhole() {
			Connection conn = getConnection();
			
			int listCount = new RecipeDao().getListCountWhole(conn);
			
			close(conn);
			
			
			return listCount;
			
		}


		public ArrayList<Recipe> selectListBest(int currentPage, int boardLimit) {
			Connection conn = getConnection();
			RecipeDao rDao = new RecipeDao();

			ArrayList<Recipe> reList = rDao.selectListBest(conn, currentPage, boardLimit);
			close(conn);

			return reList;
		}


		public ArrayList<Step> selectstep2(String rId) {
			Connection conn = getConnection();
			RecipeDao rDao = new RecipeDao();

			ArrayList<Step> steplist2 = rDao.selectstep2(conn,rId);
			close(conn);

			return steplist2;
		}









}
