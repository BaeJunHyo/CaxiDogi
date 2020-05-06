package cd.com.a.goods;

import java.util.List;

import cd.com.a.model.ProductParam;
import cd.com.a.model.productDto;

public interface DetailDao {
	
	public List<productDto> getPrdList(ProductParam prdparam);
	public int getPrdPageCount(ProductParam prdparam);
	public productDto getPrd(int product_num);
	public List<productDto> getOptionProduct(String product_name); //디테일 화면으로 갈때 option 제품을 뽑는 메소드

}
