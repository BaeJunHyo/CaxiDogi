package cd.com.a.model;

import java.io.Serializable;
/*
	CREATE TABLE product_supervise
(
    `supervise_num`           INT(5)    NOT NULL    AUTO_INCREMENT COMMENT '제품구매관리SEQ', 
    `saleing_num`             INT(5)    NOT NULL    COMMENT '제품구매SEQ', 
    `supervise_option`        INT(1)    NOT NULL    COMMENT '환불교환반품', 
    `supervise_option_state`  INT(1)    NULL        COMMENT '처리여부', 
    PRIMARY KEY (supervise_num)
);
ALTER TABLE product_supervise
    ADD CONSTRAINT FK_product_supervise_saleing_num_product_saleing_saleing_num FOREIGN KEY (saleing_num)
        REFERENCES product_saleing (saleing_num) ON DELETE RESTRICT ON UPDATE RESTRICT;
*/
public class productSuperDto implements Serializable {
	   private int supervise_num;
	   private int saleing_num;
	   private int supervise_option;
	   private int supervise_option_state;
	   
	public productSuperDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public productSuperDto(int supervise_num, int saleing_num, int supervise_option, int supervise_option_state) {
		super();
		this.supervise_num = supervise_num;
		this.saleing_num = saleing_num;
		this.supervise_option = supervise_option;
		this.supervise_option_state = supervise_option_state;
	}

	public int getSupervise_num() {
		return supervise_num;
	}

	public void setSupervise_num(int supervise_num) {
		this.supervise_num = supervise_num;
	}

	public int getSaleing_num() {
		return saleing_num;
	}

	public void setSaleing_num(int saleing_num) {
		this.saleing_num = saleing_num;
	}

	public int getSupervise_option() {
		return supervise_option;
	}

	public void setSupervise_option(int supervise_option) {
		this.supervise_option = supervise_option;
	}

	public int getSupervise_option_state() {
		return supervise_option_state;
	}

	public void setSupervise_option_state(int supervise_option_state) {
		this.supervise_option_state = supervise_option_state;
	}

	@Override
	public String toString() {
		return "productSuperDto [supervise_num=" + supervise_num + ", saleing_num=" + saleing_num
				+ ", supervise_option=" + supervise_option + ", supervise_option_state=" + supervise_option_state + "]";
	}
	   
	   
}
