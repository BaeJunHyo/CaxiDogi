package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE pool
(
    `pool_num`      INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '수영장번호(SEQ)', 
    `company_num`   INT(5)         NOT NULL    COMMENT '업체번호', 
    `pool_price`    INT(6)         NOT NULL    COMMENT '시간당가격', 
    `pool_name`     VARCHAR(45)    NULL        COMMENT '수영장명', 
    `pool_open`     VARCHAR(45)    NULL        COMMENT '오픈시간', 
    `pool_close`    VARCHAR(45)    NULL        COMMENT '종료시간', 
    `pool_addr`     VARCHAR(45)    NOT NULL    COMMENT '주소', 
    `pool_tel`      VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `pool_shower`   INT(1)         NOT NULL    COMMENT '샤워실여부', 
    `pool_large`    INT(1)         NOT NULL    COMMENT '대형견사용', 
    `pool_parking`  INT(1)         NOT NULL    COMMENT '주차장', 
    PRIMARY KEY (pool_num)
);

ALTER TABLE pool
    ADD CONSTRAINT FK_pool_company_num_company_company_num FOREIGN KEY (company_num)
        REFERENCES company (company_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class poolDto implements Serializable {

	private int poll_num;
	private int company_num;
	private int poll_price;
	private String poll_name;
	private String poll_open;
	private String poll_close;
	private String poll_addr;
	private String poll_tel;
	private int poll_shower;
	private int poll_large;
	private int poll_parking;
	
	public poolDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public poolDto(int poll_num, int company_num, int poll_price, String poll_name, String poll_open, String poll_close,
			String poll_addr, String poll_tel, int poll_shower, int poll_large, int poll_parking) {
		super();
		this.poll_num = poll_num;
		this.company_num = company_num;
		this.poll_price = poll_price;
		this.poll_name = poll_name;
		this.poll_open = poll_open;
		this.poll_close = poll_close;
		this.poll_addr = poll_addr;
		this.poll_tel = poll_tel;
		this.poll_shower = poll_shower;
		this.poll_large = poll_large;
		this.poll_parking = poll_parking;
	}

	public int getPoll_num() {
		return poll_num;
	}

	public void setPoll_num(int poll_num) {
		this.poll_num = poll_num;
	}

	public int getCompany_num() {
		return company_num;
	}

	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}

	public int getPoll_price() {
		return poll_price;
	}

	public void setPoll_price(int poll_price) {
		this.poll_price = poll_price;
	}

	public String getPoll_name() {
		return poll_name;
	}

	public void setPoll_name(String poll_name) {
		this.poll_name = poll_name;
	}

	public String getPoll_open() {
		return poll_open;
	}

	public void setPoll_open(String poll_open) {
		this.poll_open = poll_open;
	}

	public String getPoll_close() {
		return poll_close;
	}

	public void setPoll_close(String poll_close) {
		this.poll_close = poll_close;
	}

	public String getPoll_addr() {
		return poll_addr;
	}

	public void setPoll_addr(String poll_addr) {
		this.poll_addr = poll_addr;
	}

	public String getPoll_tel() {
		return poll_tel;
	}

	public void setPoll_tel(String poll_tel) {
		this.poll_tel = poll_tel;
	}

	public int getPoll_shower() {
		return poll_shower;
	}

	public void setPoll_shower(int poll_shower) {
		this.poll_shower = poll_shower;
	}

	public int getPoll_large() {
		return poll_large;
	}

	public void setPoll_large(int poll_large) {
		this.poll_large = poll_large;
	}

	public int getPoll_parking() {
		return poll_parking;
	}

	public void setPoll_parking(int poll_parking) {
		this.poll_parking = poll_parking;
	}

	@Override
	public String toString() {
		return "poolDto [poll_num=" + poll_num + ", company_num=" + company_num + ", poll_price=" + poll_price
				+ ", poll_name=" + poll_name + ", poll_open=" + poll_open + ", poll_close=" + poll_close
				+ ", poll_addr=" + poll_addr + ", poll_tel=" + poll_tel + ", poll_shower=" + poll_shower
				+ ", poll_large=" + poll_large + ", poll_parking=" + poll_parking + "]";
	}
	
	
	
	
}
