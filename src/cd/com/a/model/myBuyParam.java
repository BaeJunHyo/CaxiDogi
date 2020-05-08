package cd.com.a.model;

import java.io.Serializable;
import java.util.Date;

public class myBuyParam implements Serializable {

	private String product_num;
	private String order_name;
	private String order_date;
	private String order_img;
	private int order_amount;
	private int order_price;
	private int order_number;
	private int product_delivery_state;
	private int product_group;
	private int product_sub_group;
	private int order_option;
	private int order_option_state;
	
	
	public myBuyParam() { 		
	}

	public myBuyParam(String product_num, String order_name, String order_date, String order_img, int order_amount, int order_price,
			int order_number, int product_delivery_state, int product_group, int product_sub_group, int order_option, int order_option_state) {
		super();
		this.product_num = product_num;
		this.order_name = order_name;
		this.order_date = order_date;
		this.order_img = order_img;
		this.order_amount = order_amount;
		this.order_price = order_price;
		this.order_number = order_number;
		this.product_delivery_state = product_delivery_state;
		this.product_group = product_group;
		this.product_sub_group = product_sub_group;
		this.order_option = order_option;
		this.order_option_state = order_option_state;
	}

	public String getProduct_num() {
		return product_num;
	}

	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public int getProduct_delivery_state() {
		return product_delivery_state;
	}

	public void setProduct_delivery_state(int product_delivery_state) {
		this.product_delivery_state = product_delivery_state;
	}
	
	public String getOrder_img() {
		return order_img;
	}

	public void setOrder_img(String order_img) {
		this.order_img = order_img;
	}
	
	
	public int getOrder_number() {
		return order_number;
	}

	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	
	public int getProduct_group() {
		return product_group;
	}

	public void setProduct_group(int product_group) {
		this.product_group = product_group;
	}

	public int getProduct_sub_group() {
		return product_sub_group;
	}

	public void setProduct_sub_group(int product_sub_group) {
		this.product_sub_group = product_sub_group;
	}

	public int getOrder_option() {
		return order_option;
	}

	public void setOrder_option(int order_option) {
		this.order_option = order_option;
	}

	public int getOrder_option_state() {
		return order_option_state;
	}

	public void setOrder_option_state(int order_option_state) {
		this.order_option_state = order_option_state;
	}

	@Override
	public String toString() {
		return "myBuyParam [product_num=" + product_num + ", order_name=" + order_name + ", order_date=" + order_date
				+ ", order_img=" + order_img + ", order_amount=" + order_amount + ", order_price=" + order_price
				+ ", order_number=" + order_number + ", product_delivery_state=" + product_delivery_state
				+ ", product_group=" + product_group + ", product_sub_group=" + product_sub_group + ", order_option="
				+ order_option + ", order_option_state=" + order_option_state + "]";
	}
	

	
	
	
}
