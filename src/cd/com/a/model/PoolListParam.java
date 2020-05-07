package cd.com.a.model;

import java.io.Serializable;

public class PoolListParam implements Serializable {
	private int poolAddr = -1;
	
	private String poolAddrSeo = "서울";
	private String poolAddrKyeong= "경기";
	private String poolAddrEtc = "기타";
	
	// paging
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 9;	// 표현할 페이지의 글수
	// DB
	private int start = 0;
	private int end = 10;
	
	public PoolListParam() {
	}
	
	public PoolListParam(int poolAddr, String poolAddrSeo, String poolAddrKyeong, String poolAddrEtc, int pageNumber,
			int recordCountPerPage, int start, int end) {
		super();
		this.poolAddr = poolAddr;
		this.poolAddrSeo = poolAddrSeo;
		this.poolAddrKyeong = poolAddrKyeong;
		this.poolAddrEtc = poolAddrEtc;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public int getPoolAddr() {
		return poolAddr;
	}

	public void setPoolAddr(int poolAddr) {
		this.poolAddr = poolAddr;
	}

	public String getPoolAddrSeo() {
		return poolAddrSeo;
	}

	public void setPoolAddrSeo(String poolAddrSeo) {
		this.poolAddrSeo = poolAddrSeo;
	}

	public String getPoolAddrKyeong() {
		return poolAddrKyeong;
	}

	public void setPoolAddrKyeong(String poolAddrKyeong) {
		this.poolAddrKyeong = poolAddrKyeong;
	}

	public String getPoolAddrEtc() {
		return poolAddrEtc;
	}

	public void setPoolAddrEtc(String poolAddrEtc) {
		this.poolAddrEtc = poolAddrEtc;
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
	
	
}
