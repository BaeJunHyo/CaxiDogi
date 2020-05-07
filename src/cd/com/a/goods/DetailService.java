package cd.com.a.goods;

import java.util.List;

import cd.com.a.model.productDto;

public interface DetailService {

	public List<productDto> getPrdList();
	public productDto getPrd(int product_num);
	public List<productDto> getOptionProduct(String product_name); //디테일 화면으로 갈때 option 제품을 뽑는 메소드
	
	
	public boolean readcountPlus(int product_num);
	public List<productDto> getOption_productList(String option);
}
