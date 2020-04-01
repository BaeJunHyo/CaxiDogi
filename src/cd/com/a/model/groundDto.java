package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE ground
(
    `ground_num`      INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '운동장번호(SEQ)', 
    `company_num`     INT(5)         NOT NULL    COMMENT '업체번호', 
    `ground_price`    INT(6)         NOT NULL    COMMENT '시간당가격', 
    `ground_name`     VARCHAR(45)    NULL        COMMENT '운동장이름', 
    `ground_open`     VARCHAR(45)    NULL        COMMENT '오픈시간', 
    `ground_close`    VARCHAR(45)    NULL        COMMENT '종료시간', 
    `ground_addr`     VARCHAR(45)    NOT NULL    COMMENT '업체주소', 
    `ground_tel`      VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `ground_parking`  INT(1)         NULL        COMMENT '주차장', 
    PRIMARY KEY (ground_num)
);

ALTER TABLE ground
    ADD CONSTRAINT FK_ground_company_num_company_company_num FOREIGN KEY (company_num)
        REFERENCES company (company_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class groundDto implements Serializable {
	private int ground_num;
	private int company_num;
	private int ground_price;
	private String ground_name;
	private String ground_open;
	private String ground_close;
	private String ground_addr;
	private String ground_tel;
	private int ground_parking;
	
	public groundDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public groundDto(int ground_num, int company_num, int ground_price, String ground_name, String ground_open,
			String ground_close, String ground_addr, String ground_tel, int ground_parking) {
		super();
		this.ground_num = ground_num;
		this.company_num = company_num;
		this.ground_price = ground_price;
		this.ground_name = ground_name;
		this.ground_open = ground_open;
		this.ground_close = ground_close;
		this.ground_addr = ground_addr;
		this.ground_tel = ground_tel;
		this.ground_parking = ground_parking;
	}

	public int getGround_num() {
		return ground_num;
	}

	public void setGround_num(int ground_num) {
		this.ground_num = ground_num;
	}

	public int getCompany_num() {
		return company_num;
	}

	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}

	public int getGround_price() {
		return ground_price;
	}

	public void setGround_price(int ground_price) {
		this.ground_price = ground_price;
	}

	public String getGround_name() {
		return ground_name;
	}

	public void setGround_name(String ground_name) {
		this.ground_name = ground_name;
	}

	public String getGround_open() {
		return ground_open;
	}

	public void setGround_open(String ground_open) {
		this.ground_open = ground_open;
	}

	public String getGround_close() {
		return ground_close;
	}

	public void setGround_close(String ground_close) {
		this.ground_close = ground_close;
	}

	public String getGround_addr() {
		return ground_addr;
	}

	public void setGround_addr(String ground_addr) {
		this.ground_addr = ground_addr;
	}

	public String getGround_tel() {
		return ground_tel;
	}

	public void setGround_tel(String ground_tel) {
		this.ground_tel = ground_tel;
	}

	public int getGround_parking() {
		return ground_parking;
	}

	public void setGround_parking(int ground_parking) {
		this.ground_parking = ground_parking;
	}

	@Override
	public String toString() {
		return "groundDto [ground_num=" + ground_num + ", company_num=" + company_num + ", ground_price=" + ground_price
				+ ", ground_name=" + ground_name + ", ground_open=" + ground_open + ", ground_close=" + ground_close
				+ ", ground_addr=" + ground_addr + ", ground_tel=" + ground_tel + ", ground_parking=" + ground_parking
				+ "]";
	}
	
	
	
	
	
}
