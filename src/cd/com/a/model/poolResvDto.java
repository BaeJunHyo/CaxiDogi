package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE pool_reservation
(
    `pool_resv_seq`          INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '예약번호(SEQ)', 
    `pool_seq`               INT(5)         NOT NULL    COMMENT '수영장번호(SEQ)', 
    `pool_resv_user`         INT(3)         NOT NULL    COMMENT '사용인원수', 
    `pool_resv_pet`          INT(3)         NOT NULL    COMMENT '사용펫수', 
    `pool_resv_time`         VARCHAR(45)         NOT NULL    COMMENT '선택시간', 
    `pool_resv_ydate`        DATETIME       NOT NULL    COMMENT '예약일', 
    `pool_resv_sdate`        VARCHAR(45)    NOT NULL    COMMENT '이용일', 
    `pool_resv_tel`          VARCHAR(45)    NULL        COMMENT '연락처', 
    `pool_resv_name`         VARCHAR(45)    NULL        COMMENT '예약자명', 
    `pool_resv_payment`      INT(1)         NOT NULL    COMMENT '결재여부', 
    `pool_resv_total_price`  INT(7)         NULL        COMMENT '최종금액', 
    `pool_resv_price`        INT(7)         NULL        COMMENT '가금액', 
    `id`                     VARCHAR(45)    NOT NULL    COMMENT '예약자ID', 
    PRIMARY KEY (pool_resv_seq)
);

ALTER TABLE pool_reservation
    ADD CONSTRAINT FK_pool_reservation_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE pool_reservation
    ADD CONSTRAINT FK_pool_reservation_pool_seq_pool_pool_seq FOREIGN KEY (pool_seq)
        REFERENCES pool (pool_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class poolResvDto implements Serializable {
	
	   private int pool_resv_seq;			// 예약번호
	   private int pool_seq;				// 수영장번호
	   private int pool_resv_user;			// 사용인원수
	   private int pool_resv_pet;			// 사용펫수
	   private String pool_resv_time;			// 선택시간
	   private String pool_resv_ydate;		// 예약일
	   private String pool_resv_sdate;		// 이용일
	   private String pool_resv_tel;		// 연락처
	   private String pool_resv_name;		// 예약자명
	   private int pool_resv_payment;		// 결제여부
	   private int pool_resv_total_price;	// 최종금액
	   private int pool_resv_price;			// 가금액
	   private int mem_seq;					// 예약자 아이디
	   private String pool_resv_comment;	//코멘트
	   private int pool_resv_auth;				//예약 상태
	   
	public poolResvDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPool_resv_seq() {
		return pool_resv_seq;
	}

	public void setPool_resv_seq(int pool_resv_seq) {
		this.pool_resv_seq = pool_resv_seq;
	}

	public int getPool_seq() {
		return pool_seq;
	}

	public void setPool_seq(int pool_seq) {
		this.pool_seq = pool_seq;
	}

	public int getPool_resv_user() {
		return pool_resv_user;
	}

	public void setPool_resv_user(int pool_resv_user) {
		this.pool_resv_user = pool_resv_user;
	}

	public int getPool_resv_pet() {
		return pool_resv_pet;
	}

	public void setPool_resv_pet(int pool_resv_pet) {
		this.pool_resv_pet = pool_resv_pet;
	}

	public String getPool_resv_time() {
		return pool_resv_time;
	}

	public void setPool_resv_time(String pool_resv_time) {
		this.pool_resv_time = pool_resv_time;
	}

	public String getPool_resv_ydate() {
		return pool_resv_ydate;
	}

	public void setPool_resv_ydate(String pool_resv_ydate) {
		this.pool_resv_ydate = pool_resv_ydate;
	}

	public String getPool_resv_sdate() {
		return pool_resv_sdate;
	}

	public void setPool_resv_sdate(String pool_resv_sdate) {
		this.pool_resv_sdate = pool_resv_sdate;
	}

	public String getPool_resv_tel() {
		return pool_resv_tel;
	}

	public void setPool_resv_tel(String pool_resv_tel) {
		this.pool_resv_tel = pool_resv_tel;
	}

	public String getPool_resv_name() {
		return pool_resv_name;
	}

	public void setPool_resv_name(String pool_resv_name) {
		this.pool_resv_name = pool_resv_name;
	}

	public int getPool_resv_payment() {
		return pool_resv_payment;
	}

	public void setPool_resv_payment(int pool_resv_payment) {
		this.pool_resv_payment = pool_resv_payment;
	}

	public int getPool_resv_total_price() {
		return pool_resv_total_price;
	}

	public void setPool_resv_total_price(int pool_resv_total_price) {
		this.pool_resv_total_price = pool_resv_total_price;
	}

	public int getPool_resv_price() {
		return pool_resv_price;
	}

	public void setPool_resv_price(int pool_resv_price) {
		this.pool_resv_price = pool_resv_price;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getPool_resv_comment() {
		return pool_resv_comment;
	}

	public void setPool_resv_comment(String pool_resv_comment) {
		this.pool_resv_comment = pool_resv_comment;
	}

	public int getPool_resv_auth() {
		return pool_resv_auth;
	}

	public void setPool_resv_auth(int pool_resv_auth) {
		this.pool_resv_auth = pool_resv_auth;
	}


	public poolResvDto(int pool_resv_seq, int pool_seq, int pool_resv_user, int pool_resv_pet, String pool_resv_time,
			String pool_resv_ydate, String pool_resv_sdate, String pool_resv_tel, String pool_resv_name,
			int pool_resv_payment, int pool_resv_total_price, int pool_resv_price, int mem_seq,
			String pool_resv_comment, int pool_resv_auth) {
		super();
		this.pool_resv_seq = pool_resv_seq;
		this.pool_seq = pool_seq;
		this.pool_resv_user = pool_resv_user;
		this.pool_resv_pet = pool_resv_pet;
		this.pool_resv_time = pool_resv_time;
		this.pool_resv_ydate = pool_resv_ydate;
		this.pool_resv_sdate = pool_resv_sdate;
		this.pool_resv_tel = pool_resv_tel;
		this.pool_resv_name = pool_resv_name;
		this.pool_resv_payment = pool_resv_payment;
		this.pool_resv_total_price = pool_resv_total_price;
		this.pool_resv_price = pool_resv_price;
		this.mem_seq = mem_seq;
		this.pool_resv_comment = pool_resv_comment;
		this.pool_resv_auth = pool_resv_auth;
	}

	@Override
	public String toString() {
		return "poolResvDto [pool_resv_seq=" + pool_resv_seq + ", pool_seq=" + pool_seq + ", pool_resv_user="
				+ pool_resv_user + ", pool_resv_pet=" + pool_resv_pet + ", pool_resv_time=" + pool_resv_time
				+ ", pool_resv_ydate=" + pool_resv_ydate + ", pool_resv_sdate=" + pool_resv_sdate + ", pool_resv_tel="
				+ pool_resv_tel + ", pool_resv_name=" + pool_resv_name + ", pool_resv_payment=" + pool_resv_payment
				+ ", pool_resv_total_price=" + pool_resv_total_price + ", pool_resv_price=" + pool_resv_price
				+ ", mem_seq=" + mem_seq + ", pool_resv_comment=" + pool_resv_comment + ", pool_resv_auth="
				+ pool_resv_auth + "]";
	}

	

	
	
}
