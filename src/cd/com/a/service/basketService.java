package cd.com.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.basketDao;
import cd.com.a.model.basketDto;


public interface basketService {

	public boolean createBasket(basketDto dto);
	public List<basketDto> getMyBasketList(int mem_seq);
	public boolean deleteMyBasket(int basket_num);
}
