package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE schedule
(
    `room_use`       INT(!)         NOT NULL    COMMENT 'use값', 
    `room_checkin`   VARCHAR(45)    NOT NULL    COMMENT '체크인', 
    `room_checkout`  VARCHAR(45)    NOT NULL    COMMENT '체크아웃', 
    `company_num`    INT(5)         NOT NULL    COMMENT '업체번호(SEQ)', 
    `room_num`       INT(5)         NOT NULL    COMMENT '방번호(SEQ)'
);
ALTER TABLE schedule
    ADD CONSTRAINT FK_schedule_company_num_company_company_num FOREIGN KEY (company_num)
        REFERENCES company (company_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE schedule
    ADD CONSTRAINT FK_schedule_room_num_room_room_num FOREIGN KEY (room_num)
        REFERENCES room (room_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class scheduleDto implements Serializable {
	private int room_use;
	private String room_checkin;
	private String room_checkout;
	private int company_num;
	private int room_num;
	
	public scheduleDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public scheduleDto(int room_use, String room_checkin, String room_checkout, int company_num, int room_num) {
		super();
		this.room_use = room_use;
		this.room_checkin = room_checkin;
		this.room_checkout = room_checkout;
		this.company_num = company_num;
		this.room_num = room_num;
	}

	public int getRoom_use() {
		return room_use;
	}

	public void setRoom_use(int room_use) {
		this.room_use = room_use;
	}

	public String getRoom_checkin() {
		return room_checkin;
	}

	public void setRoom_checkin(String room_checkin) {
		this.room_checkin = room_checkin;
	}

	public String getRoom_checkout() {
		return room_checkout;
	}

	public void setRoom_checkout(String room_checkout) {
		this.room_checkout = room_checkout;
	}

	public int getCompany_num() {
		return company_num;
	}

	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	@Override
	public String toString() {
		return "scheduleDto [room_use=" + room_use + ", room_checkin=" + room_checkin + ", room_checkout="
				+ room_checkout + ", company_num=" + company_num + ", room_num=" + room_num + "]";
	}
	
	
	
	
	
}
