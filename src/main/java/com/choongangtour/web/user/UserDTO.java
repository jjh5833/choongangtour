package com.choongangtour.web.user;

public class UserDTO {
	private int l_no;
	private String l_id, l_name, l_pw, l_email, l_grade, l_joindate;

	public UserDTO(int l_no, String l_id, String l_name, String l_pw, String l_email, String l_grade, String l_joindate) {
		this.setL_id(l_id);
		this.setL_no(l_no);
		this.setL_name(l_name);
		this.setL_pw(l_pw);
		this.setL_email(l_email);
		this.setL_grade(l_grade);
		this.setL_joindate(l_joindate);
	}
	
public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}

public String getL_id() {
		return l_id;
	}


	public void setL_id(String l_id) {
		this.l_id = l_id;
	}


	public String getL_name() {
		return l_name;
	}


	public void setL_name(String l_name) {
		this.l_name = l_name;
	}


	public String getL_pw() {
		return l_pw;
	}


	public void setL_pw(String l_pw) {
		this.l_pw = l_pw;
	}


	public String getL_email() {
		return l_email;
	}


	public void setL_email(String l_email) {
		this.l_email = l_email;
	}


	public String getL_grade() {
		return l_grade;
	}


	public void setL_grade(String l_grade) {
		this.l_grade = l_grade;
	}


	public String getL_joindate() {
		return l_joindate;
	}


	public void setL_joindate(String l_joindate) {
		this.l_joindate = l_joindate;
	}


@Override 
public String toString() { 
	return "UserVO [l_no=" + l_no + ", l_id=" + l_id + ", l_name=" + l_name + ", l_pw=" + l_pw + ", l_email=" + l_email + ", l_grade=\" + l_grade + \", l_joindate=" + l_joindate + "]";
	
}

}
