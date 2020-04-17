package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.shopDto;

public interface ShopDao {
	public boolean addShop(shopDto shop);
	public List<shopDto> getShopList();
	public List<shopDto> getSellerShopList(int mem_seq);
}
