package cd.com.a.model;

import java.io.Serializable;

public class ProductParam implements Serializable {
	
	//-- 상품 검색
	private String s_category;
	private String s_keyword;
	
	private String s_product_group;	// 그룹
	private int product_group_df = 0; 
	private String s_product_sub_group;	// 서브그룹
	private int product_sub_group_df = 0;
	
	private int soldStateArr = 0;
	private int s_soldState;	// 품절상태

	//-- paging
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 10;	// 페이지의 글수
	
	//-- DB
	private int start = 1;
	private int end = 10;
	
	public ProductParam() {
		
	}

	public ProductParam(String s_category, String s_keyword, String s_product_group, int product_group_df,
			String s_product_sub_group, int product_sub_group_df, int soldStateArr, int s_soldState, int pageNumber,
			int recordCountPerPage, int start, int end) {
		super();
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.s_product_group = s_product_group;
		this.product_group_df = product_group_df;
		this.s_product_sub_group = s_product_sub_group;
		this.product_sub_group_df = product_sub_group_df;
		this.soldStateArr = soldStateArr;
		this.s_soldState = s_soldState;
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

	public String getS_product_group() {
		return s_product_group;
	}

	public void setS_product_group(String s_product_group) {
		this.s_product_group = s_product_group;
	}

	public int getProduct_group_df() {
		return product_group_df;
	}

	public void setProduct_group_df(int product_group_df) {
		this.product_group_df = product_group_df;
	}

	public String getS_product_sub_group() {
		return s_product_sub_group;
	}

	public void setS_product_sub_group(String s_product_sub_group) {
		this.s_product_sub_group = s_product_sub_group;
	}

	public int getProduct_sub_group_df() {
		return product_sub_group_df;
	}

	public void setProduct_sub_group_df(int product_sub_group_df) {
		this.product_sub_group_df = product_sub_group_df;
	}

	public int getSoldStateArr() {
		return soldStateArr;
	}

	public void setSoldStateArr(int soldStateArr) {
		this.soldStateArr = soldStateArr;
	}

	public int getS_soldState() {
		return s_soldState;
	}

	public void setS_soldState(int s_soldState) {
		this.s_soldState = s_soldState;
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
				+ s_product_group + ", product_group_df=" + product_group_df + ", s_product_sub_group="
				+ s_product_sub_group + ", product_sub_group_df=" + product_sub_group_df + ", soldStateArr="
				+ soldStateArr + ", s_soldState=" + s_soldState + ", pageNumber=" + pageNumber + ", recordCountPerPage="
				+ recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}

	
	
	
	
}
