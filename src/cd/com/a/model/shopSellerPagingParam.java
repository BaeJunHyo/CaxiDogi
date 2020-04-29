package cd.com.a.model;

import java.io.Serializable;

public class shopSellerPagingParam implements Serializable {

	private int shopSeq = -1;
	private int shopResvAuth =-1;
	private int shopDesignerSeq =-1;
	private int memSeq;
	
	
	// paging
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수
	// DB
	private int start = 0;
	private int end = 10;
	
	public shopSellerPagingParam() {
		// TODO Auto-generated constructor stub
	}

	public shopSellerPagingParam(int shopSeq, int shopResvAuth, int shopDesignerSeq, int memSeq, int pageNumber,
			int recordCountPerPage, int start, int end) {
		super();
		this.shopSeq = shopSeq;
		this.shopResvAuth = shopResvAuth;
		this.shopDesignerSeq = shopDesignerSeq;
		this.memSeq = memSeq;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public int getShopSeq() {
		return shopSeq;
	}

	public void setShopSeq(int shopSeq) {
		this.shopSeq = shopSeq;
	}

	public int getShopResvAuth() {
		return shopResvAuth;
	}

	public void setShopResvAuth(int shopResvAuth) {
		this.shopResvAuth = shopResvAuth;
	}

	public int getShopDesignerSeq() {
		return shopDesignerSeq;
	}

	public void setShopDesignerSeq(int shopDesignerSeq) {
		this.shopDesignerSeq = shopDesignerSeq;
	}

	public int getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
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
		return "shopSellerPagingParam [shopSeq=" + shopSeq + ", shopResvAuth=" + shopResvAuth + ", shopDesignerSeq="
				+ shopDesignerSeq + ", memSeq=" + memSeq + ", pageNumber=" + pageNumber + ", recordCountPerPage="
				+ recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}
	
	
}
