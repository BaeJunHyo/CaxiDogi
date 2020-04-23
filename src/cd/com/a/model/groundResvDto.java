package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE ground_reservation
(
   `ground_resv_seq`          INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '예약번호(SEQ)', 
   `ground_seq`               INT(5)         NOT NULL    COMMENT '운동장번호(SEQ)', 
   `ground_resv_user`         INT(3)         NOT NULL    COMMENT '사용인원수', 
   `ground_resv_pet`          INT(3)         NOT NULL    COMMENT '사용펫수', 
   `ground_resv_time`         VARCHAR(45)         NOT NULL    COMMENT '선택시간', 
   `ground_resv_ydate`        DATETIME       NOT NULL    COMMENT '예약일', 
   `ground_resv_sdate`        VARCHAR(45)    NOT NULL    COMMENT '사용일', 
   `ground_resv_tel`          VARCHAR(45)    NULL        COMMENT '연락처', 
   `ground_resv_name`         VARCHAR(45)    NULL        COMMENT '예약자명', 
   `ground_resv_payment`      INT(1)         NOT NULL    COMMENT '결재여부', 
   `ground_resv_total_price`  INT(7)         NULL        COMMENT '최종금액', 
   `ground_resv_price`        INT(7)         NULL        COMMENT '가금액', 
   `mem_seq`                  INT   		 NOT NULL    COMMENT '예약자ID', 
   PRIMARY KEY (ground_resv_seq)
);

ALTER TABLE ground_reservation
   ADD CONSTRAINT FK_ground_reservation_id_member_id FOREIGN KEY (mem_seq)
       REFERENCES member (mem_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ground_reservation
   ADD CONSTRAINT FK_ground_reservation_ground_seq_ground_ground_seq FOREIGN KEY (ground_seq)
       REFERENCES ground (ground_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

*/
public class groundResvDto implements Serializable {
	   
	   private int ground_resv_seq;			// 예약번호
	   private int ground_seq;				// 운동장 번호
	   private int ground_resv_user;		// 사용인원수
	   private int ground_resv_pet;			// 사용펫수
	   private String ground_resv_time;		// 선택시간
	   private String ground_resv_ydate;	// 예약일
	   private String ground_resv_sdate;	// 사용일
	   private String ground_resv_tel;		// 연락처
	   private String ground_resv_name;		// 예약자명
	   private int ground_resv_payment;		// 결제여부
	   private int ground_resv_total_price;	// 최종금액
	   private int ground_resv_price;		// 가금액
	   private int mem_seq;					// 에약자 아이디
	   private String ground_resv_coment; 	//예약자 코멘트
	   private int ground_resv_auth; 		//예약 상태
	   
	public groundResvDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getGround_resv_seq() {
		return ground_resv_seq;
	}

	public void setGround_resv_seq(int ground_resv_seq) {
		this.ground_resv_seq = ground_resv_seq;
	}

	public int getGround_seq() {
		return ground_seq;
	}

	public void setGround_seq(int ground_seq) {
		this.ground_seq = ground_seq;
	}

	public int getGround_resv_user() {
		return ground_resv_user;
	}

	public void setGround_resv_user(int ground_resv_user) {
		this.ground_resv_user = ground_resv_user;
	}

	public int getGround_resv_pet() {
		return ground_resv_pet;
	}

	public void setGround_resv_pet(int ground_resv_pet) {
		this.ground_resv_pet = ground_resv_pet;
	}

	public String getGround_resv_time() {
		return ground_resv_time;
	}

	public void setGround_resv_time(String ground_resv_time) {
		this.ground_resv_time = ground_resv_time;
	}

	public String getGround_resv_ydate() {
		return ground_resv_ydate;
	}

	public void setGround_resv_ydate(String ground_resv_ydate) {
		this.ground_resv_ydate = ground_resv_ydate;
	}

	public String getGround_resv_sdate() {
		return ground_resv_sdate;
	}

	public void setGround_resv_sdate(String ground_resv_sdate) {
		this.ground_resv_sdate = ground_resv_sdate;
	}

	public String getGround_resv_tel() {
		return ground_resv_tel;
	}

	public void setGround_resv_tel(String ground_resv_tel) {
		this.ground_resv_tel = ground_resv_tel;
	}

	public String getGround_resv_name() {
		return ground_resv_name;
	}

	public void setGround_resv_name(String ground_resv_name) {
		this.ground_resv_name = ground_resv_name;
	}

	public int getGround_resv_payment() {
		return ground_resv_payment;
	}

	public void setGround_resv_payment(int ground_resv_payment) {
		this.ground_resv_payment = ground_resv_payment;
	}

	public int getGround_resv_total_price() {
		return ground_resv_total_price;
	}

	public void setGround_resv_total_price(int ground_resv_total_price) {
		this.ground_resv_total_price = ground_resv_total_price;
	}

	public int getGround_resv_price() {
		return ground_resv_price;
	}

	public void setGround_resv_price(int ground_resv_price) {
		this.ground_resv_price = ground_resv_price;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getGround_resv_coment() {
		return ground_resv_coment;
	}

	public void setGround_resv_coment(String ground_resv_coment) {
		this.ground_resv_coment = ground_resv_coment;
	}

	public int getGround_resv_auth() {
		return ground_resv_auth;
	}

	public void setGround_resv_auth(int ground_resv_auth) {
		this.ground_resv_auth = ground_resv_auth;
	}

	public groundResvDto(int ground_resv_seq, int ground_seq, int ground_resv_user, int ground_resv_pet,
			String ground_resv_time, String ground_resv_ydate, String ground_resv_sdate, String ground_resv_tel,
			String ground_resv_name, int ground_resv_payment, int ground_resv_total_price, int ground_resv_price,
			int mem_seq, String ground_resv_coment, int ground_resv_auth) {
		super();
		this.ground_resv_seq = ground_resv_seq;
		this.ground_seq = ground_seq;
		this.ground_resv_user = ground_resv_user;
		this.ground_resv_pet = ground_resv_pet;
		this.ground_resv_time = ground_resv_time;
		this.ground_resv_ydate = ground_resv_ydate;
		this.ground_resv_sdate = ground_resv_sdate;
		this.ground_resv_tel = ground_resv_tel;
		this.ground_resv_name = ground_resv_name;
		this.ground_resv_payment = ground_resv_payment;
		this.ground_resv_total_price = ground_resv_total_price;
		this.ground_resv_price = ground_resv_price;
		this.mem_seq = mem_seq;
		this.ground_resv_coment = ground_resv_coment;
		this.ground_resv_auth = ground_resv_auth;
	}

	@Override
	public String toString() {
		return "groundResvDto [ground_resv_seq=" + ground_resv_seq + ", ground_seq=" + ground_seq
				+ ", ground_resv_user=" + ground_resv_user + ", ground_resv_pet=" + ground_resv_pet
				+ ", ground_resv_time=" + ground_resv_time + ", ground_resv_ydate=" + ground_resv_ydate
				+ ", ground_resv_sdate=" + ground_resv_sdate + ", ground_resv_tel=" + ground_resv_tel
				+ ", ground_resv_name=" + ground_resv_name + ", ground_resv_payment=" + ground_resv_payment
				+ ", ground_resv_total_price=" + ground_resv_total_price + ", ground_resv_price=" + ground_resv_price
				+ ", mem_seq=" + mem_seq + ", ground_resv_coment=" + ground_resv_coment + ", ground_resv_auth="
				+ ground_resv_auth + "]";
	}


}