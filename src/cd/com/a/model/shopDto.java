package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE shop
(
    `company_num`        INT(5)         NOT NULL    COMMENT '업체번호(SEQ)', 
    `shop_num`           INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '샵번호(SEQ)', 
    `shop_name`          VARCHAR(45)    NOT NULL    COMMENT '샵이름', 
    `shop_photo`         TEXT           NULL        COMMENT '샵사진', 
    `shop_small_price`   INT(7)         NOT NULL    COMMENT '소형가격', 
    `shop_medium_price`  INT(7)         NOT NULL    COMMENT '중형가격', 
    `shop_large_price`   INT(7)         NOT NULL    COMMENT '대형가격', 
    `shop_addr`          VARCHAR(45)    NOT NULL    COMMENT '주소', 
    `shop_tel`           VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `shop_time`          VARCHAR(45)    NOT NULL    COMMENT '영업시간', 
    `shop_etc`           VARCHAR(45)    NULL        COMMENT 'ETC', 
    `shop_content`       TEXT           NOT NULL    COMMENT '컨텐츠', 
    PRIMARY KEY (shop_num)
);

ALTER TABLE shop
    ADD CONSTRAINT FK_shop_company_num_company_company_num FOREIGN KEY (company_num)
        REFERENCES company (company_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class shopDto implements Serializable {

	private int company_num;
	private int shop_num;
	private String shop_name;
	private String shop_photo;
	private int shop_small_price;
	private int shop_medium_price;
	private int shop_large_price;
	private String shop_addr;
	private String shop_tel;
	private String shop_time;
	private String shop_etc;
	private String shop_content;
	
	public shopDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public shopDto(int company_num, int shop_num, String shop_name, String shop_photo, int shop_small_price,
			int shop_medium_price, int shop_large_price, String shop_addr, String shop_tel, String shop_time,
			String shop_etc, String shop_content) {
		super();
		this.company_num = company_num;
		this.shop_num = shop_num;
		this.shop_name = shop_name;
		this.shop_photo = shop_photo;
		this.shop_small_price = shop_small_price;
		this.shop_medium_price = shop_medium_price;
		this.shop_large_price = shop_large_price;
		this.shop_addr = shop_addr;
		this.shop_tel = shop_tel;
		this.shop_time = shop_time;
		this.shop_etc = shop_etc;
		this.shop_content = shop_content;
	}

	public int getCompany_num() {
		return company_num;
	}

	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}

	public int getShop_num() {
		return shop_num;
	}

	public void setShop_num(int shop_num) {
		this.shop_num = shop_num;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_photo() {
		return shop_photo;
	}

	public void setShop_photo(String shop_photo) {
		this.shop_photo = shop_photo;
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

	public String getShop_etc() {
		return shop_etc;
	}

	public void setShop_etc(String shop_etc) {
		this.shop_etc = shop_etc;
	}

	public String getShop_content() {
		return shop_content;
	}

	public void setShop_content(String shop_content) {
		this.shop_content = shop_content;
	}

	@Override
	public String toString() {
		return "shopDto [company_num=" + company_num + ", shop_num=" + shop_num + ", shop_name=" + shop_name
				+ ", shop_photo=" + shop_photo + ", shop_small_price=" + shop_small_price + ", shop_medium_price="
				+ shop_medium_price + ", shop_large_price=" + shop_large_price + ", shop_addr=" + shop_addr
				+ ", shop_tel=" + shop_tel + ", shop_time=" + shop_time + ", shop_etc=" + shop_etc + ", shop_content="
				+ shop_content + "]";
	}
	
	
	
	
	
}
