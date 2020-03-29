package product.model.vo;

public class Cart {

	private String pId;
	private int quantity;
	private String userId;
	private String pName;
	private int pPrice;
	private String cateInId;
	private String fName;
	
	
	public Cart() {}

	public Cart(String pId, int quantity) {
		super();
		this.pId = pId;
		this.quantity = quantity;
	}

	public Cart(String pId, int quantity, String userId) {
		super();
		this.pId = pId;
		this.quantity = quantity;
		this.userId = userId;
	}
	
	public Cart(String pId, int quantity, String userId, String pName, int pPrice, String cateInId, String fName) {
		super();
		this.pId = pId;
		this.quantity = quantity;
		this.userId = userId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.cateInId = cateInId;
		this.fName = fName;
	}
	
	public Cart(String pId, int quantity, int pPrice) {
		super();
		this.pId = pId;
		this.quantity = quantity;
		this.pPrice = pPrice;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getCateInId() {
		return cateInId;
	}

	public void setCateInId(String cateInId) {
		this.cateInId = cateInId;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	@Override
	public String toString() {
		return "Cart [pId=" + pId + ", quantity=" + quantity + ", userId=" + userId + ", pName=" + pName + ", pPrice="
				+ pPrice + ", cateInId=" + cateInId + ", fName=" + fName + "]";
	}

	
}
