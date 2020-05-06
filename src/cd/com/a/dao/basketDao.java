package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.amountParam;
import cd.com.a.model.basketDto;
import cd.com.a.model.saleBasketParam;

public interface basketDao {

	public boolean createBasket(basketDto dto);
	public List<basketDto> getMyBasketList(int mem_seq);
	public boolean deleteMyBasket(int basket_num);
	public boolean amountUpdate(amountParam param);
	public basketDto getBasketDto(int basket_num);
	public void saleBasket(saleBasketParam param);
	
}
