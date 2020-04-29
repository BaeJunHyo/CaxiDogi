package cd.com.a.bo;

import java.util.List;

import cd.com.a.model.ProductParam;
import cd.com.a.model.productDto;

public interface ProductDao {
	
	public List<productDto> prdSearchList(ProductParam prdParam);
	public int getPrdCount(ProductParam prdParam);
	
	
	public boolean productInsert(productDto dto);
	
	public productDto getPrd(int product_num);
	
	public boolean prdUpdate(productDto dto);
	
	public boolean prdDelete(int[] product_num) throws Exception;
	
	
}
