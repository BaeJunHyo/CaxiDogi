package cd.com.a.model;

import java.io.Serializable;
import java.util.Date;

public class kakaoSelectDto implements Serializable {

	private String status;
	private String item_name;
	private int quantity;
	private Date created_at;
	private Date approved_at;
	private Date canceled_at;
	private Object Amount;
	private String totalPrice;
	
	public kakaoSelectDto()	{
	}

	public kakaoSelectDto(String status, String item_name, int quantity, Date created_at, Date approved_at,
			Date canceled_at, Object amount) {
		super();
		this.status = status;
		this.item_name = item_name;
		this.quantity = quantity;
		this.created_at = created_at;
		this.approved_at = approved_at;
		this.canceled_at = canceled_at;
		Amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getApproved_at() {
		return approved_at;
	}

	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}

	public Date getCanceled_at() {
		return canceled_at;
	}

	public void setCanceled_at(Date canceled_at) {
		this.canceled_at = canceled_at;
	}

	public Object getAmount() {
		return Amount;
	}

	public void setAmount(Object amount) {
		Amount = amount;
	}
	
	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "kakaoSelectDto [status=" + status + ", item_name=" + item_name + ", quantity=" + quantity
				+ ", created_at=" + created_at + ", approved_at=" + approved_at + ", canceled_at=" + canceled_at
				+ ", Amount=" + Amount + "]";
	}
	
}
