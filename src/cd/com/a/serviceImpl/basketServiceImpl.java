package cd.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.basketDao;
import cd.com.a.model.basketDto;
import cd.com.a.service.basketService;

@Service
public class basketServiceImpl implements basketService {

	@Autowired
	basketDao basketdao;
	
	@Override
	public boolean createBasket(basketDto dto) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}
