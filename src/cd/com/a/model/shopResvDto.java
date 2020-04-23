package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE shop_reservation
(
    `shop_resv_seq`    INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '예약번호(SEQ)', 
    `shop_seq`         INT(5)         NOT NULL    COMMENT '샵번호(SEQ)', 
    `design_seq`       INT(5)         NOT NULL    COMMENT '디자이너번호(SEQ)', 
    `id`               VARCHAR(45)    NOT NULL    COMMENT '예약아이디', 
    `shop_resv_time`   VARCHAR(45)    NOT NULL    COMMENT '예약시간', 
    `shop_resv_rday`   VARCHAR(45)    NOT NULL    COMMENT '예약일', 
    `shop_resv_day`    DATETIME       NOT NULL    COMMENT '예약날짜', 
    `shop_resv_size`   INT(1)         NOT NULL    COMMENT '견종', 
    `shop_resv_name`   VARCHAR(45)    NOT NULL    COMMENT '예약자명', 
    `shop_resv_tel`    VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `shop_resv_price`  INT(7)         NOT NULL    COMMENT '가금액', 
    `shop_resv_auth`   INT(1)         NOT NULL    COMMENT '취소여부', 
    PRIMARY KEY (shop_resv_seq)
);

ALTER TABLE shop_reservation
    ADD CONSTRAINT FK_shop_reservation_shop_seq_shop_shop_seq FOREIGN KEY (shop_seq)
        REFERENCES shop (shop_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE shop_reservation
    ADD CONSTRAINT FK_shop_reservation_design_seq_shop_designer_design_seq FOREIGN KEY (design_seq)
        REFERENCES shop_designer (design_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE shop_reservation
    ADD CONSTRAINT FK_shop_reservation_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE RESTRICT ON UPDATE RESTRICT;
 
 */
public class shopResvDto implements Serializable {

	private int shop_resv_seq;				// 예약번호
	private int shop_seq;					// 샵번호
	private int design_seq;					// 디자이너 번호
	private int mem_seq;						// 예약 아이디
	private String shop_resv_time;			// 예약 시간
	private String shop_resv_rday;			// 예약일  사용자가 이용할 날짜
	private String shop_resv_day;			// 예약날짜
	private int shop_resv_size;				// 미용할 견종(소중대)	0:소  1:중 2:대
	private String shop_resv_name;			// 예약자명
	private String shop_resv_tel;			// 예약자 연락처
	private int shop_resv_price;			// 가금액
	private int shop_resv_auth;				// 취소여부
	private String shop_resv_comment; 
	
	public shopResvDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public shopResvDto(int shop_resv_seq, int shop_seq, int design_seq, int mem_seq, String shop_resv_time,
			String shop_resv_rday, String shop_resv_day, int shop_resv_size, String shop_resv_name,
			String shop_resv_tel, int shop_resv_price, int shop_resv_auth, String shop_resv_comment) {
		super();
		this.shop_resv_seq = shop_resv_seq;
		this.shop_seq = shop_seq;
		this.design_seq = design_seq;
		this.mem_seq = mem_seq;
		this.shop_resv_time = shop_resv_time;
		this.shop_resv_rday = shop_resv_rday;
		this.shop_resv_day = shop_resv_day;
		this.shop_resv_size = shop_resv_size;
		this.shop_resv_name = shop_resv_name;
		this.shop_resv_tel = shop_resv_tel;
		this.shop_resv_price = shop_resv_price;
		this.shop_resv_auth = shop_resv_auth;
		this.shop_resv_comment = shop_resv_comment;
	}

	public int getShop_resv_seq() {
		return shop_resv_seq;
	}

	public void setShop_resv_seq(int shop_resv_seq) {
		this.shop_resv_seq = shop_resv_seq;
	}

	public int getShop_seq() {
		return shop_seq;
	}

	public void setShop_seq(int shop_seq) {
		this.shop_seq = shop_seq;
	}

	public int getDesign_seq() {
		return design_seq;
	}

	public void setDesign_seq(int design_seq) {
		this.design_seq = design_seq;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getShop_resv_time() {
		return shop_resv_time;
	}

	public void setShop_resv_time(String shop_resv_time) {
		this.shop_resv_time = shop_resv_time;
	}

	public String getShop_resv_rday() {
		return shop_resv_rday;
	}

	public void setShop_resv_rday(String shop_resv_rday) {
		this.shop_resv_rday = shop_resv_rday;
	}

	public String getShop_resv_day() {
		return shop_resv_day;
	}

	public void setShop_resv_day(String shop_resv_day) {
		this.shop_resv_day = shop_resv_day;
	}

	public int getShop_resv_size() {
		return shop_resv_size;
	}

	public void setShop_resv_size(int shop_resv_size) {
		this.shop_resv_size = shop_resv_size;
	}

	public String getShop_resv_name() {
		return shop_resv_name;
	}

	public void setShop_resv_name(String shop_resv_name) {
		this.shop_resv_name = shop_resv_name;
	}

	public String getShop_resv_tel() {
		return shop_resv_tel;
	}

	public void setShop_resv_tel(String shop_resv_tel) {
		this.shop_resv_tel = shop_resv_tel;
	}

	public int getShop_resv_price() {
		return shop_resv_price;
	}

	public void setShop_resv_price(int shop_resv_price) {
		this.shop_resv_price = shop_resv_price;
	}

	public int getShop_resv_auth() {
		return shop_resv_auth;
	}

	public void setShop_resv_auth(int shop_resv_auth) {
		this.shop_resv_auth = shop_resv_auth;
	}

	public String getShop_resv_comment() {
		return shop_resv_comment;
	}

	public void setShop_resv_comment(String shop_resv_comment) {
		this.shop_resv_comment = shop_resv_comment;
	}

	@Override
	public String toString() {
		return "shopResvDto [shop_resv_seq=" + shop_resv_seq + ", shop_seq=" + shop_seq + ", design_seq=" + design_seq
				+ ", mem_seq=" + mem_seq + ", shop_resv_time=" + shop_resv_time + ", shop_resv_rday=" + shop_resv_rday
				+ ", shop_resv_day=" + shop_resv_day + ", shop_resv_size=" + shop_resv_size + ", shop_resv_name="
				+ shop_resv_name + ", shop_resv_tel=" + shop_resv_tel + ", shop_resv_price=" + shop_resv_price
				+ ", shop_resv_auth=" + shop_resv_auth + ", shop_resv_comment=" + shop_resv_comment + "]";
	}

	

	
}