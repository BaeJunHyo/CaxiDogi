package cd.com.a.model;

import java.io.Serializable;

public class adminShopParam implements Serializable{

	private int shop_auth = 100;
	
	// paging
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수
	// DB
	private int start = 0;
	private int end = 10;
	
	public adminShopParam() {
	}
	
	public adminShopParam(int shop_auth, int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.shop_auth = shop_auth;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public int getShop_auth() {
		return shop_auth;
	}

	public void setShop_auth(int shop_auth) {
		this.shop_auth = shop_auth;
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

	@Override
	public String toString() {
		return "adminShopParam [shop_auth=" + shop_auth + ", pageNumber=" + pageNumber + ", recordCountPerPage="
				+ recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}
	
}
