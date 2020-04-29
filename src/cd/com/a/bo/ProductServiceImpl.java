package cd.com.a.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.model.ProductParam;
import cd.com.a.model.productDto;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao; 
	
	@Override
	public List<productDto> prdSearchList(ProductParam prdParam) {
		return productDao.prdSearchList(prdParam);
	}
	
	@Override
	public boolean productInsert(productDto dto) {
		return productDao.productInsert(dto);
	}

	
	@Override
	public productDto getPrd(int product_num) {
		return productDao.getPrd(product_num);
	}
	
	@Override
	public boolean prdUpdate(productDto dto) {
		return productDao.prdUpdate(dto);
	}

	@Override
	public boolean prdDelete(int[] product_num) throws Exception {
		return productDao.prdDelete(product_num);
	}

	@Override
	public int getPrdCount(ProductParam prdParam) {
		return productDao.getPrdCount(prdParam);
	}

	
}
