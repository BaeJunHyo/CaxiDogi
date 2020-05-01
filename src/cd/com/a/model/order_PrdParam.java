package cd.com.a.model;

import java.io.Serializable;
import cd.com.a.model.productDto;

public class order_PrdParam implements Serializable {
	
	private int product_num;
	private int acount;
	
	public order_PrdParam() {
		// TODO Auto-generated constructor stub
	}

	public order_PrdParam(int product_num, int acount) {
		this.product_num = product_num;
		this.acount = acount;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getAcount() {
		return acount;
	}

	public void setAcount(int acount) {
		this.acount = acount;
	}
	
	@Override
	public String toString() {
		return "order_PrdParam [product_num=" + product_num + ", acount=" + acount + "]";
	}
	
}
