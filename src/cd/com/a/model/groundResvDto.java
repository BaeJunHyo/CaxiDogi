package cd.com.a.model;

import java.io.Serializable;
/*
 CREATE TABLE ground_reservation
(
    `ground_resv_num`          INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '예약번호(SEQ)', 
    `ground_num`               INT(5)         NOT NULL    COMMENT '운동장번호(SEQ)', 
    `ground_resv_user`         INT(3)         NOT NULL    COMMENT '사용인원수', 
    `ground_resv_pet`          INT(3)         NOT NULL    COMMENT '사용펫수', 
    `ground_resv_time`         INT(1)         NOT NULL    COMMENT '선택시간', 
    `ground_resv_ydate`        DATETIME       NOT NULL    COMMENT '예약일', 
    `ground_resv_sdate`        VARCHAR(45)    NOT NULL    COMMENT '사용일', 
    `ground_resv_tel`          VARCHAR(45)    NULL        COMMENT '연락처', 
    `ground_resv_name`         VARCHAR(45)    NULL        COMMENT '예약자명', 
    `ground_resv_payment`      INT(1)         NOT NULL    COMMENT '결재여부', 
    `ground_resv_total_price`  INT(7)         NULL        COMMENT '최종금액', 
    `ground_resv_price`        INT(7)         NULL        COMMENT '가금액', 
    `id`                       VARCHAR(45)    NOT NULL    COMMENT '예약자ID', 
    PRIMARY KEY (ground_resv_num)
);
ALTER TABLE ground_reservation
    ADD CONSTRAINT FK_ground_reservation_ground_num_ground_ground_num FOREIGN KEY (ground_num)
        REFERENCES ground (ground_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE ground_reservation
    ADD CONSTRAINT FK_ground_reservation_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT; 
 */
public class groundResvDto implements Serializable {
	private int ground_resv_num;
	   private int ground_num;
	   private int ground_resv_user;
	   private int ground_resv_pet;
	   private int ground_resv_time;
	   private String ground_resv_ydate;
	   private String ground_resv_sdate;
	   private String ground_resv_tel;
	   private String ground_resv_name;
	   private int ground_resv_payment;
	   private int ground_resv_total_price;
	   private int ground_resv_price;
	   private String id;
	   
	public groundResvDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public groundResvDto(int ground_resv_num, int ground_num, int ground_resv_user, int ground_resv_pet,
			int ground_resv_time, String ground_resv_ydate, String ground_resv_sdate, String ground_resv_tel,
			String ground_resv_name, int ground_resv_payment, int ground_resv_total_price, int ground_resv_price,
			String id) {
		super();
		this.ground_resv_num = ground_resv_num;
		this.ground_num = ground_num;
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
		this.id = id;
	}
	public int getGround_resv_num() {
		return ground_resv_num;
	}
	public void setGround_resv_num(int ground_resv_num) {
		this.ground_resv_num = ground_resv_num;
	}
	public int getGround_num() {
		return ground_num;
	}
	public void setGround_num(int ground_num) {
		this.ground_num = ground_num;
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
	public int getGround_resv_time() {
		return ground_resv_time;
	}
	public void setGround_resv_time(int ground_resv_time) {
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "groundResvDto [ground_resv_num=" + ground_resv_num + ", ground_num=" + ground_num
				+ ", ground_resv_user=" + ground_resv_user + ", ground_resv_pet=" + ground_resv_pet
				+ ", ground_resv_time=" + ground_resv_time + ", ground_resv_ydate=" + ground_resv_ydate
				+ ", ground_resv_sdate=" + ground_resv_sdate + ", ground_resv_tel=" + ground_resv_tel
				+ ", ground_resv_name=" + ground_resv_name + ", ground_resv_payment=" + ground_resv_payment
				+ ", ground_resv_total_price=" + ground_resv_total_price + ", ground_resv_price=" + ground_resv_price
				+ ", id=" + id + "]";
	}
	   
}
