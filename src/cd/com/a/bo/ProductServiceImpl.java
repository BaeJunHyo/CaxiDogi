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

	
	

	
	
	
}