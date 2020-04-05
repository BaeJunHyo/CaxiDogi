package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE shop_designer
(
    `company_num`   INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '업체번호(SEQ)', 
    `shop_num`      INT(5)         NOT NULL    COMMENT '샵번호(SEQ)', 
    `design_num`    INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '디자이너번호(SEQ)', 
    `design_price`  INT(7)         NOT NULL    COMMENT '추가금', 
    `design_name`   VARCHAR(45)    NOT NULL    COMMENT '디자이너명', 
    `design_time`   TEXT           NOT NULL    COMMENT '작업시간대', 
    PRIMARY KEY (design_num)
);

ALTER TABLE shop_designer
    ADD CONSTRAINT FK_shop_designer_company_num_company_company_num FOREIGN KEY (company_num)
        REFERENCES company (company_num) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE shop_designer
    ADD CONSTRAINT FK_shop_designer_shop_num_shop_shop_num FOREIGN KEY (shop_num)
        REFERENCES shop (shop_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class shopDesignerDto implements Serializable {

	private int company_num;
	private int shop_num;
	private int design_num;
	private int design_price;
	private String design_name;
	private String design_time;
	
	public shopDesignerDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public shopDesignerDto(int company_num, int shop_num, int design_num, int design_price, String design_name,
			String design_time) {
		super();
		this.company_num = company_num;
		this.shop_num = shop_num;
		this.design_num = design_num;
		this.design_price = design_price;
		this.design_name = design_name;
		this.design_time = design_time;
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

	public int getDesign_num() {
		return design_num;
	}

	public void setDesign_num(int design_num) {
		this.design_num = design_num;
	}

	public int getDesign_price() {
		return design_price;
	}

	public void setDesign_price(int design_price) {
		this.design_price = design_price;
	}

	public String getDesign_name() {
		return design_name;
	}

	public void setDesign_name(String design_name) {
		this.design_name = design_name;
	}

	public String getDesign_time() {
		return design_time;
	}

	public void setDesign_time(String design_time) {
		this.design_time = design_time;
	}

	@Override
	public String toString() {
		return "shopDesignerDto [company_num=" + company_num + ", shop_num=" + shop_num + ", design_num=" + design_num
				+ ", design_price=" + design_price + ", design_name=" + design_name + ", design_time=" + design_time
				+ "]";
	}
	
	
	
	
	
}
