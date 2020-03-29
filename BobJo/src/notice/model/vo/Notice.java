package notice.model.vo;

import java.sql.Date;

public class Notice {
	private String nId;
	private String nTitle;
	private String nContent;
	private String mNo;
	private Date nDate;
	private int nCount;
	private String nStatus;
	
	public Notice() {}

	public Notice(String nId, String nTitle, String nContent, String mNo, Date nDate, int nCount, String nStatus) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.mNo = mNo;
		this.nDate = nDate;
		this.nCount = nCount;
		this.nStatus = nStatus;
	}

	public Notice(String bid, String title, String writer, Date date) {
		this.nId = bid;
		this.nTitle = title;
		this.mNo = writer;
		this.nDate = date;
	}

	public String getnId() {
		return nId;
	}

	public void setnId(String nId) {
		this.nId = nId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", nTitle=" + nTitle + ", nContent=" + nContent + ", mNo=" + mNo + ", nDate="
				+ nDate + ", nCount=" + nCount + ", nStatus=" + nStatus + "]";
	};
	
	
}
