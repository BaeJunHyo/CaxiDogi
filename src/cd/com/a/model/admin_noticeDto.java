package cd.com.a.model;

import java.io.Serializable;

public class admin_noticeDto implements Serializable {

	private int notice_num;	 //seq
	private int notice_auth; //작성자(권한/구분)
	private String notice_title;	//제목
	private String notice_content;	//내용
	private String notice_wdate;
	private int notice_readcount; //조회수
	private String notice_server_filename; //서버에 올린 파일 이름 
	private String notice_filename; //원래의 파일 이름 
	
	
	public admin_noticeDto() {
		// TODO Auto-generated constructor stub
	}
	

	public admin_noticeDto(int notice_num, int notice_auth, String notice_title, String notice_content, String wdate,
			int notice_readcount, String notice_server_filename, String notice_filename) {
		super();
		this.notice_num = notice_num;
		this.notice_auth = notice_auth;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_wdate = wdate;
		this.notice_readcount = notice_readcount;
		this.notice_server_filename = notice_server_filename;
		this.notice_filename = notice_filename;
	}


	public admin_noticeDto(int notice_auth, String notice_title, String notice_content, String notice_server_filename,
			String notice_filename) {
		super();
		this.notice_auth = notice_auth;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_server_filename = notice_server_filename;
		this.notice_filename = notice_filename;
	}


	public int getNotice_num() {
		return notice_num;
	}


	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}


	public int getNotice_auth() {
		return notice_auth;
	}


	public void setNotice_auth(int notice_auth) {
		this.notice_auth = notice_auth;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}


	public String getNotice_content() {
		return notice_content;
	}


	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}


	public String getNotice_wdate() {
		return notice_wdate;
	}


	public void setNotice_wdate(String wdate) {
		this.notice_wdate = wdate;
	}


	public int getNotice_readcount() {
		return notice_readcount;
	}


	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}


	public String getNotice_server_filename() {
		return notice_server_filename;
	}


	public void setNotice_server_filename(String notice_server_filename) {
		this.notice_server_filename = notice_server_filename;
	}


	public String getNotice_filename() {
		return notice_filename;
	}


	public void setNotice_filename(String notice_filename) {
		this.notice_filename = notice_filename;
	}


	@Override
	public String toString() {
		return "admin_noticeDto [notice_num=" + notice_num + ", notice_auth=" + notice_auth + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content + ", wdate=" + notice_wdate + ", notice_readcount="
				+ notice_readcount + ", notice_server_filename=" + notice_server_filename + ", notice_filename="
				+ notice_filename + "]";
	}
	
	
	
	
	
}
