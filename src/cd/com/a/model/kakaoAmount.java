package cd.com.a.model;

import java.io.Serializable;

public class kakaoAmount implements Serializable {

	private int total;
	private int tax_free;
	private int vat;
	private int discount;
	
	public kakaoAmount() {
		
	}
	
	
	public kakaoAmount(int total, int tax_free, int vat, int discount) {
		super();
		this.total = total;
		this.tax_free = tax_free;
		this.vat = vat;
		this.discount = discount;
	}


	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTax_free() {
		return tax_free;
	}
	public void setTax_free(int tax_free) {
		this.tax_free = tax_free;
	}
	public int getVat() {
		return vat;
	}
	public void setVat(int vat) {
		this.vat = vat;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}


	@Override
	public String toString() {
		return "kakaoAmount [total=" + total + ", tax_free=" + tax_free + ", vat=" + vat + ", discount=" + discount
				+ "]";
	}
	
	
}
