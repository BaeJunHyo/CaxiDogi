package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.basketDto;

public interface basketDao {

	public boolean createBasket(basketDto dto);
	public List<basketDto> getMyBasketList(int mem_seq);
	public boolean deleteMyBasket(int basket_num);
}
