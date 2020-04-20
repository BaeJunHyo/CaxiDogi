package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopResvDto;

public interface ShopDao {
	public boolean addShop(shopDto shop);
	public boolean shopModifyAf(shopDto shop);
	public List<shopDto> getShopList();
	public List<shopDto> getSellerShopList(int mem_seq);
	public List<shopDesignerDto> getDesigner(int shop_seq);
	public List<String> getResv(shopResvDto resvDto);
	public shopDto getShopDetail(int shop_seq);
	public boolean addDesigner(shopDesignerDto designer);

}
