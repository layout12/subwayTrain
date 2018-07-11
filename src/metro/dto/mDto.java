package metro.dto;

import java.util.Date;

public class mDto {
	
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private String role;
	private String enabled;
	
	private int writeNo;
	private String title;
	private String content;
	private Date regDate;
	private String delCheck;
	
	private int commentNo;

	public mDto() {
		super();
	}
	
	//회원정보------------------------------------------------------------------------------------
	public mDto(String id, String password, String name, String nickname, String phone, String email, String role,
			String enabled) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.role = role;
		this.enabled = enabled;
	}
	

	//글쓰기---------------------------------------------------------------------------------------
	public mDto( int writeNo, String id, String nickname, String title, String content, Date regDate, String delCheck) {
		super();
		this.writeNo = writeNo;
		this.id = id;
		this.nickname = nickname;		
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.delCheck = delCheck;
	}

	//댓글---------------------------------------------------------------------------------------
	public mDto(int writeNo, int commentNo, String id, String nickname, String content, Date regDate, String delCheck) {
		super();
		this.writeNo = writeNo;
		this.commentNo = commentNo;
		this.id = id;
		this.nickname = nickname;		
		this.content = content;
		this.regDate = regDate;
		this.delCheck = delCheck;		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getDelCheck() {
		return delCheck;
	}

	public void setDelCheck(String delCheck) {
		this.delCheck = delCheck;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	
	
}
