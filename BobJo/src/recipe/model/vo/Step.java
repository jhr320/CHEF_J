package recipe.model.vo;

public class Step {


		private String sId;
		private int sStep;
		private String sDesc;
		private String rId;
		
		
		public Step(String sId, int sStep, String sDesc, String rId) {
			super();
			this.sId = sId;
			this.sStep = sStep;
			this.sDesc = sDesc;
			this.rId = rId;
		}
		
		public Step() {}

		public String getsId() {
			return sId;
		}

		public void setsId(String sId) {
			this.sId = sId;
		}

		public int getsStep() {
			return sStep;
		}

		public void setsStep(int sStep) {
			this.sStep = sStep;
		}

		public String getsDesc() {
			return sDesc;
		}

		public void setsDesc(String sDesc) {
			this.sDesc = sDesc;
		}

		public String getrId() {
			return rId;
		}

		public void setrId(String rId) {
			this.rId = rId;
		}

		@Override
		public String toString() {
			return "Recipe_Step [sId=" + sId + ", sStep=" + sStep + ", sDesc=" + sDesc + ", rId=" + rId + "]";
		}

		
		
	}


