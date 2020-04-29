package cd.com.a.model;

import java.io.Serializable;

public class shopPagingParam implements Serializable {

	private int mem_seq;
	
	// paging
	private int pageNumber;	// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수
	// DB
	private int start =0;
	private int end=0;
	
	public shopPagingParam() {
		// TODO Auto-generated constructor stub
	}

	public shopPagingParam(int mem_seq, int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.mem_seq = mem_seq;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
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
		return "shopPagingParam [mem_seq=" + mem_seq + ", pageNumber=" + pageNumber + ", recordCountPerPage="
				+ recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}

	
	
	
}
