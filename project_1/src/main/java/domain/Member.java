package domain;

public class Member {
	private int num;
	private String id;
	private String name;
	private String email;
	private String pw;
	public Member(int num, String id, String name, String email, String pw) {
		super();
		this.num = num;
		this.id = id;
		this.name = name;
		this.email = email;
		this.pw = pw;
	}

	public Member(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
}
