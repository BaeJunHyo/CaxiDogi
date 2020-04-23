package cd.com.a.service;

import java.util.List;

import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopResvDto;

public interface ShopService {
	
	public boolean addShop(shopDto shop);
	public boolean shopModifyAf(shopDto shop);
	public boolean shopStopAf(int shop_seq);
	public List<shopDto> getShopList();
	public List<shopDto> getSellerShopList(int mem_seq);
	public List<shopDesignerDto> getDesigner(int shop_seq);
	public List<shopDesignerDto> getDesignerAll(int shop_seq);
	public shopDesignerDto getDesignerInfo(shopDesignerDto designer);
	public boolean designModify(shopDesignerDto designer);
	public List<String> getResv(shopResvDto resvDto);
	public shopDto getShopDetail(int shop_seq);
	public boolean addDesigner(shopDesignerDto designer);
	public boolean stopDesignAf(shopDesignerDto designer);
	public boolean playDesignAf(shopDesignerDto designer);
	public boolean delDesignAf(shopDesignerDto designer);
	public int checkDesign(shopDesignerDto designer);


}
