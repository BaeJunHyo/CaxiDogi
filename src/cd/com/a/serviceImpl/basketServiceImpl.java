package cd.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.basketDao;
import cd.com.a.model.amountParam;
import cd.com.a.model.basketDto;
import cd.com.a.model.saleBasketParam;
import cd.com.a.service.basketService;

@Service
public class basketServiceImpl implements basketService {

	@Autowired
	basketDao basketdao;
	
	@Override
	public boolean createBasket(basketDto dto) {
		return basketdao.createBasket(dto);
	}

	@Override
	public List<basketDto> getMyBasketList(int mem_seq) {
		return basketdao.getMyBasketList(mem_seq);
	}

	@Override
	public boolean deleteMyBasket(int basket_num) {
		return basketdao.deleteMyBasket(basket_num);
	}

	@Override
	public boolean amountUpdate(amountParam param) {
		
		return basketdao.amountUpdate(param);
	}

	@Override
	public basketDto getBasketDto(int basket_num) {
		
		return basketdao.getBasketDto(basket_num);
	}

	@Override
	public void saleBasket(saleBasketParam param) {
		basketdao.saleBasket(param);
	}
	
	
}
