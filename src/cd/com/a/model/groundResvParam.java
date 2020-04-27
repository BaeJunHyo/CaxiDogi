package cd.com.a.model;

import java.io.Serializable;


public class groundResvParam implements Serializable {
	private int ground_resv_seq;
	private int ground_seq;
	private int ground_resv_user;
	private int ground_resv_pet;
	private String ground_resv_time;
	private String ground_resv_ydate;
	private String ground_resv_sdate;
	private String ground_resv_tel;
	private String ground_resv_name;
	private int ground_resv_payment;
	private int ground_resv_total_price;
	private int mem_seq;
	private String ground_resv_comment;
	private int ground_resv_auth;
	
	private int seller_seq;
	private String ground_name;
	private String ground_photo;
	
	
	
	public groundResvParam() {
		super();
	}
	public groundResvParam(int ground_resv_seq, int ground_seq, int ground_resv_user, int ground_resv_pet, String ground_resv_time,
			String ground_resv_ydate, String ground_resv_sdate, String ground_resv_tel, String ground_resv_name,
			int ground_resv_payment, int ground_resv_total_price, int mem_seq, String ground_resv_comment, int ground_resv_auth,
			int seller_seq, String ground_name,String ground_photo) {
		super();
		this.ground_resv_seq = ground_resv_seq;
		this.ground_seq = ground_seq;
		this.ground_resv_user = ground_resv_user;
		this.ground_resv_pet = ground_resv_pet;
		this.ground_resv_time = ground_resv_time;
		this.ground_resv_ydate = ground_resv_ydate;
		this.ground_resv_sdate = ground_resv_sdate;
		this.ground_resv_tel = ground_resv_tel;
		this.ground_resv_name = ground_resv_name;
		this.ground_resv_payment = ground_resv_payment;
		this.ground_resv_total_price = ground_resv_total_price;
		this.mem_seq = mem_seq;
		this.ground_resv_comment = ground_resv_comment;
		this.ground_resv_auth = ground_resv_auth;
		this.seller_seq = seller_seq;
		this.ground_name = ground_name;
		this.ground_photo = ground_photo;
	}
	
	public int getGround_resv_seq() {
		return ground_resv_seq;
	}
	public void setGround_resv_seq(int ground_resv_seq) {
		this.ground_resv_seq = ground_resv_seq;
	}
	public int getGround_seq() {
		return ground_seq;
	}
	public void setGround_seq(int ground_seq) {
		this.ground_seq = ground_seq;
	}
	public int getGround_resv_user() {
		return ground_resv_user;
	}
	public void setGround_resv_user(int ground_resv_user) {
		this.ground_resv_user = ground_resv_user;
	}
	public int getGround_resv_pet() {
		return ground_resv_pet;
	}
	public void setGround_resv_pet(int ground_resv_pet) {
		this.ground_resv_pet = ground_resv_pet;
	}
	public String getGround_resv_time() {
		return ground_resv_time;
	}
	public void setGround_resv_time(String ground_resv_time) {
		this.ground_resv_time = ground_resv_time;
	}
	public String getGround_resv_ydate() {
		return ground_resv_ydate;
	}
	public void setGround_resv_ydate(String ground_resv_ydate) {
		this.ground_resv_ydate = ground_resv_ydate;
	}
	public String getGround_resv_sdate() {
		return ground_resv_sdate;
	}
	public void setGround_resv_sdate(String ground_resv_sdate) {
		this.ground_resv_sdate = ground_resv_sdate;
	}
	public String getGround_resv_tel() {
		return ground_resv_tel;
	}
	public void setGround_resv_tel(String ground_resv_tel) {
		this.ground_resv_tel = ground_resv_tel;
	}
	public String getGround_resv_name() {
		return ground_resv_name;
	}
	public void setGround_resv_name(String ground_resv_name) {
		this.ground_resv_name = ground_resv_name;
	}
	public int getGround_resv_payment() {
		return ground_resv_payment;
	}
	public void setGround_resv_payment(int ground_resv_payment) {
		this.ground_resv_payment = ground_resv_payment;
	}
	public int getGround_resv_total_price() {
		return ground_resv_total_price;
	}
	public void setGround_resv_total_price(int ground_resv_total_price) {
		this.ground_resv_total_price = ground_resv_total_price;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getGround_resv_comment() {
		return ground_resv_comment;
	}
	public void setGround_resv_comment(String ground_resv_comment) {
		this.ground_resv_comment = ground_resv_comment;
	}
	public int getGround_resv_auth() {
		return ground_resv_auth;
	}
	public void setGround_resv_auth(int ground_resv_auth) {
		this.ground_resv_auth = ground_resv_auth;
	}
	public int getSeller_seq() {
		return seller_seq;
	}
	public void setSeller_seq(int seller_seq) {
		this.seller_seq = seller_seq;
	}
	public String getGround_name() {
		return ground_name;
	}
	public void setGround_name(String ground_name) {
		this.ground_name = ground_name;
	}
	public String getGround_photo() {
		return ground_photo;
	}
	public void setGround_photo(String ground_photo) {
		this.ground_photo = ground_photo;
	}
	@Override
	public String toString() {
		return "groundResvParam [ground_resv_seq=" + ground_resv_seq + ", ground_seq=" + ground_seq
				+ ", ground_resv_user=" + ground_resv_user + ", ground_resv_pet=" + ground_resv_pet
				+ ", ground_resv_time=" + ground_resv_time + ", ground_resv_ydate=" + ground_resv_ydate
				+ ", ground_resv_sdate=" + ground_resv_sdate + ", ground_resv_tel=" + ground_resv_tel
				+ ", ground_resv_name=" + ground_resv_name + ", ground_resv_payment=" + ground_resv_payment
				+ ", ground_resv_total_price=" + ground_resv_total_price + ", mem_seq=" + mem_seq
				+ ", ground_resv_comment=" + ground_resv_comment + ", ground_resv_auth=" + ground_resv_auth
				+ ", seller_seq=" + seller_seq + ", ground_name=" + ground_name + ", ground_photo=" + ground_photo
				+ "]";
	}
	
	
}
