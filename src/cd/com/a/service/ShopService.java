package cd.com.a.service;

import java.util.List;

import cd.com.a.model.shopDto;

public interface ShopService {
	
	public boolean addShop(shopDto shop);
	public List<shopDto> getShopList();

}
