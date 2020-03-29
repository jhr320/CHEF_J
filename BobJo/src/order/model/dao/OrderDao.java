package order.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;
import notice.model.vo.Notice;
import order.model.vo.Order;
import order.model.vo.OrderDetail;
import qna.model.dao.QnaDao;

public class OrderDao {
	private Properties prop = new Properties();

	public OrderDao() {
		String fileName = OrderDao.class.getResource("/sql/order/order-query.properties").getPath();
		System.out.println(fileName);
		  prop = new Properties();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Order> selectOrderList(Connection conn, String mNo) {
		ArrayList<Order> list = new ArrayList<Order>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectOrderList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Order(rs.getString("order_id"), rs.getString("order_member"),
						rs.getString("recipient_name"), rs.getString("recipient_phone"),
						rs.getString("recipient_address"), rs.getString("delivery_Request"),
						rs.getInt("total_price"),	rs.getDate("order_Date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	// 주문 추가하기
	public int insertOrder(Connection conn, String mNo, String rName, String rPhone, String addr, String rPlease,
			int chong) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mNo);
			pstmt.setString(2, rName);
			pstmt.setString(3, rPhone);
			pstmt.setString(4, addr);
			pstmt.setString(5, rPlease);
			pstmt.setInt(6, chong);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	// 주문 상세 추가하기
	public int insertDetailOrder(Connection conn, String orderId, String pId, int quantity, int total) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("inserDetailOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, orderId);
			pstmt.setString(2, pId);
			pstmt.setInt(3, quantity);
			pstmt.setInt(4, total);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	// 최근 주문번호 1개 조회하기
	public String selectOrderId(Connection conn, String mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String orderId = "";
		
		String sql = prop.getProperty("selectOrderId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				orderId = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return orderId;
	}

	// 마이페이지 주문조회 시 사용할 메소드
	public ArrayList<OrderDetail> selectMyOrder(Connection conn, String mNo) {
		ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new OrderDetail(
						rset.getString("ORDER_DETAIL_ID"),
						rset.getString("ORDER_MEMBER"),
						rset.getString("PID"),
						rset.getString("P_NAME"),
						rset.getInt("ORDER_COUNT"),
						rset.getInt("DETAIL_PRICE"),
						rset.getDate("ORDER_DATE"),
						rset.getString("ORDER_ID"),
						rset.getInt("TOTAL_PRICE")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	//어드민페이지-멤버의 구매총액가져올 메소드
	public ArrayList<Order> selectOrderList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Order> list = new ArrayList<Order>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		
		
		//어드민용 메소드
		String sql = prop.getProperty("selectOrderList2");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);

			// 쿼리문 실행 시 조건절에 넣을 변수들
			// currentPage = 1 --> startRow 1 ~ endRow 10
			// currentPage = 2 --> startRow 11 ~ endRow 20

			// startRow : (currentPage - 1) * boardLimit + 1
			// endRow : startRow + boardLimit - 1
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new Order(
						rs.getString("order_member"),
						rs.getInt("total_price")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	
	
	
}
