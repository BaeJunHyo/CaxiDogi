package cd.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.ProductDao;
import cd.com.a.model.productDto;
import cd.com.a.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao; 
	
	@Override
	public boolean productInsert(productDto dto) {
		return productDao.productInsert(dto);
	}

	
	
	
}
