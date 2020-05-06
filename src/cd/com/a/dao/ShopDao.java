package cd.com.a.dao;

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

public interface ShopDao {
	public boolean addShop(shopDto shop);
	public boolean shopModifyAf(shopDto shop);
	public boolean shopStopAf(int shop_seq);
	//paging search
	public List<shopDto> getShopList(shopListParam param);										//shop list 뿌려주는거 (paging, search)
	public int getShopCount();																	// shop 총 개수 
 	public List<shopSellerResvParam> getSellerShopResvList(shopSellerPagingParam param);		// 셀러 샵 예약 리스트
	public int getSellerResvCount(shopSellerPagingParam param);									// 셀러 샵 개수 
 	
	public shopSellerResvParam getSellerResvDetail(int shop_resv_seq);							// 셀러가 예약 디테일 보는거 
	
	public List<shopDto> getSellerShopList(int mem_seq);
	public List<shopDesignerDto> getDesigner(int shop_seq);										// 샵 디테일 들어가서 디자인 뿌려줄때
	public List<shopDesignerDto> getDesignerAll(int shop_seq);
	public shopDesignerDto getDesignerInfo(shopDesignerDto designer);
	public boolean designModify(shopDesignerDto designer);
	public List<String> getResv(shopResvDto resvDto);											// 샵 예약할때 예약된 시간 가져오는거 
	public shopDto getShopDetail(int shop_seq);													// 샵 디테일
	public boolean addDesigner(shopDesignerDto designer);
	public boolean stopDesignAf(shopDesignerDto designer);
	public boolean playDesignAf(shopDesignerDto designer);
	public boolean delDesignAf(shopDesignerDto designer);
	public int checkDesign(shopDesignerDto designer);
	public shopDesignerDto getDesignerInfo(int design_seq);										// 샵 예약 할때랑 예약 후 디자이너 뿌려줄때
	public int resvShop(shopResvDto shopResv);
	public shopResvDto getShopResv(int shop_resv_seq);
	// paging
	public List<shopShowResvParam> showShopResv(shopPagingParam param);							// 유저가 예약한 샵 리스트 
	public int getShopResvCount(int mem_seq);
	public List<shopShowResvParam> shopShopCancelResv(shopPagingParam param);					// 유저가 취소한 리스트
	public int getShopCancelResvCount(int mem_seq);						
	
	public boolean cancelShopResv(shopResvDto shopresv);										// 유저가 예약 취소
	public int shopCalcelTimeCheck(shopResvDto shopresv);										// 샵 취소할수 있는지 없는지 
	
	public boolean shopResvUpdate(shopResvDto resv);											// 예약 변경

	//admin
	public List<shopDto> adminShopList(adminShopParam param);
	public int adminShopListCount(adminShopParam param);
	public boolean adminShopOk(int shop_seq);
	public boolean adminShopNo(int shop_seq);
	
	//CheckDesigner
	public boolean checkDesigner(int shop_seq);
}
