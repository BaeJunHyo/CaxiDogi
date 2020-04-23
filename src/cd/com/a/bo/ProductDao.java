package cd.com.a.bo;

import java.util.List;

import cd.com.a.model.ProductParam;
import cd.com.a.model.productDto;

public interface ProductDao {
	
	public List<productDto> prdSearchList(ProductParam prdParam);
	public boolean productInsert(productDto dto);
	
	public productDto getPrd(int product_num);
	
	public void prdUpdate(productDto dto);
	
}
