package cd.com.a.model;

import java.io.Serializable;


/*
 select resv.pool_resv_seq, resv.pool_seq, resv.pool_resv_user, resv.pool_resv_pet, resv.pool_resv_time,
resv.pool_resv_ydate, resv.pool_resv_sdate, resv.pool_resv_tel, resv.pool_resv_name, resv.pool_resv_payment,
resv.pool_resv_total_price, resv.mem_seq, resv.pool_resv_comment, resv.pool_resv_auth, pool.pool_name, pool.mem_seq as seller_seq
from pool_reservation as resv join pool
on resv.pool_seq = pool.pool_seq
and pool.mem_seq = 
order by pool_resv_ydate asc;
 */

public class poolResvParam implements Serializable {
	private int pool_resv_seq;
	private int pool_seq;
	private int pool_resv_user;
	private int pool_resv_pet;
	private String pool_resv_time;
	private String pool_resv_ydate;
	private String pool_resv_sdate;
	private String pool_resv_tel;
	private String pool_resv_name;
	private int pool_resv_payment;
	private int pool_resv_total_price;
	private int mem_seq;
	private String pool_resv_comment;
	private int pool_resv_auth;
	
	private int seller_seq;
	private String pool_name;
	private String pool_photo;
	
	
	
	public poolResvParam() {
		super();
	}
	public poolResvParam(int pool_resv_seq, int pool_seq, int pool_resv_user, int pool_resv_pet, String pool_resv_time,
			String pool_resv_ydate, String pool_resv_sdate, String pool_resv_tel, String pool_resv_name,
			int pool_resv_payment, int pool_resv_total_price, int mem_seq, String pool_resv_comment, int pool_resv_auth,
			int seller_seq, String pool_name,String pool_photo) {
		super();
		this.pool_resv_seq = pool_resv_seq;
		this.pool_seq = pool_seq;
		this.pool_resv_user = pool_resv_user;
		this.pool_resv_pet = pool_resv_pet;
		this.pool_resv_time = pool_resv_time;
		this.pool_resv_ydate = pool_resv_ydate;
		this.pool_resv_sdate = pool_resv_sdate;
		this.pool_resv_tel = pool_resv_tel;
		this.pool_resv_name = pool_resv_name;
		this.pool_resv_payment = pool_resv_payment;
		this.pool_resv_total_price = pool_resv_total_price;
		this.mem_seq = mem_seq;
		this.pool_resv_comment = pool_resv_comment;
		this.pool_resv_auth = pool_resv_auth;
		this.seller_seq = seller_seq;
		this.pool_name = pool_name;
		this.pool_photo = pool_photo;
	}
	public int getPool_resv_seq() {
		return pool_resv_seq;
	}
	public void setPool_resv_seq(int pool_resv_seq) {
		this.pool_resv_seq = pool_resv_seq;
	}
	public int getPool_seq() {
		return pool_seq;
	}
	public void setPool_seq(int pool_seq) {
		this.pool_seq = pool_seq;
	}
	public int getPool_resv_user() {
		return pool_resv_user;
	}
	public void setPool_resv_user(int pool_resv_user) {
		this.pool_resv_user = pool_resv_user;
	}
	public int getPool_resv_pet() {
		return pool_resv_pet;
	}
	public void setPool_resv_pet(int pool_resv_pet) {
		this.pool_resv_pet = pool_resv_pet;
	}
	public String getPool_resv_time() {
		return pool_resv_time;
	}
	public void setPool_resv_time(String pool_resv_time) {
		this.pool_resv_time = pool_resv_time;
	}
	public String getPool_resv_ydate() {
		return pool_resv_ydate;
	}
	public void setPool_resv_ydate(String pool_resv_ydate) {
		this.pool_resv_ydate = pool_resv_ydate;
	}
	public String getPool_resv_sdate() {
		return pool_resv_sdate;
	}
	public void setPool_resv_sdate(String pool_resv_sdate) {
		this.pool_resv_sdate = pool_resv_sdate;
	}
	public String getPool_resv_tel() {
		return pool_resv_tel;
	}
	public void setPool_resv_tel(String pool_resv_tel) {
		this.pool_resv_tel = pool_resv_tel;
	}
	public String getPool_resv_name() {
		return pool_resv_name;
	}
	public void setPool_resv_name(String pool_resv_name) {
		this.pool_resv_name = pool_resv_name;
	}
	public int getPool_resv_payment() {
		return pool_resv_payment;
	}
	public void setPool_resv_payment(int pool_resv_payment) {
		this.pool_resv_payment = pool_resv_payment;
	}
	public int getPool_resv_total_price() {
		return pool_resv_total_price;
	}
	public void setPool_resv_total_price(int pool_resv_total_price) {
		this.pool_resv_total_price = pool_resv_total_price;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getPool_resv_comment() {
		return pool_resv_comment;
	}
	public void setPool_resv_comment(String pool_resv_comment) {
		this.pool_resv_comment = pool_resv_comment;
	}
	public int getPool_resv_auth() {
		return pool_resv_auth;
	}
	public void setPool_resv_auth(int pool_resv_auth) {
		this.pool_resv_auth = pool_resv_auth;
	}
	public int getSeller_seq() {
		return seller_seq;
	}
	public void setSeller_seq(int seller_seq) {
		this.seller_seq = seller_seq;
	}
	public String getPool_name() {
		return pool_name;
	}
	public void setPool_name(String pool_name) {
		this.pool_name = pool_name;
	}
	
	public String getPool_photo() {
		return pool_photo;
	}
	public void setPool_photo(String pool_photo) {
		this.pool_photo = pool_photo;
	}
	@Override
	public String toString() {
		return "poolResvParam [pool_resv_seq=" + pool_resv_seq + ", pool_seq=" + pool_seq + ", pool_resv_user="
				+ pool_resv_user + ", pool_resv_pet=" + pool_resv_pet + ", pool_resv_time=" + pool_resv_time
				+ ", pool_resv_ydate=" + pool_resv_ydate + ", pool_resv_sdate=" + pool_resv_sdate + ", pool_resv_tel="
				+ pool_resv_tel + ", pool_resv_name=" + pool_resv_name + ", pool_resv_payment=" + pool_resv_payment
				+ ", pool_resv_total_price=" + pool_resv_total_price + ", mem_seq=" + mem_seq + ", pool_resv_comment="
				+ pool_resv_comment + ", pool_resv_auth=" + pool_resv_auth + ", seller_seq=" + seller_seq
				+ ", pool_name=" + pool_name + ", pool_photo=" + pool_photo + "]";
	}
	
}
