package cd.com.a.model;

import java.io.Serializable;

public class AdminPoolParam implements Serializable {
	private int pool_auth = 100;
	
	// paging
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수
	// DB
	private int start = 0;
	private int end = 10;
	
	public AdminPoolParam() {
		
	}

	public int getPool_auth() {
		return pool_auth;
	}

	public void setPool_auth(int pool_auth) {
		this.pool_auth = pool_auth;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public AdminPoolParam(int pool_auth, int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.pool_auth = pool_auth;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	@Override
	public String toString() {
		return "AdminPoolParam [pool_auth=" + pool_auth + ", pageNumber=" + pageNumber + ", recordCountPerPage="
				+ recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}
	
	
}
