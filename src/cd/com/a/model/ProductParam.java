package cd.com.a.model;

import java.io.Serializable;

public class ProductParam implements Serializable {
	
	//-- 상품 검색
	private String s_category;
	private String s_keyword;
	
	private int s_product_group;	// 그룹
	private int s_product_sub_group;	// 서브그룹
	private int soldState;	// 품절상태

	//-- paging
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 10;	// 페이지의 글수
	
	//-- DB
	private int start = 1;
	private int end = 10;
	
	public ProductParam() {
		
	}

	public ProductParam(String s_category, String s_keyword, int s_product_group, int s_product_sub_group,
			int soldState, int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.s_product_group = s_product_group;
		this.s_product_sub_group = s_product_sub_group;
		this.soldState = soldState;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public String getS_category() {
		return s_category;
	}

	public void setS_category(String s_category) {
		this.s_category = s_category;
	}

	public String getS_keyword() {
		return s_keyword;
	}

	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}

	public int getS_product_group() {
		return s_product_group;
	}

	public void setS_product_group(int s_product_group) {
		this.s_product_group = s_product_group;
	}

	public int getS_product_sub_group() {
		return s_product_sub_group;
	}

	public void setS_product_sub_group(int s_product_sub_group) {
		this.s_product_sub_group = s_product_sub_group;
	}

	public int getSoldState() {
		return soldState;
	}

	public void setSoldState(int soldState) {
		this.soldState = soldState;
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
		return "ProductParam [s_category=" + s_category + ", s_keyword=" + s_keyword + ", s_product_group="
				+ s_product_group + ", s_product_sub_group=" + s_product_sub_group + ", soldState=" + soldState
				+ ", pageNumber=" + pageNumber + ", recordCountPerPage=" + recordCountPerPage + ", start=" + start
				+ ", end=" + end + "]";
	}
	
	
	
}
