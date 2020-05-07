package cd.com.a.model;

import java.io.Serializable;

public class SelectedCardInfoDto implements Serializable {

	private String card_bin;
	private int install_month;
	private String card_corp_name;
	private String interest_free_install;
	
	public SelectedCardInfoDto() {
	}

	public SelectedCardInfoDto(String card_bin, int install_month, String card_corp_name, String interest_free_install) {
		super();
		this.card_bin = card_bin;
		this.install_month = install_month;
		this.card_corp_name = card_corp_name;
		this.interest_free_install = interest_free_install;
	}

	public String getCard_bin() {
		return card_bin;
	}

	public void setCard_bin(String card_bin) {
		this.card_bin = card_bin;
	}

	public int getInstall_month() {
		return install_month;
	}

	public void setInstall_month(int install_month) {
		this.install_month = install_month;
	}

	public String getCard_corp_name() {
		return card_corp_name;
	}

	public void setCard_corp_name(String card_corp_name) {
		this.card_corp_name = card_corp_name;
	}

	public String getInterest_free_install() {
		return interest_free_install;
	}

	public void setInterest_free_install(String interest_free_install) {
		this.interest_free_install = interest_free_install;
	}

	@Override
	public String toString() {
		return "Selected_card_info [card_bin=" + card_bin + ", install_month=" + install_month + ", card_corp_name="
				+ card_corp_name + ", interest_free_install=" + interest_free_install + "]";
	}
	
	
}
