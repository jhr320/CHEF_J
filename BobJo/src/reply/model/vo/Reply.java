package reply.model.vo;

import java.util.Date;

public class Reply {
	private String cId;
	private int bType;
	private String Board_Id;
	private String writerId;
	private String content;
	private Date writtenDate;
	private String status;
	private String name;
	
	public Reply() {}

	
	
	public Reply(String cId, int bType, String board_Id, String writerId, String content, Date writtenDate,
			String status , String name) {

		super();
		this.cId = cId;
		this.bType = bType;
		Board_Id = board_Id;
		this.writerId = writerId;
		this.content = content;
		this.writtenDate = writtenDate;
		this.status = status;
		this.name = name;
	}



	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public int getbType() {
		return bType;
	}
	public void setbType(int bType) {
		this.bType = bType;
	}
	public String getBoard_Id() {
		return Board_Id;
	}
	public void setBoard_Id(String board_Id) {
		Board_Id = board_Id;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "Reply [cId=" + cId + ", bType=" + bType + ", Board_Id=" + Board_Id + ", writerId=" + writerId
				+ ", content=" + content + ", writtenDate=" + writtenDate + ", status=" + status + ", name=" + name
				+ "]";

	}


	
}
