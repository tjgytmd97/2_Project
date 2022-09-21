package domain;

public class Comment {
	private int comm_num; 
	private String comm_datetime; 
	private String certi_num;
	private int member_num;
	private String comm_text;
	private String member_id;

	public Comment(int comm_num, String comm_datetime, String certi_num, int member_num, String comm_text,
			String member_id) {
		super();
		this.comm_num = comm_num;
		this.comm_datetime = comm_datetime;
		this.certi_num = certi_num;
		this.member_num = member_num;
		this.comm_text = comm_text;
		this.member_id = member_id;
	}

	public int getComm_num() {
		return comm_num;
	}

	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}

	public String getComm_datetime() {
		return comm_datetime;
	}

	public void setComm_datetime(String comm_datetime) {
		this.comm_datetime = comm_datetime;
	}

	public String getCerti_num() {
		return certi_num;
	}

	public void setCerti_num(String certi_num) {
		this.certi_num = certi_num;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getComm_text() {
		return comm_text;
	}

	public void setComm_text(String comm_text) {
		this.comm_text = comm_text;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
