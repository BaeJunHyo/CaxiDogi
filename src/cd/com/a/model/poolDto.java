package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE pool
(
    `pool_seq`      INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '수영장번호(SEQ)', 
    `pool_owner`    VARCHAR(45)    NOT NULL    COMMENT '대표자명', 
    `pool_number`   VARCHAR(45)    NOT NULL    COMMENT '사업자등록번호', 
    `pool_addr`     VARCHAR(45)    NOT NULL    COMMENT '주소', 
    `pool_tel`      VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `id`            VARCHAR(45)    NOT NULL    COMMENT 'seller id', 
    `pool_auth`     INT(1)         NOT NULL    COMMENT '승인여부', 
    `pool_name`     VARCHAR(45)    NOT NULL    COMMENT '수영장명', 
    `pool_time`     VARCHAR(45)    NOT NULL    COMMENT '영업시간', 
    `pool_price`    INT(6)         NOT NULL    COMMENT '시간당 가격', 
    `pool_shower`   INT(1)         NOT NULL    COMMENT '샤워실 여부', 
    `pool_large`    INT(1)         NOT NULL    COMMENT '대형견사용여부', 
    `pool_parking`  INT(1)         NOT NULL    COMMENT '주차장여부', 
    `pool_content`  TEXT           NOT NULL    COMMENT '컨텐츠', 
    `pool_photo`    VARCHAR(45)    NULL        COMMENT '수영장사진', 
    PRIMARY KEY (pool_seq)
);

ALTER TABLE pool
    ADD CONSTRAINT FK_pool_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

*/
public class poolDto implements Serializable {

	private int pool_seq;			// 수영장번호
	private String pool_owner;		// 대표자명
	private String pool_number;		// 사업자 등록번호
	private String pool_addr;		// 주소
	private String pool_tel;		// 연락처
	private int mem_seq;				// seller id
	private int pool_auth;			// 승인여부
	private String pool_name;		// 수영장명
	private String pool_time;		// 영업시간
	private int pool_price;			// 시간당 가격
	private int pool_shower;		// 샤워실 여부
	private int pool_large;			// 대형견 사용여부
	private int pool_parking;		// 주자창 여부
	private String pool_content;	// content
	private String pool_photo;		// 수영장 사진
	
	public poolDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public poolDto(int pool_seq, String pool_owner, String pool_number, String pool_addr, String pool_tel, int mem_seq,
			int pool_auth, String pool_name, String pool_time, int pool_price, int pool_shower, int pool_large,
			int pool_parking, String pool_content, String pool_photo) {
		super();
		this.pool_seq = pool_seq;
		this.pool_owner = pool_owner;
		this.pool_number = pool_number;
		this.pool_addr = pool_addr;
		this.pool_tel = pool_tel;
		this.mem_seq = mem_seq;
		this.pool_auth = pool_auth;
		this.pool_name = pool_name;
		this.pool_time = pool_time;
		this.pool_price = pool_price;
		this.pool_shower = pool_shower;
		this.pool_large = pool_large;
		this.pool_parking = pool_parking;
		this.pool_content = pool_content;
		this.pool_photo = pool_photo;
	}

	public int getPool_seq() {
		return pool_seq;
	}

	public void setPool_seq(int pool_seq) {
		this.pool_seq = pool_seq;
	}

	public String getPool_owner() {
		return pool_owner;
	}

	public void setPool_owner(String pool_owner) {
		this.pool_owner = pool_owner;
	}

	public String getPool_number() {
		return pool_number;
	}

	public void setPool_number(String pool_number) {
		this.pool_number = pool_number;
	}

	public String getPool_addr() {
		return pool_addr;
	}

	public void setPool_addr(String pool_addr) {
		this.pool_addr = pool_addr;
	}

	public String getPool_tel() {
		return pool_tel;
	}

	public void setPool_tel(String pool_tel) {
		this.pool_tel = pool_tel;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public int getPool_auth() {
		return pool_auth;
	}

	public void setPool_auth(int pool_auth) {
		this.pool_auth = pool_auth;
	}

	public String getPool_name() {
		return pool_name;
	}

	public void setPool_name(String pool_name) {
		this.pool_name = pool_name;
	}

	public String getPool_time() {
		return pool_time;
	}

	public void setPool_time(String pool_time) {
		this.pool_time = pool_time;
	}

	public int getPool_price() {
		return pool_price;
	}

	public void setPool_price(int pool_price) {
		this.pool_price = pool_price;
	}

	public int getPool_shower() {
		return pool_shower;
	}

	public void setPool_shower(int pool_shower) {
		this.pool_shower = pool_shower;
	}

	public int getPool_large() {
		return pool_large;
	}

	public void setPool_large(int pool_large) {
		this.pool_large = pool_large;
	}

	public int getPool_parking() {
		return pool_parking;
	}

	public void setPool_parking(int pool_parking) {
		this.pool_parking = pool_parking;
	}

	public String getPool_content() {
		return pool_content;
	}

	public void setPool_content(String pool_content) {
		this.pool_content = pool_content;
	}

	public String getPool_photo() {
		return pool_photo;
	}

	public void setPool_photo(String pool_photo) {
		this.pool_photo = pool_photo;
	}

	@Override
	public String toString() {
		return "poolDto [pool_seq=" + pool_seq + ", pool_owner=" + pool_owner + ", pool_number=" + pool_number
				+ ", pool_addr=" + pool_addr + ", pool_tel=" + pool_tel + ", mem_seq=" + mem_seq + ", pool_auth="
				+ pool_auth + ", pool_name=" + pool_name + ", pool_time=" + pool_time + ", pool_price=" + pool_price
				+ ", pool_shower=" + pool_shower + ", pool_large=" + pool_large + ", pool_parking=" + pool_parking
				+ ", pool_content=" + pool_content + ", pool_photo=" + pool_photo + "]";
	}

	
}


