package cd.com.a.model;

import java.io.Serializable;
/*
 CREATE TABLE member
(
    `id`             VARCHAR(45)     NOT NULL    COMMENT 'ID(EMAIL)', 
    `password`       VARCHAR(45)     NULL        COMMENT '패스워드', 
    `user_api`       INT(1)          NOT NULL    COMMENT 'API종류', 
    `nick_name`      VARCHAR(45)     NOT NULL    COMMENT '닉네임', 
    `user_name`      VARCHAR(45)     NULL        COMMENT '이름', 
    `birthday`       INT             NOT NULL    COMMENT '생년월일', 
    `address`        VARCHAR(200)    NULL        COMMENT '주소', 
    `phone`          INT             NULL        COMMENT '연락처', 
    `pass_question`  INT(1)          NULL        COMMENT '패스워드찾기', 
    `pass_hint`      VARCHAR(45)     NULL        COMMENT '패스워드힌트', 
    `point`          INT             NULL        COMMENT '마일리지', 
    `auth`           INT(1)          NOT NULL    COMMENT '유저권한', 
    PRIMARY KEY (id)
); 
 */
public class memberDto implements Serializable {
	private String id;
	private String password;
	private int user_api;
	private String nick_name;
	private String user_name;
	private int birthday;
	private String address;
	private String phone;
	private int pass_question;
	private String pass_hint;
	private int point;
	private int auth;
	
	
	public memberDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public memberDto(String id, String password, int user_api, String nick_name, String user_name, int birthday,
			String address, String phone, int pass_question, String pass_hint, int point, int auth) {
		super();
		this.id = id;
		this.password = password;
		this.user_api = user_api;
		this.nick_name = nick_name;
		this.user_name = user_name;
		this.birthday = birthday;
		this.address = address;
		this.phone = phone;
		this.pass_question = pass_question;
		this.pass_hint = pass_hint;
		this.point = point;
		this.auth = auth;
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

	public int getUser_api() {
		return user_api;
	}

	public void setUser_api(int user_api) {
		this.user_api = user_api;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getBirthday() {
		return birthday;
	}

	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPass_question() {
		return pass_question;
	}

	public void setPass_question(int pass_question) {
		this.pass_question = pass_question;
	}

	public String getPass_hint() {
		return pass_hint;
	}

	public void setPass_hint(String pass_hint) {
		this.pass_hint = pass_hint;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public memberDto(String id) {
		super();
		this.id = id;
	}

	@Override
	public String toString() {
		return "memberDto [id=" + id + ", password=" + password + ", user_api=" + user_api + ", nick_name=" + nick_name
				+ ", user_name=" + user_name + ", birthday=" + birthday + ", address=" + address + ", phone=" + phone
				+ ", pass_question=" + pass_question + ", pass_hint=" + pass_hint + ", point=" + point + ", auth="
				+ auth + "]";
	}
	
	
	
	
}
