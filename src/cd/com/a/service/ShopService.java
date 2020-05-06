package cd.com.a.service;

import java.util.List;

import cd.com.a.model.adminShopParam;
import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopListParam;
import cd.com.a.model.shopPagingParam;
import cd.com.a.model.shopResvDto;
import cd.com.a.model.shopSellerPagingParam;
import cd.com.a.model.shopSellerResvParam;
import cd.com.a.model.shopShowResvParam;

public interface ShopService {
	
	public boolean addShop(shopDto shop);
	public boolean shopModifyAf(shopDto shop);
	public boolean shopStopAf(int shop_seq);
	//shop paing search
	public List<shopDto> getShopList(shopListParam param);
	public int getShopCount();
	public List<shopSellerResvParam> getSellerShopResvList(shopSellerPagingParam param);
	public int getSellerResvCount(shopSellerPagingParam param);
	
	public shopSellerResvParam getSellerResvDetail(int shop_resv_seq);
	
	public List<shopDto> getSellerShopList(int mem_seq);
	public List<shopDesignerDto> getDesigner(int shop_seq);
	public List<shopDesignerDto> getDesignerAll(int shop_seq);
	public shopDesignerDto getDesignerInfo(shopDesignerDto designer);
	public boolean designModify(shopDesignerDto designer);
	public List<String> getResv(shopResvDto resvDto);
	public shopDto getShopDetail(int shop_seq);
	public boolean addDesigner(shopDesignerDto designer);
	public shopDesignerDto getDesignerInfo(int design_seq);
	public boolean stopDesignAf(shopDesignerDto designer);
	public boolean playDesignAf(shopDesignerDto designer);
	public boolean delDesignAf(shopDesignerDto designer);
	public int checkDesign(shopDesignerDto designer);

	public int resvShop(shopResvDto shopResv);
	public shopResvDto getShopResv(int shop_resv_seq);
	
	//paging
	public List<shopShowResvParam> showShopResv(shopPagingParam param);
	public int getShopResvCount(int mem_seq);
	public List<shopShowResvParam> shopShopCancelResv(shopPagingParam param);
	public int getShopCancelResvCount(int mem_seq);
	
	public boolean cancelShopResv(shopResvDto shopresv);
	public int shopCalcelTimeCheck(shopResvDto shopresv);
	
	public boolean shopResvUpdate(shopResvDto resv);
	//admin
	public List<shopDto> adminShopList(adminShopParam param);
	public int adminShopListCount(adminShopParam param);
	public boolean adminShopOk(int shop_seq);
	public boolean adminShopNo(int shop_seq);
	
	//CheckDesigner
	public boolean checkDesigner(int shop_seq);

}
