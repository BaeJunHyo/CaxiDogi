package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE ground
(
    `ground_seq`      INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '운동장번호(SEQ)', 
    `ground_owner`    VARCHAR(45)    NOT NULL    COMMENT '대표자명', 
    `ground_number`   VARCHAR(45)    NOT NULL    COMMENT '사업자등록번호', 
    `ground_addr`     VARCHAR(45)    NOT NULL    COMMENT '주소', 
    `ground_tel`      VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `mem_seq`         INT			 NOT NULL    COMMENT 'seller id', 
    `ground_auth`     INT(1)         NOT NULL    COMMENT '승인여부', 
    `ground_name`     VARCHAR(45)    NOT NULL    COMMENT '운동장명', 
    `ground_time`     VARCHAR(45)    NOT NULL    COMMENT '영업시간', 
    `ground_price`    INT(6)         NOT NULL    COMMENT '시간당가격', 
    `ground_parking`  INT(1)         NOT NULL    COMMENT '주차장여부', 
    `ground_content`  TEXT           NOT NULL    COMMENT '컨텐츠', 
    `ground_photo`    VARCHAR(45)    NULL        COMMENT '운동장사진', 
    PRIMARY KEY (ground_seq)
);

ALTER TABLE ground
    ADD CONSTRAINT FK_ground_id_member_id FOREIGN KEY (mem_seq)
        REFERENCES member (mem_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

*/
public class groundDto implements Serializable {
	private int ground_seq;				// 운동장번호
	private String ground_owner;		// 대표자명
	private String ground_number;		// 사업자등록번호
	private String ground_addr;			// 주소
	private String ground_tel;			// 연락처
	private int mem_seq;					// seller id
	private int ground_auth;			// 승인여부
	private String ground_name;			// 운동장명
	private String ground_open;			// 영업시간
	private int ground_price;			// 시간당가격
	private int ground_parking;			// 주차장여부
	private String ground_content;		// content
	private String ground_photo;		// 운동장 사진
	
	public groundDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public groundDto(int ground_seq, String ground_owner, String ground_number, String ground_addr, String ground_tel,
			int mem_seq, int ground_auth, String ground_name, String ground_open, int ground_price, int ground_parking,
			String ground_content, String ground_photo) {
		super();
		this.ground_seq = ground_seq;
		this.ground_owner = ground_owner;
		this.ground_number = ground_number;
		this.ground_addr = ground_addr;
		this.ground_tel = ground_tel;
		this.mem_seq = mem_seq;
		this.ground_auth = ground_auth;
		this.ground_name = ground_name;
		this.ground_open = ground_open;
		this.ground_price = ground_price;
		this.ground_parking = ground_parking;
		this.ground_content = ground_content;
		this.ground_photo = ground_photo;
	}

	public int getGround_seq() {
		return ground_seq;
	}

	public void setGround_seq(int ground_seq) {
		this.ground_seq = ground_seq;
	}

	public String getGround_owner() {
		return ground_owner;
	}

	public void setGround_owner(String ground_owner) {
		this.ground_owner = ground_owner;
	}

	public String getGround_number() {
		return ground_number;
	}

	public void setGround_number(String ground_number) {
		this.ground_number = ground_number;
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

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public int getGround_auth() {
		return ground_auth;
	}

	public void setGround_auth(int ground_auth) {
		this.ground_auth = ground_auth;
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

	public int getGround_price() {
		return ground_price;
	}

	public void setGround_price(int ground_price) {
		this.ground_price = ground_price;
	}

	public int getGround_parking() {
		return ground_parking;
	}

	public void setGround_parking(int ground_parking) {
		this.ground_parking = ground_parking;
	}

	public String getGround_content() {
		return ground_content;
	}

	public void setGround_content(String ground_content) {
		this.ground_content = ground_content;
	}

	public String getGround_photo() {
		return ground_photo;
	}

	public void setGround_photo(String ground_photo) {
		this.ground_photo = ground_photo;
	}

	@Override
	public String toString() {
		return "groundDto [ground_seq=" + ground_seq + ", ground_owner=" + ground_owner + ", ground_number="
				+ ground_number + ", ground_addr=" + ground_addr + ", ground_tel=" + ground_tel + ", mem_seq=" + mem_seq
				+ ", ground_auth=" + ground_auth + ", ground_name=" + ground_name + ", ground_open=" + ground_open
				+ ", ground_price=" + ground_price + ", ground_parking=" + ground_parking + ", ground_content="
				+ ground_content + ", ground_photo=" + ground_photo + "]";
	}
	
	
}