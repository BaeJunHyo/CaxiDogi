package cd.com.a.model;

import java.io.Serializable;

public class poolParam implements Serializable{
	private int poolSeq=100;
	private int poolResvAuth=100;
	private int memSeq;
	
	// paging
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수
	// DB
	private int start = 0;
	private int end = 10;
	
	public poolParam() {
	}

	public poolParam(int poolSeq, int poolResvAuth, int memSeq, int pageNumber, int recordCountPerPage, int start,
			int end) {
		super();
		this.poolSeq = poolSeq;
		this.poolResvAuth = poolResvAuth;
		this.memSeq = memSeq;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public int getPoolSeq() {
		return poolSeq;
	}

	public void setPoolSeq(int poolSeq) {
		this.poolSeq = poolSeq;
	}

	public int getPoolResvAuth() {
		return poolResvAuth;
	}

	public void setPoolResvAuth(int poolResvAuth) {
		this.poolResvAuth = poolResvAuth;
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

	public int getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}

	@Override
	public String toString() {
		return "poolParam [poolSeq=" + poolSeq + ", poolResvAuth=" + poolResvAuth + ", memSeq=" + memSeq
				+ ", pageNumber=" + pageNumber + ", recordCountPerPage=" + recordCountPerPage + ", start=" + start
				+ ", end=" + end + "]";
	}


	
}
