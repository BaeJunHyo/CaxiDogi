package cd.com.a.model;

import java.io.Serializable;

public class shopListParam implements Serializable {
	
	
	
	private int shopAddr = -1;
	
	private String shopAddrSeo = "서울";
	private String shopAddrKyeong= "경기";
	private String shopAddrEtc = "기타";
	
	// paging
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage =9;	// 표현할 페이지의 글수
	// DB
	private int start = 0;
	private int end = 10;
	
	public shopListParam() {
		// TODO Auto-generated constructor stub
	}

	public shopListParam(int shopAddr, String shopAddrSeo, String shopAddrKyeong, String shopAddrEtc, int pageNumber,
			int recordCountPerPage, int start, int end) {
		super();
		this.shopAddr = shopAddr;
		this.shopAddrSeo = shopAddrSeo;
		this.shopAddrKyeong = shopAddrKyeong;
		this.shopAddrEtc = shopAddrEtc;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public int getShopAddr() {
		return shopAddr;
	}

	public void setShopAddr(int shopAddr) {
		this.shopAddr = shopAddr;
	}

	public String getShopAddrSeo() {
		return shopAddrSeo;
	}

	public void setShopAddrSeo(String shopAddrSeo) {
		this.shopAddrSeo = shopAddrSeo;
	}

	public String getShopAddrKyeong() {
		return shopAddrKyeong;
	}

	public void setShopAddrKyeong(String shopAddrKyeong) {
		this.shopAddrKyeong = shopAddrKyeong;
	}

	public String getShopAddrEtc() {
		return shopAddrEtc;
	}

	public void setShopAddrEtc(String shopAddrEtc) {
		this.shopAddrEtc = shopAddrEtc;
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
		return "shopListParam [shopAddr=" + shopAddr + ", shopAddrSeo=" + shopAddrSeo + ", shopAddrKyeong="
				+ shopAddrKyeong + ", shopAddrEtc=" + shopAddrEtc + ", pageNumber=" + pageNumber
				+ ", recordCountPerPage=" + recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}

	
	
	
}
