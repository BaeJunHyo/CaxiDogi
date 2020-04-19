package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE company
(
    `company_num`       INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '업체번호(SEQ)', 
    `company_name`      VARCHAR(45)    NULL        COMMENT '업체이름', 
    `company_addr`      VARCHAR(45)    NULL        COMMENT '업체주소', 
    `company_tel`       VARCHAR(45)    NULL        COMMENT '전화번호', 
    `company_owner`     VARCHAR(45)    NULL        COMMENT '대표자명', 
    `company_number`    VARCHAR(45)    NULL        COMMENT '사업자번호', 
    `company_category`  INT(1)         NOT NULL    COMMENT '업체구분', 
    `company_seller`    VARCHAR(45)    NOT NULL    COMMENT '셀러(ID)', 
    PRIMARY KEY (company_num)
);

ALTER TABLE company
    ADD CONSTRAINT FK_company_company_seller_member_id FOREIGN KEY (company_seller)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class companyDto implements Serializable {

	private int company_num;
	private String company_name;
	private String company_addr;
	private String company_tel;
	private String company_owner;
	private String company_number;
	private int company_category;
	private String company_seller;
	private String company_key;
	
	public companyDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public companyDto(int company_num, String company_name, String company_addr, String company_tel,
			String company_owner, String company_number, int company_category, String company_seller,
			String company_key) {
		super();
		this.company_num = company_num;
		this.company_name = company_name;
		this.company_addr = company_addr;
		this.company_tel = company_tel;
		this.company_owner = company_owner;
		this.company_number = company_number;
		this.company_category = company_category;
		this.company_seller = company_seller;
		this.company_key = company_key;
	}

	
	public String getCompany_key() {
		return company_key;
	}

	public void setCompany_key(String company_key) {
		this.company_key = company_key;
	}

	public int getCompany_num() {
		return company_num;
	}

	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_addr() {
		return company_addr;
	}

	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}

	public String getCompany_tel() {
		return company_tel;
	}

	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}

	public String getCompany_owner() {
		return company_owner;
	}

	public void setCompany_owner(String company_owner) {
		this.company_owner = company_owner;
	}

	public String getCompany_number() {
		return company_number;
	}

	public void setCompany_number(String company_number) {
		this.company_number = company_number;
	}

	public int getCompany_category() {
		return company_category;
	}

	public void setCompany_category(int company_category) {
		this.company_category = company_category;
	}

	public String getCompany_seller() {
		return company_seller;
	}

	public void setCompany_seller(String company_seller) {
		this.company_seller = company_seller;
	}

	@Override
	public String toString() {
		return "companyDto [company_num=" + company_num + ", company_name=" + company_name + ", company_addr="
				+ company_addr + ", company_tel=" + company_tel + ", company_owner=" + company_owner
				+ ", company_number=" + company_number + ", company_category=" + company_category + ", company_seller="
				+ company_seller + "]";
	}
	
	
	
	
	
}
