package cd.com.a.model;

import java.io.Serializable;
/*
CREATE TABLE product_saleing
(
    `saleing_num`           INT(5)         NOT NULL    AUTO_INCREMENT COMMENT '제품판매SEQ', 
    `mem_seq`               INT            NOT NULL    COMMENT '회원아이디', 
    `product_num`           INT(5)         NOT NULL    COMMENT '제품SEQ', 
    `saleing_amount`        INT(3)         NOT NULL    COMMENT '수량', 
    `saleing_addr`          VARCHAR(45)    NOT NULL    COMMENT '주소', 
    `saleing_tel`           VARCHAR(45)    NOT NULL    COMMENT '연락처', 
    `saleing_date`          DATETIME       NOT NULL    COMMENT '구매일', 
    `saleing_option`        INT(1)         NULL        COMMENT '환불교환반품', 
    `saleing_option_state`  INT(1)         NULL        COMMENT '처리여부', 
    `kakao_tid`             VARCHAR(45)    NULL        COMMENT '카카오페이', 
    `kakao_cid`             VARCHAR(45)    NULL        COMMENT '카카오페이', 
    `saleing_group`         INT(7)         NULL        COMMENT '주문 그룹', 
    `product_delivery`      INT(5)         NULL        COMMENT '배송비', 
    PRIMARY KEY (saleing_num)
);

ALTER TABLE product_saleing
    ADD CONSTRAINT FK_product_saleing_product_num_product_product_num FOREIGN KEY (product_num)
        REFERENCES product (product_num) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE product_saleing
    ADD CONSTRAINT FK_product_saleing_mem_seq_member_mem_seq FOREIGN KEY (mem_seq)
        REFERENCES member (mem_seq) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class productSaleDto implements Serializable {
		
	private int saleing_num;
	private int mem_seq;
	private int product_num;
	private int saleing_amount;
	private String saleing_addr;
	private String saleing_tel;
	private String saleing_date;
	private String saleing_name; //  배송지명/수령인
	private int saleing_option;
	private int saleing_option_state;
	
	private String kakao_tid;
	private String kakao_cid;
	
	private int saleing_group;
	private int saleing_delivery;
	private int product_delivery_state;	// 발송여부
	private String delivery_message;
	
	public productSaleDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public productSaleDto(int saleing_num, int mem_seq, int product_num, int saleing_amount, String saleing_addr,
			String saleing_tel, String saleing_date, String saleing_name, int saleing_option, int saleing_option_state,
			String kakao_tid, String kakao_cid, int saleing_group, int saleing_delivery,
			String delivery_message, int product_delivery_state) {
		super();
		this.saleing_num = saleing_num;
		this.mem_seq = mem_seq;
		this.product_num = product_num;
		this.saleing_amount = saleing_amount;
		this.saleing_addr = saleing_addr;
		this.saleing_tel = saleing_tel;
		this.saleing_date = saleing_date;
		this.saleing_name = saleing_name;
		this.saleing_option = saleing_option;
		this.saleing_option_state = saleing_option_state;
		this.kakao_tid = kakao_tid;
		this.kakao_cid = kakao_cid;
		this.saleing_group = saleing_group;
		this.saleing_delivery = saleing_delivery;
		this.product_delivery_state = product_delivery_state;
		this.delivery_message = delivery_message;
		this.product_delivery_state = product_delivery_state;
	}



	public productSaleDto(int mem_seq, int product_num, int saleing_amount, String saleing_addr, String saleing_tel,
			String saleing_name, int saleing_group, int saleing_delivery, String delivery_message) {
		super();
		this.mem_seq = mem_seq;
		this.product_num = product_num;
		this.saleing_amount = saleing_amount;
		this.saleing_addr = saleing_addr;
		this.saleing_tel = saleing_tel;
		this.saleing_name = saleing_name;
		this.saleing_group = saleing_group;
		this.saleing_delivery = saleing_delivery;
		this.delivery_message = delivery_message;
	}

	public int getSaleing_num() {
		return saleing_num;
	}

	public void setSaleing_num(int saleing_num) {
		this.saleing_num = saleing_num;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getSaleing_amount() {
		return saleing_amount;
	}

	public void setSaleing_amount(int saleing_amount) {
		this.saleing_amount = saleing_amount;
	}

	public String getSaleing_addr() {
		return saleing_addr;
	}

	public void setSaleing_addr(String saleing_addr) {
		this.saleing_addr = saleing_addr;
	}

	public String getSaleing_tel() {
		return saleing_tel;
	}

	public void setSaleing_tel(String saleing_tel) {
		this.saleing_tel = saleing_tel;
	}

	public String getSaleing_date() {
		return saleing_date;
	}

	public void setSaleing_date(String saleing_date) {
		this.saleing_date = saleing_date;
	}
	
	public String getSaleing_name() {
		return saleing_name;
	}

	public void setSaleing_name(String saleing_name) {
		this.saleing_name = saleing_name;
	}

	public int getSaleing_option() {
		return saleing_option;
	}

	public void setSaleing_option(int saleing_option) {
		this.saleing_option = saleing_option;
	}

	public int getSaleing_option_state() {
		return saleing_option_state;
	}

	public void setSaleing_option_state(int saleing_option_state) {
		this.saleing_option_state = saleing_option_state;
	}

	
	
	public int getProduct_delivery_state() {
		return product_delivery_state;
	}



	public void setProduct_delivery_state(int product_delivery_state) {
		this.product_delivery_state = product_delivery_state;
	}



	public String getKakao_tid() {
		return kakao_tid;
	}

	public void setKakao_tid(String kakao_tid) {
		this.kakao_tid = kakao_tid;
	}

	public String getKakao_cid() {
		return kakao_cid;
	}

	public void setKakao_cid(String kakao_cid) {
		this.kakao_cid = kakao_cid;
	}

	public int getSaleing_group() {
		return saleing_group;
	}

	public void setSaleing_group(int saleing_group) {
		this.saleing_group = saleing_group;
	}

	public int getSaleing_delivery() {
		return saleing_delivery;
	}

	public void setSaleing_delivery(int saleing_delivery) {
		this.saleing_delivery = saleing_delivery;
	}

	public String getDelivery_message() {
		return delivery_message;
	}

	public void setDelivery_message(String delivery_message) {
		this.delivery_message = delivery_message;
	}



	@Override
	public String toString() {
		return "productSaleDto [saleing_num=" + saleing_num + ", mem_seq=" + mem_seq + ", product_num=" + product_num
				+ ", saleing_amount=" + saleing_amount + ", saleing_addr=" + saleing_addr + ", saleing_tel="
				+ saleing_tel + ", saleing_date=" + saleing_date + ", saleing_name=" + saleing_name
				+ ", saleing_option=" + saleing_option + ", saleing_option_state=" + saleing_option_state
				+ ", kakao_tid=" + kakao_tid + ", kakao_cid=" + kakao_cid + ", saleing_group=" + saleing_group
				+ ", saleing_delivery=" + saleing_delivery + ", product_delivery_state=" + product_delivery_state
				+ ", delivery_message=" + delivery_message + "]";
	}
	
	




	
	
	
}
