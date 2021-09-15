package memberVO;

public class MemberVO {
	private String firstname;
	private String lastname;
	private String mail1;
	private String mail2;
	private String tel;
	private String pwd;
	private int memnum;
	
	MemberVO(){}

	public MemberVO(String firstname, String lastname, String mail1, String mail2, String tel, String pwd, int memnum) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.mail1 = mail1;
		this.mail2 = mail2;
		this.tel = tel;
		this.pwd = pwd;
		this.memnum = memnum;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getMail1() {
		return mail1;
	}

	public void setMail1(String mail1) {
		this.mail1 = mail1;
	}

	public String getMail2() {
		return mail2;
	}

	public void setMail2(String mail2) {
		this.mail2 = mail2;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getMemnum() {
		return memnum;
	}

	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	
	

}
