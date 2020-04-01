package cd.com.a.model;

import java.io.Serializable;

public class testDto implements Serializable{

	private String id;
	private String msg;
	
	public testDto() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "testDto [id=" + id + ", msg=" + msg + "]";
	}
	
	
}
