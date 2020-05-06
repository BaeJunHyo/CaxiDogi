package cd.com.a.model;

import java.io.Serializable;

public class saleBasketParam implements Serializable {

	private int mem_seq;
	private int product_num;
	
	public saleBasketParam() {
	}

	public saleBasketParam(int mem_seq, int product_num) {
		super();
		this.mem_seq = mem_seq;
		this.product_num = product_num;
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

	@Override
	public String toString() {
		return "saleBasketParam [mem_seq=" + mem_seq + ", product_num=" + product_num + "]";
	}
	
}
