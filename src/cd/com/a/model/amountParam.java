package cd.com.a.model;

import java.io.Serializable;

public class amountParam implements Serializable {

	private int basket_num;
	private String state;
	
	public amountParam() {	
	}
	
	public amountParam(int basket_num, String state) {
		this.basket_num = basket_num;
		this.state = state;
	}

	public int getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "amountParam [basket_num=" + basket_num + ", state=" + state + "]";
	}
	
	
	
}
