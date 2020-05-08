package cd.com.a.model;

import java.io.Serializable;

public class saleingOptionParam implements Serializable {

	private String option;
	private int saleing_group;
	
	public saleingOptionParam() {	
	}

	public saleingOptionParam(String option, int saleing_group) {
		super();
		this.option = option;
		this.saleing_group = saleing_group;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getSaleing_option() {
		return saleing_group;
	}

	public void setSaleing_option(int saleing_group) {
		this.saleing_group = saleing_group;
	}

	@Override
	public String toString() {
		return "saleingOptionParam [option=" + option + ", saleing_group=" + saleing_group + "]";
	}
	
	
	
	
}
