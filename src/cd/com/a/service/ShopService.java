package cd.com.a.service;

import java.util.List;

import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopResvDto;

public interface ShopService {
	
	public boolean addShop(shopDto shop);
	public List<shopDto> getShopList();
	public List<shopDto> getSellerShopList(int mem_seq);
	public List<shopDesignerDto> getDesigner(int shop_seq);
	public List<String> getResv(shopResvDto resvDto);
	public shopDto getShopDetail(int shop_seq);
	public boolean addDesigner(shopDesignerDto designer);
	public shopDesignerDto getDesignerInfo(int design_seq);


}
