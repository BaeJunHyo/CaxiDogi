package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE room
(
    `room_num`      INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '방번호(SEQ)', 
    `company_num`   INT(5)         NOT NULL    COMMENT '업체번호', 
    `room_name`     VARCHAR(45)    NULL        COMMENT '방이름', 
    `room_max`      INT(3)         NOT NULL    COMMENT '최대인원수', 
    `room_price`    INT(6)         NOT NULL    COMMENT '가격', 
    `room_size`     INT(3)         NULL        COMMENT '평수', 
    `room_img`      TEXT           NULL        COMMENT '사진명', 
    `room_content`  TINYTEXT       NULL        COMMENT '컨텐츠', 
    `room_pool`     INT(1)         NULL        COMMENT '수영장여부', 
    `room_ground`   INT(1)         NULL        COMMENT '운동장여부', 
    PRIMARY KEY (room_num)
);

ALTER TABLE room
    ADD CONSTRAINT FK_room_company_num_company_company_num FOREIGN KEY (company_num)
        REFERENCES company (company_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class roomDto implements Serializable {

	private int room_num;
	private int company_num;
	private String room_name;
	private int room_max;
	private int room_price;
	private int room_size;
	private String room_img;
	private String room_content;
	private int room_pool;
	private int room_ground;
	
	public roomDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public roomDto(int room_num, int company_num, String room_name, int room_max, int room_price, int room_size,
			String room_img, String room_content, int room_pool, int room_ground) {
		super();
		this.room_num = room_num;
		this.company_num = company_num;
		this.room_name = room_name;
		this.room_max = room_max;
		this.room_price = room_price;
		this.room_size = room_size;
		this.room_img = room_img;
		this.room_content = room_content;
		this.room_pool = room_pool;
		this.room_ground = room_ground;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getCompany_num() {
		return company_num;
	}

	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getRoom_max() {
		return room_max;
	}

	public void setRoom_max(int room_max) {
		this.room_max = room_max;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public int getRoom_size() {
		return room_size;
	}

	public void setRoom_size(int room_size) {
		this.room_size = room_size;
	}

	public String getRoom_img() {
		return room_img;
	}

	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}

	public String getRoom_content() {
		return room_content;
	}

	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}

	public int getRoom_pool() {
		return room_pool;
	}

	public void setRoom_pool(int room_pool) {
		this.room_pool = room_pool;
	}

	public int getRoom_ground() {
		return room_ground;
	}

	public void setRoom_ground(int room_ground) {
		this.room_ground = room_ground;
	}

	@Override
	public String toString() {
		return "roomDto [room_num=" + room_num + ", company_num=" + company_num + ", room_name=" + room_name
				+ ", room_max=" + room_max + ", room_price=" + room_price + ", room_size=" + room_size + ", room_img="
				+ room_img + ", room_content=" + room_content + ", room_pool=" + room_pool + ", room_ground="
				+ room_ground + "]";
	}
	
	
	
	
}
