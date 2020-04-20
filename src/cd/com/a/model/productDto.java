package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE product
(
    `product_num`        INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '�젣�뭹SEQ', 
    `product_name`       VARCHAR(45)    NOT NULL    COMMENT '�젣�뭹紐�', 
    `product_readcount`  INT(7)         NULL        COMMENT '議고쉶�닔', 
    `product_img`        TEXT           NOT NULL    COMMENT '�씠誘몄�', 
    `product_price`      INT(6)         NOT NULL    COMMENT '媛�寃�', 
    `product_group`      INT(2)         NOT NULL    COMMENT '洹몃９', 
    `product_sub_group`  INT(2)         NULL        COMMENT '�꽌釉뚭렇猷�', 
    `product_code`       VARCHAR(45)    NOT NULL    COMMENT '�젣�뭹肄붾뱶', 
    PRIMARY KEY (product_num)
);
*/
public class productDto implements Serializable {
	private int product_num;	// 제품SEQ
	private String product_name;	// 제품명
	private String product_code;	// 제품코드
	private int product_readcount;	// 조회수
	private String product_img;		// 이미지
	private int product_price;		// 가격
	private String product_group;		// 그룹
	private String product_sub_group;	// 서브그룹
	private String product_content;	// 내용
	private String product_regi_date;	// 제품등록날짜
	
	private String product_brand;	// 브랜드회사명
	private int product_sale;		// 판매여부
	private int product_hidden;		// 노출여부
	private int product_stock;		// 현재재고량
	private int product_delivery_auth;	// 배송비
	private int product_del;		// 제품 삭제
	
	   
	public productDto() {
		super();
	}


	public productDto(int product_num, String product_name, String product_code, int product_readcount,
			String product_img, int product_price, String product_group, String product_sub_group,
			String product_content, String product_regi_date, String product_brand, int product_sale,
			int product_hidden, int product_stock, int product_delivery_auth, int product_del) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_code = product_code;
		this.product_readcount = product_readcount;
		this.product_img = product_img;
		this.product_price = product_price;
		this.product_group = product_group;
		this.product_sub_group = product_sub_group;
		this.product_content = product_content;
		this.product_regi_date = product_regi_date;
		this.product_brand = product_brand;
		this.product_sale = product_sale;
		this.product_hidden = product_hidden;
		this.product_stock = product_stock;
		this.product_delivery_auth = product_delivery_auth;
		this.product_del = product_del;
	}


	public int getProduct_num() {
		return product_num;
	}


	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getProduct_code() {
		return product_code;
	}


	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}


	public int getProduct_readcount() {
		return product_readcount;
	}


	public void setProduct_readcount(int product_readcount) {
		this.product_readcount = product_readcount;
	}


	public String getProduct_img() {
		return product_img;
	}


	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}


	public String getProduct_group() {
		return product_group;
	}


	public void setProduct_group(String product_group) {
		this.product_group = product_group;
	}


	public String getProduct_sub_group() {
		return product_sub_group;
	}


	public void setProduct_sub_group(String product_sub_group) {
		this.product_sub_group = product_sub_group;
	}


	public String getProduct_content() {
		return product_content;
	}


	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}


	public String getProduct_regi_date() {
		return product_regi_date;
	}


	public void setProduct_regi_date(String product_regi_date) {
		this.product_regi_date = product_regi_date;
	}


	public String getProduct_brand() {
		return product_brand;
	}


	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}


	public int getProduct_sale() {
		return product_sale;
	}


	public void setProduct_sale(int product_sale) {
		this.product_sale = product_sale;
	}


	public int getProduct_hidden() {
		return product_hidden;
	}


	public void setProduct_hidden(int product_hidden) {
		this.product_hidden = product_hidden;
	}


	public int getProduct_stock() {
		return product_stock;
	}


	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}


	public int getProduct_delivery_auth() {
		return product_delivery_auth;
	}


	public void setProduct_delivery_auth(int product_delivery_auth) {
		this.product_delivery_auth = product_delivery_auth;
	}


	public int getProduct_del() {
		return product_del;
	}


	public void setProduct_del(int product_del) {
		this.product_del = product_del;
	}


	@Override
	public String toString() {
		return "productDto [product_num=" + product_num + ", product_name=" + product_name + ", product_code="
				+ product_code + ", product_readcount=" + product_readcount + ", product_img=" + product_img
				+ ", product_price=" + product_price + ", product_group=" + product_group + ", product_sub_group="
				+ product_sub_group + ", product_content=" + product_content + ", product_regi_date="
				+ product_regi_date + ", product_brand=" + product_brand + ", product_sale=" + product_sale
				+ ", product_hidden=" + product_hidden + ", product_stock=" + product_stock + ", product_delivery_auth="
				+ product_delivery_auth + ", product_del=" + product_del + "]";
	}


}
