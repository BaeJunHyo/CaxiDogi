package cd.com.a.model;

import java.io.Serializable;
import java.util.Date;

public class KakaoPayReadyDto implements Serializable {

	private String tid;
	private String next_redirect_pc_url;
	private Date created_at;
	
	public KakaoPayReadyDto() {
		// TODO Auto-generated constructor stub
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}

	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "KakaoPayDto [tid=" + tid + ", next_redirect_pc_url=" + next_redirect_pc_url + ", created_at="
				+ created_at + "]";
	}
	
	
}
