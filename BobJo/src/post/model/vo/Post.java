package post.model.vo;

import java.sql.Date;

public class Post {
	private String pId;
	private int pType;
	private String pTitle;
	private String pCotent;
	private String pWriter;
	private Date pDateWritten;
	private int pCount;
	private int pLike;
	private String pStatus;
	private int pNo;
	
	
	
	public Post(String pId, int pType, String pTitle, String pCotent, String pWriter, Date pDateWritten, int pCount,
			int pLike, String pStatus, int pNo) {
		super();
		this.pId = pId;
		this.pType = pType;
		this.pTitle = pTitle;
		this.pCotent = pCotent;
		this.pWriter = pWriter;
		this.pDateWritten = pDateWritten;
		this.pCount = pCount;
		this.pLike = pLike;
		this.pStatus = pStatus;
		this.pNo = pNo;
	}
	public Post() {}
	public Post(String pId, int pType, String pTitle,
			String pCotent, String pWriter, Date pDateWritten,
			int pCount, int pLike, String pStatus) {
		super();
		this.pId = pId;
		this.pType = pType;
		this.pTitle = pTitle;
		this.pCotent = pCotent;
		this.pWriter = pWriter;
		this.pDateWritten = pDateWritten;
		this.pCount = pCount;
		this.pLike = pLike;
		this.pStatus = pStatus;
	}
	public Post(String bId, String bTitle, String wId, Date date) {
		this.pId = bId;
		this.pTitle = bTitle;
		this.pWriter = wId;
		this.pDateWritten =date;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public int getpType() {
		return pType;
	}
	public void setpType(int pType) {
		this.pType = pType;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpCotent() {
		return pCotent;
	}
	public void setpCotent(String pCotent) {
		this.pCotent = pCotent;
	}
	public String getpWriter() {
		return pWriter;
	}
	public void setpWriter(String pWriter) {
		this.pWriter = pWriter;
	}
	public Date getpDateWritten() {
		return pDateWritten;
	}
	public void setpDateWritten(Date pDateWritten) {
		this.pDateWritten = pDateWritten;
	}
	public int getpCount() {
		return pCount;
	}
	public void setpCount(int pCount) {
		this.pCount = pCount;
	}
	public int getpLike() {
		return pLike;
	}
	public void setpLike(int pLike) {
		this.pLike = pLike;
	}
	public String getpStatus() {
		return pStatus;
	}
	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}
	@Override
	public String toString() {
		return "Post [pId=" + pId + ", pType=" + pType + ", pTitle=" + pTitle + ", pCotent=" + pCotent + ", pWriter="
				+ pWriter + ", pDateWritten=" + pDateWritten + ", pCount=" + pCount + ", pLike=" + pLike + ", pStatus="
				+ pStatus + "]";
	}
	
	
	
}
