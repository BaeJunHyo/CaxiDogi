package cd.com.a.model;

import java.io.Serializable;
import java.util.Date;

public class KakaoPayApproveDto implements Serializable {

	private String aid;
	private String tid;
	private String cid;
	private String sid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private Object amount;
	private Object card_info;
	private String item_name;
	private String item_code;
	private int quantity;
	private Date created_at;
	private Date approved_at;
	private String payload;
	
	public KakaoPayApproveDto()	{
	}

	public KakaoPayApproveDto(String aid, String tid, String cid, String sid, String partner_order_id,
			String partner_user_id, String payment_method_type, Object amount, Object card_info, String item_name,
			String item_code, int quantity, Date created_at, Date approved_at, String payload) {
		super();
		this.aid = aid;
		this.tid = tid;
		this.cid = cid;
		this.sid = sid;
		this.partner_order_id = partner_order_id;
		this.partner_user_id = partner_user_id;
		this.payment_method_type = payment_method_type;
		this.amount = amount;
		this.card_info = card_info;
		this.item_name = item_name;
		this.item_code = item_code;
		this.quantity = quantity;
		this.created_at = created_at;
		this.approved_at = approved_at;
		this.payload = payload;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public Object getAmount() {
		return amount;
	}

	public void setAmount(Object amount) {
		this.amount = amount;
	}

	public Object getCard_info() {
		return card_info;
	}

	public void setCard_info(Object card_info) {
		this.card_info = card_info;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
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

	public String getPayload() {
		return payload;
	}

	public void setPayload(String payload) {
		this.payload = payload;
	}

	@Override
	public String toString() {
		return "KakaoPayApproveDto [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", sid=" + sid
				+ ", partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", payment_method_type=" + payment_method_type + ", amount=" + amount + ", card_info=" + card_info
				+ ", item_name=" + item_name + ", item_code=" + item_code + ", quantity=" + quantity + ", created_at="
				+ created_at + ", approved_at=" + approved_at + ", payload=" + payload + "]";
	}
	
}
