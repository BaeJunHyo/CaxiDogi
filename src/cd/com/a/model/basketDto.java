package cd.com.a.model;

import java.io.Serializable;

public class basketDto implements Serializable {

	private int basket_num;
	private int mem_seq;
	private int product_num;
	private int basket_amount;
	
	private String product_name;
	private String product_img;
	private int product_price;
	
	private int product_group;
	private int product_sub_group;
	private String product_brand;
	private int product_hidden;
	private int product_stock;
	private int product_sale;
	private int product_del;
	
	
	
	public basketDto() {
	}

	public basketDto(int mem_seq, int product_num, int basket_amount) {
		this.mem_seq = mem_seq;
		this.product_num = product_num;
		this.basket_amount = basket_amount;
	}

	public basketDto(int basket_num, int mem_seq, int product_num, int basket_amount, String product_name,
			String product_img, int product_price, int product_group, int product_sub_group, String product_brand,
			int product_hidden, int product_stock, int product_sale, int product_del) {
		super();
		this.basket_num = basket_num;
		this.mem_seq = mem_seq;
		this.product_num = product_num;
		this.basket_amount = basket_amount;
		this.product_name = product_name;
		this.product_img = product_img;
		this.product_price = product_price;
		this.product_group = product_group;
		this.product_sub_group = product_sub_group;
		this.product_brand = product_brand;
		this.product_hidden = product_hidden;
		this.product_stock = product_stock;
		this.product_sale = product_sale;
		this.product_del = product_del;
	}

	public int getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
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

	public int getBasket_amount() {
		return basket_amount;
	}

	public void setBasket_amount(int basket_amount) {
		this.basket_amount = basket_amount;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
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

	public String getProduct_brand() {
		return product_brand;
	}

	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}

	public int getProduct_hidden() {
		return product_hidden;
	}

	public void setProduct_hidden(int product_hidden) {
		this.product_hidden = product_hidden;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public int getProduct_sale() {
		return product_sale;
	}

	public void setProduct_sale(int product_sale) {
		this.product_sale = product_sale;
	}

	public int getProduct_del() {
		return product_del;
	}

	public void setProduct_del(int product_del) {
		this.product_del = product_del;
	}

	@Override
	public String toString() {
		return "basketDto [basket_num=" + basket_num + ", mem_seq=" + mem_seq + ", product_num=" + product_num
				+ ", basket_amount=" + basket_amount + ", product_name=" + product_name + ", product_img=" + product_img
				+ ", product_price=" + product_price + ", product_group=" + product_group + ", product_sub_group="
				+ product_sub_group + ", product_brand=" + product_brand + ", product_hidden=" + product_hidden
				+ ", product_stock=" + product_stock + ", product_sale=" + product_sale + ", product_del=" + product_del
				+ "]";
	}
	
}
