package product.model.vo;

public class Product {
	private String pId;			// 상품번호
	private String cateInId;	// 재료카테고리
	private String pName;		// 상품명
	private int pPrice;			// 상품 가격
	private String pShortDesc;	// 상품 짧은 설명
	private String pSaleUnit;	// 상품 판매 단위
	private String pWeight;		// 상품 중량/용량
	private int pStock;			// 상품 재고
	
	public Product() {}

	public Product(String pId, String cateInId, String pName, int pPrice, String pShortDesc, String pSaleUnit,
			String pWeight, int pStock) {
		super();
		this.pId = pId;
		this.cateInId = cateInId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pShortDesc = pShortDesc;
		this.pSaleUnit = pSaleUnit;
		this.pWeight = pWeight;
		this.pStock = pStock;
	}
	
	public Product(String pId, String cateInId, String pName, int pPrice, String pShortDesc) {
		super();
		this.pId = pId;
		this.cateInId = cateInId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pShortDesc = pShortDesc;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getCateInId() {
		return cateInId;
	}

	public void setCateInId(String cateInId) {
		this.cateInId = cateInId;
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

	public String getpShortDesc() {
		return pShortDesc;
	}

	public void setpShortDesc(String pShortDesc) {
		this.pShortDesc = pShortDesc;
	}

	public String getpSaleUnit() {
		return pSaleUnit;
	}

	public void setpSaleUnit(String pSaleUnit) {
		this.pSaleUnit = pSaleUnit;
	}

	public String getpWeight() {
		return pWeight;
	}

	public void setpWeight(String pWeight) {
		this.pWeight = pWeight;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", cateInId=" + cateInId + ", pName=" + pName + ", pPrice=" + pPrice
				+ ", pShortDesc=" + pShortDesc + ", pSaleUnit=" + pSaleUnit + ", pWeight=" + pWeight + ", pStock="
				+ pStock + "]";
	}
	
	
	
}
