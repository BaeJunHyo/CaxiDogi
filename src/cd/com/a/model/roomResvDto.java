package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE room_reservation
(
    `room_resv_num`          INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '예약번호(SEQ)', 
    `room_num`               INT(5)         NOT NULL    COMMENT '방번호(SEQ)', 
    `room_resv_user`         INT(2)         NOT NULL    COMMENT '사용인원수', 
    `room_resv_date`         DATE           NOT NULL    COMMENT '예약날짜', 
    `room_resv_use_date`     VARCHAR(45)    NOT NULL    COMMENT '사용기간', 
    `room_resv_total_price`  INT(7)         NULL        COMMENT '가격총합(seller)', 
    `room_resv_tel`          VARCHAR(45)    NULL        COMMENT '연락처', 
    `id`                     VARCHAR(45)    NOT NULL    COMMENT '예약자ID', 
    `room_resv_name`         VARCHAR(45)    NULL        COMMENT '예약자명', 
    `room_resv_cancle`       INT(1)         NOT NULL    COMMENT '취소여부', 
    `room_resv_payment`      INT(1)         NOT NULL    COMMENT '결재여부', 
    `room_resv_etc`          VARCHAR(45)    NULL        COMMENT '추가주문', 
    `room_resv_price`        INT(7)         NULL        COMMENT '최종금액', 
    PRIMARY KEY (room_resv_num)
);
ALTER TABLE room_reservation
    ADD CONSTRAINT FK_room_reservation_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE room_reservation
    ADD CONSTRAINT FK_room_reservation_room_num_room_room_num FOREIGN KEY (room_num)
        REFERENCES room (room_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class roomResvDto implements Serializable{
	private int room_resv_num;
	private int room_num;
	private int room_resv_user;
	private String room_resv_date;
	private String room_resv_use_date;
	private int room_resv_total_price;
	private String room_resv_tel;
	private String id;
	private String room_resv_name;
	private int room_resv_cancle;
	private int room_resv_payment;
	private String room_resv_etc;
	private int room_resv_price;
	
	public roomResvDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public roomResvDto(int room_resv_num, int room_num, int room_resv_user, String room_resv_date,
			String room_resv_use_date, int room_resv_total_price, String room_resv_tel, String id,
			String room_resv_name, int room_resv_cancle, int room_resv_payment, String room_resv_etc,
			int room_resv_price) {
		super();
		this.room_resv_num = room_resv_num;
		this.room_num = room_num;
		this.room_resv_user = room_resv_user;
		this.room_resv_date = room_resv_date;
		this.room_resv_use_date = room_resv_use_date;
		this.room_resv_total_price = room_resv_total_price;
		this.room_resv_tel = room_resv_tel;
		this.id = id;
		this.room_resv_name = room_resv_name;
		this.room_resv_cancle = room_resv_cancle;
		this.room_resv_payment = room_resv_payment;
		this.room_resv_etc = room_resv_etc;
		this.room_resv_price = room_resv_price;
	}

	public int getRoom_resv_num() {
		return room_resv_num;
	}

	public void setRoom_resv_num(int room_resv_num) {
		this.room_resv_num = room_resv_num;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getRoom_resv_user() {
		return room_resv_user;
	}

	public void setRoom_resv_user(int room_resv_user) {
		this.room_resv_user = room_resv_user;
	}

	public String getRoom_resv_date() {
		return room_resv_date;
	}

	public void setRoom_resv_date(String room_resv_date) {
		this.room_resv_date = room_resv_date;
	}

	public String getRoom_resv_use_date() {
		return room_resv_use_date;
	}

	public void setRoom_resv_use_date(String room_resv_use_date) {
		this.room_resv_use_date = room_resv_use_date;
	}

	public int getRoom_resv_total_price() {
		return room_resv_total_price;
	}

	public void setRoom_resv_total_price(int room_resv_total_price) {
		this.room_resv_total_price = room_resv_total_price;
	}

	public String getRoom_resv_tel() {
		return room_resv_tel;
	}

	public void setRoom_resv_tel(String room_resv_tel) {
		this.room_resv_tel = room_resv_tel;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoom_resv_name() {
		return room_resv_name;
	}

	public void setRoom_resv_name(String room_resv_name) {
		this.room_resv_name = room_resv_name;
	}

	public int getRoom_resv_cancle() {
		return room_resv_cancle;
	}

	public void setRoom_resv_cancle(int room_resv_cancle) {
		this.room_resv_cancle = room_resv_cancle;
	}

	public int getRoom_resv_payment() {
		return room_resv_payment;
	}

	public void setRoom_resv_payment(int room_resv_payment) {
		this.room_resv_payment = room_resv_payment;
	}

	public String getRoom_resv_etc() {
		return room_resv_etc;
	}

	public void setRoom_resv_etc(String room_resv_etc) {
		this.room_resv_etc = room_resv_etc;
	}

	public int getRoom_resv_price() {
		return room_resv_price;
	}

	public void setRoom_resv_price(int room_resv_price) {
		this.room_resv_price = room_resv_price;
	}

	@Override
	public String toString() {
		return "roomResvDto [room_resv_num=" + room_resv_num + ", room_num=" + room_num + ", room_resv_user="
				+ room_resv_user + ", room_resv_date=" + room_resv_date + ", room_resv_use_date=" + room_resv_use_date
				+ ", room_resv_total_price=" + room_resv_total_price + ", room_resv_tel=" + room_resv_tel + ", id=" + id
				+ ", room_resv_name=" + room_resv_name + ", room_resv_cancle=" + room_resv_cancle
				+ ", room_resv_payment=" + room_resv_payment + ", room_resv_etc=" + room_resv_etc + ", room_resv_price="
				+ room_resv_price + "]";
	}
	
	
	
}
