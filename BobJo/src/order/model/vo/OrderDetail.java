package order.model.vo;

import java.sql.Date;

public class OrderDetail {
	/* 뷰 : order_detail_id, order_member, pid, order_count, detail_price, order_date, order_id, total_price */
	private String orderDetailId;
	private String orderMember;
	private String pId;
	private String pName;
	private int quantity;
	private int dPrice;
	private Date orderDate;
	private String orderId;
	private int tPrice;
	
	public OrderDetail(String orderDetailId, String orderMember, String pId, int quantity, int dPrice, Date orderDate,
			String orderId, int tPrice) {
		super();
		this.orderDetailId = orderDetailId;
		this.orderMember = orderMember;
		this.pId = pId;
		this.quantity = quantity;
		this.dPrice = dPrice;
		this.orderDate = orderDate;
		this.orderId = orderId;
		this.tPrice = tPrice;
	}
	
	public OrderDetail(String orderDetailId, String orderMember, String pId, String pName, int quantity, int dPrice,
			Date orderDate, String orderId, int tPrice) {
		super();
		this.orderDetailId = orderDetailId;
		this.orderMember = orderMember;
		this.pId = pId;
		this.pName = pName;
		this.quantity = quantity;
		this.dPrice = dPrice;
		this.orderDate = orderDate;
		this.orderId = orderId;
		this.tPrice = tPrice;
	}



	public String getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(String orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public String getOrderMember() {
		return orderMember;
	}

	public void setOrderMember(String orderMember) {
		this.orderMember = orderMember;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getdPrice() {
		return dPrice;
	}

	public void setdPrice(int dPrice) {
		this.dPrice = dPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int gettPrice() {
		return tPrice;
	}

	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderDetailId=" + orderDetailId + ", orderMember=" + orderMember + ", pId=" + pId
				+ ", quantity=" + quantity + ", dPrice=" + dPrice + ", orderDate=" + orderDate + ", orderId=" + orderId
				+ ", tPrice=" + tPrice + "]";
	}
	
	
}
