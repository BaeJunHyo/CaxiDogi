package cd.com.a.model;

import java.io.Serializable;

public class shopShowResvParam implements Serializable {

	private int shop_resv_seq;				// 예약번호
	private int shop_seq;					// 샵번호
	private int design_seq;					// 디자이너 번호
	private int mem_seq;						// 예약 아이디
	private String shop_resv_time;			// 예약 시간
	private String shop_resv_rday;			// 예약일  사용자가 이용할 날짜
	private String shop_resv_day;			// 예약날짜
	private int shop_resv_size;				// 미용할 견종(소중대)	0:소  1:중 2:대
	private String shop_resv_name;			// 예약자명
	private String shop_resv_tel;			// 예약자 연락처
	private int shop_resv_price;			// 가금액
	private int shop_resv_auth;				// 취소여부, 이용여부
	private String shop_resv_comment; 
	
	private String shop_name;				// 샵이름
	private String shop_addr;				// 주소
	private String shop_tel;
	private String shop_time;
	private String shop_photo;	
	
	private String design_name;	
	
	public shopShowResvParam() {
		// TODO Auto-generated constructor stub
	}

	public shopShowResvParam(int shop_resv_seq, int shop_seq, int design_seq, int mem_seq, String shop_resv_time,
			String shop_resv_rday, String shop_resv_day, int shop_resv_size, String shop_resv_name,
			String shop_resv_tel, int shop_resv_price, int shop_resv_auth, String shop_resv_comment, String shop_name,
			String shop_addr, String shop_tel, String shop_time, String shop_photo, String design_name) {
		super();
		this.shop_resv_seq = shop_resv_seq;
		this.shop_seq = shop_seq;
		this.design_seq = design_seq;
		this.mem_seq = mem_seq;
		this.shop_resv_time = shop_resv_time;
		this.shop_resv_rday = shop_resv_rday;
		this.shop_resv_day = shop_resv_day;
		this.shop_resv_size = shop_resv_size;
		this.shop_resv_name = shop_resv_name;
		this.shop_resv_tel = shop_resv_tel;
		this.shop_resv_price = shop_resv_price;
		this.shop_resv_auth = shop_resv_auth;
		this.shop_resv_comment = shop_resv_comment;
		this.shop_name = shop_name;
		this.shop_addr = shop_addr;
		this.shop_tel = shop_tel;
		this.shop_time = shop_time;
		this.shop_photo = shop_photo;
		this.design_name = design_name;
	}

	public int getShop_resv_seq() {
		return shop_resv_seq;
	}

	public void setShop_resv_seq(int shop_resv_seq) {
		this.shop_resv_seq = shop_resv_seq;
	}

	public int getShop_seq() {
		return shop_seq;
	}

	public void setShop_seq(int shop_seq) {
		this.shop_seq = shop_seq;
	}

	public int getDesign_seq() {
		return design_seq;
	}

	public void setDesign_seq(int design_seq) {
		this.design_seq = design_seq;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getShop_resv_time() {
		return shop_resv_time;
	}

	public void setShop_resv_time(String shop_resv_time) {
		this.shop_resv_time = shop_resv_time;
	}

	public String getShop_resv_rday() {
		return shop_resv_rday;
	}

	public void setShop_resv_rday(String shop_resv_rday) {
		this.shop_resv_rday = shop_resv_rday;
	}

	public String getShop_resv_day() {
		return shop_resv_day;
	}

	public void setShop_resv_day(String shop_resv_day) {
		this.shop_resv_day = shop_resv_day;
	}

	public int getShop_resv_size() {
		return shop_resv_size;
	}

	public void setShop_resv_size(int shop_resv_size) {
		this.shop_resv_size = shop_resv_size;
	}

	public String getShop_resv_name() {
		return shop_resv_name;
	}

	public void setShop_resv_name(String shop_resv_name) {
		this.shop_resv_name = shop_resv_name;
	}

	public String getShop_resv_tel() {
		return shop_resv_tel;
	}

	public void setShop_resv_tel(String shop_resv_tel) {
		this.shop_resv_tel = shop_resv_tel;
	}

	public int getShop_resv_price() {
		return shop_resv_price;
	}

	public void setShop_resv_price(int shop_resv_price) {
		this.shop_resv_price = shop_resv_price;
	}

	public int getShop_resv_auth() {
		return shop_resv_auth;
	}

	public void setShop_resv_auth(int shop_resv_auth) {
		this.shop_resv_auth = shop_resv_auth;
	}

	public String getShop_resv_comment() {
		return shop_resv_comment;
	}

	public void setShop_resv_comment(String shop_resv_comment) {
		this.shop_resv_comment = shop_resv_comment;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_addr() {
		return shop_addr;
	}

	public void setShop_addr(String shop_addr) {
		this.shop_addr = shop_addr;
	}

	public String getShop_tel() {
		return shop_tel;
	}

	public void setShop_tel(String shop_tel) {
		this.shop_tel = shop_tel;
	}

	public String getShop_time() {
		return shop_time;
	}

	public void setShop_time(String shop_time) {
		this.shop_time = shop_time;
	}

	public String getShop_photo() {
		return shop_photo;
	}

	public void setShop_photo(String shop_photo) {
		this.shop_photo = shop_photo;
	}

	public String getDesign_name() {
		return design_name;
	}

	public void setDesign_name(String design_name) {
		this.design_name = design_name;
	}

	@Override
	public String toString() {
		return "shopShowResvParam [shop_resv_seq=" + shop_resv_seq + ", shop_seq=" + shop_seq + ", design_seq="
				+ design_seq + ", mem_seq=" + mem_seq + ", shop_resv_time=" + shop_resv_time + ", shop_resv_rday="
				+ shop_resv_rday + ", shop_resv_day=" + shop_resv_day + ", shop_resv_size=" + shop_resv_size
				+ ", shop_resv_name=" + shop_resv_name + ", shop_resv_tel=" + shop_resv_tel + ", shop_resv_price="
				+ shop_resv_price + ", shop_resv_auth=" + shop_resv_auth + ", shop_resv_comment=" + shop_resv_comment
				+ ", shop_name=" + shop_name + ", shop_addr=" + shop_addr + ", shop_tel=" + shop_tel + ", shop_time="
				+ shop_time + ", shop_photo=" + shop_photo + ", design_name=" + design_name + "]";
	}

	
	
	
	
	
}
