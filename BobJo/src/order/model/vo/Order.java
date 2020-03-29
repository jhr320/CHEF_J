package order.model.vo;

import java.sql.Date;

public class Order {
	private String orderId;
	private String orderMember;
	private String recipientName;
	private String recipientPhone;
	private String recipientAddress;
	private String deliveryRequest;
	private int totalPrice;
	private Date orderDate;
	
	public Order() {}

	public Order(String orderId, String orderMember, String recipientName, String recipientPhone,
			String recipientAddress, String deliveryRequest, int totalPrice, Date orderDate) {
		super();
		this.orderId = orderId;
		this.orderMember = orderMember;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.recipientAddress = recipientAddress;
		this.deliveryRequest = deliveryRequest;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
	}

	public Order(String orderMember, int totalPrice) {
		super();
		this.orderMember = orderMember;
		this.totalPrice = totalPrice;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderMember() {
		return orderMember;
	}

	public void setOrderMember(String orderMember) {
		this.orderMember = orderMember;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public String getRecipientAddress() {
		return recipientAddress;
	}

	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}

	public String getDeliveryRequest() {
		return deliveryRequest;
	}

	public void setDeliveryRequest(String deliveryRequest) {
		this.deliveryRequest = deliveryRequest;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderMember=" + orderMember + ", recipientName=" + recipientName
				+ ", recipientPhone=" + recipientPhone + ", recipientAddress=" + recipientAddress + ", deliveryRequest="
				+ deliveryRequest + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + "]";
	};
	
	
	
	
}
