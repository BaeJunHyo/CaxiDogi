package cd.com.a.model;

import java.io.Serializable;

public class ProductListParam implements Serializable {
	
	private int product_group = -1;   // 그룹
	private int product_sub_group = -1;   // 서브그룹
		   
	//-- paging
	private int pageNumber = 0;   // 현재 페이지
	private int recordCountPerPage = 9;   // 표현할 페이지의 글수
		   
	//private int sorting = 0;
	//private int countList = 10;
		   
	//-- DB
	private int start = 0;
	private int end = 10;
	
	public ProductListParam() {
		
	}

	public ProductListParam(int product_group, int product_sub_group, int pageNumber, int recordCountPerPage,
			int sorting, int countList, int start, int end) {
		super();
		this.product_group = product_group;
		this.product_sub_group = product_sub_group;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public int getProduct_group() {
		return product_group;
	}

	public void setProduct_group(int product_group) {
		this.product_group = product_group;
	}

	public int getProduct_sub_group() {
		return product_sub_group;
	}

	public void setProduct_sub_group(int product_sub_group) {
		this.product_sub_group = product_sub_group;
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
		return "ProductListParam [product_group=" + product_group + ", product_sub_group=" + product_sub_group
				+ ", pageNumber=" + pageNumber + ", recordCountPerPage=" + recordCountPerPage + ", start=" + start
				+ ", end=" + end + "]";
	}


	
	
	
	
}
