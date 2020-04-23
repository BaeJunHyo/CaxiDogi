package cd.com.a.service;

import java.util.List;

import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopResvDto;
import cd.com.a.model.shopShowResvParam;

public interface ShopService {
	
	public boolean addShop(shopDto shop);
	public List<shopDto> getShopList();
	public List<shopDto> getSellerShopList(int mem_seq);
	public List<shopDesignerDto> getDesigner(int shop_seq);
	public List<String> getResv(shopResvDto resvDto);
	public shopDto getShopDetail(int shop_seq);
	public boolean addDesigner(shopDesignerDto designer);
	public shopDesignerDto getDesignerInfo(int design_seq);
	public int resvShop(shopResvDto shopResv);
	public shopResvDto getShopResv(int shop_resv_seq);
	//public List<shopResvDto> showShopResv(int mem_seq);
	public List<shopShowResvParam> showShopResv(int mem_seq);

}
