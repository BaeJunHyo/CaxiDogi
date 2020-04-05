package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE shop_reservation
(
    `company_num`      INT(5)         NOT NULL    COMMENT '업체번호(SEQ)', 
    `shop_resv_num`    INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '예약번호(SEQ)', 
    `shop_num`         INT(5)         NOT NULL    COMMENT '샵번호(SEQ)', 
    `design_num`       INT(5)         NOT NULL    COMMENT '디자이너번호(SEQ)', 
    `id`               VARCHAR(45)    NOT NULL    COMMENT '예약아이디', 
    `shop_resv_time`   VARCHAR(45)    NOT NULL    COMMENT '예약시간', 
    `shop_resv_rday`   VARCHAR(45)    NOT NULL    COMMENT '예약일', 
    `shop_resv_day`    DATETIME       NOT NULL    COMMENT '예약날짜', 
    `shop_resv_size`   INT(1)         NOT NULL    COMMENT '견종', 
    `shop_resv_name`   VARCHAR(45)    NOT NULL    COMMENT '예약자명', 
    `shop_resv_tel`    VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `shop_resv_price`  INT(7)         NOT NULL    COMMENT '가금액', 
    `shop_resv_auth`   INT(1)         NOT NULL    COMMENT '취소여부', 
    PRIMARY KEY (shop_resv_num)
);

ALTER TABLE shop_reservation
    ADD CONSTRAINT FK_shop_reservation_company_num_company_company_num FOREIGN KEY (company_num)
        REFERENCES company (company_num) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE shop_reservation
    ADD CONSTRAINT FK_shop_reservation_shop_num_shop_shop_num FOREIGN KEY (shop_num)
        REFERENCES shop (shop_num) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE shop_reservation
    ADD CONSTRAINT FK_shop_reservation_design_num_shop_designer_design_num FOREIGN KEY (design_num)
        REFERENCES shop_designer (design_num) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE shop_reservation
    ADD CONSTRAINT FK_shop_reservation_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT; 
 
 */
public class shopResvDto implements Serializable {

	private int company_num;
	private int shop_resv_num;
	private int shop_num;
	private int design_num;
	private String id;
	private String shop_resv_time;
	private String shop_resv_rday;
	private String shop_resv_day;
	private int shop_resv_size;
	private String shop_resv_name;
	private String shop_resv_tel;
	private int shop_resv_price;
	private int shop_resv_auth;
	
	public shopResvDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public shopResvDto(int company_num, int shop_resv_num, int shop_num, int design_num, String id,
			String shop_resv_time, String shop_resv_rday, String shop_resv_day, int shop_resv_size,
			String shop_resv_name, String shop_resv_tel, int shop_resv_price, int shop_resv_auth) {
		super();
		this.company_num = company_num;
		this.shop_resv_num = shop_resv_num;
		this.shop_num = shop_num;
		this.design_num = design_num;
		this.id = id;
		this.shop_resv_time = shop_resv_time;
		this.shop_resv_rday = shop_resv_rday;
		this.shop_resv_day = shop_resv_day;
		this.shop_resv_size = shop_resv_size;
		this.shop_resv_name = shop_resv_name;
		this.shop_resv_tel = shop_resv_tel;
		this.shop_resv_price = shop_resv_price;
		this.shop_resv_auth = shop_resv_auth;
	}

	public int getCompany_num() {
		return company_num;
	}

	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}

	public int getShop_resv_num() {
		return shop_resv_num;
	}

	public void setShop_resv_num(int shop_resv_num) {
		this.shop_resv_num = shop_resv_num;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "shopResvDto [company_num=" + company_num + ", shop_resv_num=" + shop_resv_num + ", shop_num=" + shop_num
				+ ", design_num=" + design_num + ", id=" + id + ", shop_resv_time=" + shop_resv_time
				+ ", shop_resv_rday=" + shop_resv_rday + ", shop_resv_day=" + shop_resv_day + ", shop_resv_size="
				+ shop_resv_size + ", shop_resv_name=" + shop_resv_name + ", shop_resv_tel=" + shop_resv_tel
				+ ", shop_resv_price=" + shop_resv_price + ", shop_resv_auth=" + shop_resv_auth + "]";
	}
	
	
	
	
}
