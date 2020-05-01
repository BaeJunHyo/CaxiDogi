package cd.com.a.model;

import java.io.Serializable;
import java.util.List;

public class order_PrdParamList implements Serializable {
	
	private List<order_PrdParam> orderList;
	
	public order_PrdParamList() {
		
	}
	
	
	public List<order_PrdParam> getOrderList(){
		return orderList;
	}
	
	public void setOrderList(List<order_PrdParam> orderList) {
		this.orderList = orderList;
	}
}
