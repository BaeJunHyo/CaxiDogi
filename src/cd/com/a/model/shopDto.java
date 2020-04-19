package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE shop
(
    `shop_seq`           INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '샵번호(SEQ)', 
    `shop_owner`         VARCHAR(45)    NOT NULL    COMMENT '대표자명', 
    `shop_number`        VARCHAR(45)    NOT NULL    COMMENT '사업자등록번호', 
    `shop_name`          VARCHAR(45)    NOT NULL    COMMENT '샵이름', 
    `shop_addr`          VARCHAR(45)    NOT NULL    COMMENT '주소', 
    `shop_tel`           VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `shop_auth`          INT(1)         NOT NULL    COMMENT '승인여부', 
    `mem_seq`            INT(5)    NOT NULL    COMMENT 'seller id', 
    `shop_time`          VARCHAR(45)    NOT NULL    COMMENT '영업시간', 
    `shop_photo`         VARCHAR(45)    NULL        COMMENT '샵사진', 
    `shop_etc`           VARCHAR(45)    NOT NULL    COMMENT '자랑하고싶은말', 
    `shop_small_price`   INT(7)         NULL        COMMENT '소형가격', 
    `shop_medium_price`  INT(7)         NULL        COMMENT '중형가격', 
    `shop_large_price`   INT(7)         NULL        COMMENT '대형가격', 
    `shop_content`       TEXT           NULL        COMMENT '컨텐츠', 
    PRIMARY KEY (shop_seq)
);

ALTER TABLE shop
    ADD CONSTRAINT FK_shop_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

*/
public class shopDto implements Serializable {

	private int shop_seq;					// 샵번호(seq)
	private String shop_owner;				// 대표자명
	private String shop_number;				// 사업자 등록번호
	private String shop_name;				// 샵이름
	private String shop_addr;				// 주소
	private String shop_tel;				// 연락처
	private int shop_auth;					// 승인여부
	private int mem_seq;					// seller seq
	private String shop_time;				// 영업시간
	private String shop_photo;				// 샵사진
	private String shop_etc;				// 자랑하고싶은말
	private int shop_small_price;			// 소형가격
	private int shop_medium_price;			// 중형가격
	private int shop_large_price;			// 대형가격
	private String shop_content;			// 컨텐츠
	
	public shopDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public shopDto(int shop_seq, String shop_owner, String shop_number, String shop_name, String shop_addr,
			String shop_tel, int shop_auth, int mem_seq, String shop_time, String shop_photo, String shop_etc,
			int shop_small_price, int shop_medium_price, int shop_large_price, String shop_content) {
		super();
		this.shop_seq = shop_seq;
		this.shop_owner = shop_owner;
		this.shop_number = shop_number;
		this.shop_name = shop_name;
		this.shop_addr = shop_addr;
		this.shop_tel = shop_tel;
		this.shop_auth = shop_auth;
		this.mem_seq = mem_seq;
		this.shop_time = shop_time;
		this.shop_photo = shop_photo;
		this.shop_etc = shop_etc;
		this.shop_small_price = shop_small_price;
		this.shop_medium_price = shop_medium_price;
		this.shop_large_price = shop_large_price;
		this.shop_content = shop_content;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public int getShop_seq() {
		return shop_seq;
	}

	public void setShop_seq(int shop_seq) {
		this.shop_seq = shop_seq;
	}

	public String getShop_owner() {
		return shop_owner;
	}

	public void setShop_owner(String shop_owner) {
		this.shop_owner = shop_owner;
	}

	public String getShop_number() {
		return shop_number;
	}

	public void setShop_number(String shop_number) {
		this.shop_number = shop_number;
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

	public int getShop_auth() {
		return shop_auth;
	}

	public void setShop_auth(int shop_auth) {
		this.shop_auth = shop_auth;
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

	public String getShop_etc() {
		return shop_etc;
	}

	public void setShop_etc(String shop_etc) {
		this.shop_etc = shop_etc;
	}

	public int getShop_small_price() {
		return shop_small_price;
	}

	public void setShop_small_price(int shop_small_price) {
		this.shop_small_price = shop_small_price;
	}

	public int getShop_medium_price() {
		return shop_medium_price;
	}

	public void setShop_medium_price(int shop_medium_price) {
		this.shop_medium_price = shop_medium_price;
	}

	public int getShop_large_price() {
		return shop_large_price;
	}

	public void setShop_large_price(int shop_large_price) {
		this.shop_large_price = shop_large_price;
	}

	public String getShop_content() {
		return shop_content;
	}

	public void setShop_content(String shop_content) {
		this.shop_content = shop_content;
	}

	@Override
	public String toString() {
		return "shopDto [shop_seq=" + shop_seq + ", shop_owner=" + shop_owner + ", shop_number=" + shop_number
				+ ", shop_name=" + shop_name + ", shop_addr=" + shop_addr + ", shop_tel=" + shop_tel + ", shop_auth="
				+ shop_auth + ", mem_seq=" + mem_seq + ", shop_time=" + shop_time + ", shop_photo=" + shop_photo
				+ ", shop_etc=" + shop_etc + ", shop_small_price=" + shop_small_price + ", shop_medium_price="
				+ shop_medium_price + ", shop_large_price=" + shop_large_price + ", shop_content=" + shop_content + "]";
	}
	
	
}
