package cd.com.a.goods;

import java.util.List;

import cd.com.a.model.productDto;

public interface DetailDao {
	
	public List<productDto> getPrdList();
	public productDto getPrd(int product_num);
	
}
