package order.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import order.model.dao.OrderDao;
import order.model.vo.Order;
import order.model.vo.OrderDetail;

public class OrderService {

	public ArrayList<Order> selectOrderList(String mNo) {
		Connection conn = getConnection();
		ArrayList<Order> list = new OrderDao().selectOrderList(conn, mNo);
		
		close(conn);
		return list;
		
	}

	// Shopping_Order 테이블 접근 -> 주문 추가하기
	public int insertOrder(String mNo, String rName, String rPhone, String addr, String rPlease, int chong) {
		Connection conn = getConnection();
		int r1 = new OrderDao().insertOrder(conn, mNo, rName, rPhone, addr, rPlease, chong);
		if(r1>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return r1;
	}

	// order_detail 테이블 접근 -> 주문 상세 추가하기
	public int insertDetailOrder(String orderId, String pId, int quantity, int total) {
		Connection conn = getConnection();
		int result = new OrderDao().insertDetailOrder(conn, orderId, pId, quantity, total);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 최근 주문 번호 1개 조회하기
	public String selectOrderId(String mNo) {
		Connection conn = getConnection();
		String orderId = new OrderDao().selectOrderId(conn, mNo);
		close(conn);
		return orderId;
	}

	// 마이페이지에서 주문 조회 시
	public ArrayList<OrderDetail> selectMyOrder(String mNo) {
		Connection conn = getConnection();
		ArrayList<OrderDetail> oList = new OrderDao().selectMyOrder(conn, mNo);
		close(conn);
		return oList;
	}

	//어드민페이지 - 회원관리용 주문액리스트 
	public ArrayList<Order> SelectOrderList(int currentPage, int boardLimit) {
		Connection conn  = getConnection();
		
		 ArrayList<Order> list = new OrderDao().selectOrderList(conn, currentPage, boardLimit);

		close(conn);
		 return list;
	}

	

}
