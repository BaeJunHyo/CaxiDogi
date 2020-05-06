package cd.com.a.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.model.ProductParam;
import cd.com.a.model.productDto;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	DetailDao detailDao;

	@Override
	public List<productDto> getPrdList(ProductParam prdparam) {
		return detailDao.getPrdList(prdparam);
	}

	@Override
	public int getPrdPageCount(ProductParam prdparam) {
		return detailDao.getPrdPageCount(prdparam);
	}
	
	@Override
	public productDto getPrd(int product_num) {
		return detailDao.getPrd(product_num);
	}

	@Override
	public List<productDto> getOptionProduct(String product_name) {
		//디테일 화면으로 갈때 option 제품을 뽑는 메소드
		return detailDao.getOptionProduct(product_name);
	}

	
}
