package recipe.model.vo;

public class Ingredient {
	private String rId;
	private String rInName;
	private String rWeight;
	
	
	public Ingredient() {}


	public Ingredient(String rId, String rInName, String rWeight) {
		this.rId=rId;
		this.rInName=rInName;
		this.rWeight=rWeight;
	
	}


	public String getrId() {
		return rId;
	}


	public void setrId(String rId) {
		this.rId = rId;
	}


	public String getrInName() {
		return rInName;
	}


	public void setrInName(String rInName) {
		this.rInName = rInName;
	}


	public String getrWeight() {
		return rWeight;
	}


	public void setrWeight(String rWeight) {
		this.rWeight = rWeight;
	}


	@Override
	public String toString() {
		return "Ingredient [rId=" + rId + ", rInName=" + rInName + ", rWeight=" + rWeight + "]";
	}


	
	
	
	
	
	

}
