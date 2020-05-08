package cd.com.a.model;

import java.io.Serializable;

public class orderDetailParam implements Serializable {

	private int saleing_group;
	private String product_name;
	private String product_code;
	private String product_brand;
	private int saleing_amount;
	private int product_price;
	private String product_img;
	private int product_group;
	private int product_sub_group;
	
	public orderDetailParam() {
	}

	public orderDetailParam(int saleing_group, String product_name, String product_code, String product_brand,
			int saleing_amount, int product_price, String product_img, int product_group, int product_sub_group) {
		super();
		this.saleing_group = saleing_group;
		this.product_name = product_name;
		this.product_code = product_code;
		this.product_brand = product_brand;
		this.saleing_amount = saleing_amount;
		this.product_price = product_price;
		this.product_img = product_img;
		this.product_group = product_group;
		this.product_sub_group = product_sub_group;
	}

	public int getSaleing_group() {
		return saleing_group;
	}

	public void setSaleing_group(int saleing_group) {
		this.saleing_group = saleing_group;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getProduct_brand() {
		return product_brand;
	}

	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}

	public int getSaleing_amount() {
		return saleing_amount;
	}

	public void setSaleing_amount(int saleing_amount) {
		this.saleing_amount = saleing_amount;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
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

	@Override
	public String toString() {
		return "orderDetailParam [saleing_group=" + saleing_group + ", product_name=" + product_name + ", product_code="
				+ product_code + ", product_brand=" + product_brand + ", saleing_amount=" + saleing_amount
				+ ", product_price=" + product_price + ", product_img=" + product_img + ", product_group="
				+ product_group + ", product_sub_group=" + product_sub_group + "]";
	}

	
	
	
}
