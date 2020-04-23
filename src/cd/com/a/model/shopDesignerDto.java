package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE shop_designer
(
    `shop_seq`      INT(5)         NOT NULL    COMMENT '샵번호(SEQ)', 
    `design_seq`    INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '디자이너번호(SEQ)', 
    `design_price`  INT(7)         NOT NULL    COMMENT '추가금', 
    `design_name`   VARCHAR(45)    NOT NULL    COMMENT '디자이너명', 
    `design_time`   TEXT           NOT NULL    COMMENT '작업시간대', 
    PRIMARY KEY (design_seq)
);

ALTER TABLE shop_designer
    ADD CONSTRAINT FK_shop_designer_shop_seq_shop_shop_seq FOREIGN KEY (shop_seq)
        REFERENCES shop (shop_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class shopDesignerDto implements Serializable {

	private int shop_seq;				// 샵번호(seq)
	private int design_seq;				// 디자이너 번호(seq)
	private int design_price;			// 디자이너 추가금
	private String design_name;			// 디자이너 명
	private String design_time;			// 디자인 작업시간대
	private int design_auth;			// 재직중(0), 퇴사(1), 정지(2) 
	
	public shopDesignerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public shopDesignerDto(int shop_seq, int design_seq, int design_price, String design_name, String design_time,
			int design_auth) {
		super();
		this.shop_seq = shop_seq;
		this.design_seq = design_seq;
		this.design_price = design_price;
		this.design_name = design_name;
		this.design_time = design_time;
		this.design_auth = design_auth;
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
	public int getDesign_auth() {
		return design_auth;
	}
	public void setDesign_auth(int design_auth) {
		this.design_auth = design_auth;
	}
	@Override
	public String toString() {
		return "shopDesignerDto [shop_seq=" + shop_seq + ", design_seq=" + design_seq + ", design_price=" + design_price
				+ ", design_name=" + design_name + ", design_time=" + design_time + ", design_auth=" + design_auth
				+ "]";
	}

	
	
}
