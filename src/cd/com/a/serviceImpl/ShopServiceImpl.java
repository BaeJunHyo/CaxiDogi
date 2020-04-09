package cd.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.ShopDao;
import cd.com.a.model.shopDto;
import cd.com.a.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	ShopDao shopDao;

	@Override
	public boolean addShop(shopDto shop) {
		return shopDao.addShop(shop);
	}
	
	
}
