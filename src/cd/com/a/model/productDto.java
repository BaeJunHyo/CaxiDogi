package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE product
(
    `product_num`        INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '제품SEQ', 
    `product_name`       VARCHAR(45)    NOT NULL    COMMENT '제품명', 
    `product_readcount`  INT(7)         NULL        COMMENT '조회수', 
    `product_img`        TEXT           NOT NULL    COMMENT '이미지', 
    `product_price`      INT(6)         NOT NULL    COMMENT '가격', 
    `product_group`      INT(2)         NOT NULL    COMMENT '그룹', 
    `product_sub_group`  INT(2)         NULL        COMMENT '서브그룹', 
    `product_code`       VARCHAR(45)    NOT NULL    COMMENT '제품코드', 
    PRIMARY KEY (product_num)
);
*/
public class productDto implements Serializable {
	private int product_num;
	   private String product_name;
	   private String product_code;
	   private int product_readcount;
	   private String product_img;
	   private int product_price;
	   private int product_group;
	   private int product_sub_group;
	   
	public productDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public productDto(int product_num, String product_name, String product_code, int product_readcount,
			String product_img, int product_price, int product_group, int product_sub_group) {
		super();
		this.product_num = product_num;
		this.product_name = product_name;
		this.product_code = product_code;
		this.product_readcount = product_readcount;
		this.product_img = product_img;
		this.product_price = product_price;
		this.product_group = product_group;
		this.product_sub_group = product_sub_group;
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

	@Override
	public String toString() {
		return "productDto [product_num=" + product_num + ", product_name=" + product_name + ", product_code="
				+ product_code + ", product_readcount=" + product_readcount + ", product_img=" + product_img
				+ ", product_price=" + product_price + ", product_group=" + product_group + ", product_sub_group="
				+ product_sub_group + "]";
	}
	
	
	   
	   
}
