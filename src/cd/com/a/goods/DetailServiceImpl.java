package cd.com.a.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.model.productDto;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	DetailDao detailDao;

	@Override
	public List<productDto> getPrdList() {
		return detailDao.getPrdList();
	}

	@Override
	public productDto getPrd(int product_num) {
		return detailDao.getPrd(product_num);
	}
	
}
