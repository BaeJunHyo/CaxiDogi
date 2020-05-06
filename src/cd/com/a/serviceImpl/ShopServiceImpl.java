package cd.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.ShopDao;
import cd.com.a.model.adminShopParam;
import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopListParam;
import cd.com.a.model.shopPagingParam;
import cd.com.a.model.shopResvDto;
import cd.com.a.model.shopSellerPagingParam;
import cd.com.a.model.shopSellerResvParam;
import cd.com.a.model.shopShowResvParam;
import cd.com.a.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	ShopDao shopDao;

	@Override
	public boolean addShop(shopDto shop) {
		return shopDao.addShop(shop);
	}
	
	@Override
	public List<shopDto> getShopList(shopListParam param) {
		return shopDao.getShopList(param);
	}

	@Override
	public List<shopDto> getSellerShopList(int mem_seq) {
		return shopDao.getSellerShopList(mem_seq);
	}
	
	@Override
	public List<shopDesignerDto> getDesigner(int shop_seq) {
		return shopDao.getDesigner(shop_seq);
	}
	
	@Override
	public List<shopDesignerDto> getDesignerAll(int shop_seq) {
		return shopDao.getDesignerAll(shop_seq);
	}

	@Override
	public List<String> getResv(shopResvDto resvDto) {
		return shopDao.getResv(resvDto);
	}

	@Override
	public shopDto getShopDetail(int shop_seq) {
		return shopDao.getShopDetail(shop_seq);
	}
	@Override
	public boolean addDesigner(shopDesignerDto designer) {
		return shopDao.addDesigner(designer);
	}

	@Override
	public shopDesignerDto getDesignerInfo(int design_seq) {
		return shopDao.getDesignerInfo(design_seq);
	}
	@Override
	public boolean shopModifyAf(shopDto shop) {
		return shopDao.shopModifyAf(shop);
	}

	@Override
	public int checkDesign(shopDesignerDto designer) {
		return shopDao.checkDesign(designer);
	}

	@Override
	public boolean stopDesignAf(shopDesignerDto designer) {
		return shopDao.stopDesignAf(designer);
	}

	@Override
	public int resvShop(shopResvDto shopResv) {
		return shopDao.resvShop(shopResv);
	}

	@Override
	public shopResvDto getShopResv(int shop_resv_seq) {
		return shopDao.getShopResv(shop_resv_seq);
	}

	@Override
	public List<shopShowResvParam> showShopResv(shopPagingParam param) {
		return shopDao.showShopResv(param);
	}

	
	@Override
	public boolean playDesignAf(shopDesignerDto designer) {
		return shopDao.playDesignAf(designer);
	}

	@Override
	public boolean delDesignAf(shopDesignerDto designer) {
		return shopDao.delDesignAf(designer);
	}

	@Override
	public shopDesignerDto getDesignerInfo(shopDesignerDto designer) {
		return shopDao.getDesignerInfo(designer);
	}

	@Override
	public boolean designModify(shopDesignerDto designer) {
		return shopDao.designModify(designer);
	}

	@Override
	public boolean shopStopAf(int shop_seq) {
		return shopDao.shopStopAf(shop_seq);
	}

	@Override
	public boolean cancelShopResv(shopResvDto shopresv) {
		return shopDao.cancelShopResv(shopresv);
	}

	@Override
	public int shopCalcelTimeCheck(shopResvDto shopresv) {
		return shopDao.shopCalcelTimeCheck(shopresv);
	}

	@Override
	public int getShopResvCount(int mem_seq) {
		return shopDao.getShopResvCount(mem_seq);
	}

	@Override
	public int getShopCount() {
		return shopDao.getShopCount();
	}

	@Override
	public List<shopSellerResvParam> getSellerShopResvList(shopSellerPagingParam param) {
		return shopDao.getSellerShopResvList(param);
	}

	@Override
	public int getSellerResvCount(shopSellerPagingParam param) {
		return shopDao.getSellerResvCount(param);
	}

	@Override
	public shopSellerResvParam getSellerResvDetail(int shop_resv_seq) {
		return shopDao.getSellerResvDetail(shop_resv_seq);
	}

	@Override
	public boolean shopResvUpdate(shopResvDto resv) {
		return shopDao.shopResvUpdate(resv);
	}
	
	
	public List<shopDto> adminShopList(adminShopParam param) {
		return shopDao.adminShopList(param);
	}

	@Override
	public int adminShopListCount(adminShopParam param) {
		return shopDao.adminShopListCount(param);
	}

	@Override
	public boolean adminShopOk(int shop_seq) {
		return shopDao.adminShopOk(shop_seq);
	}

	@Override
	public boolean adminShopNo(int shop_seq) {
		return shopDao.adminShopNo(shop_seq);
	}

	@Override
	public List<shopShowResvParam> shopShopCancelResv(shopPagingParam param) {
		return shopDao.shopShopCancelResv(param);
	}

	@Override
	public int getShopCancelResvCount(int mem_seq) {
		return shopDao.getShopCancelResvCount(mem_seq);
	}
	@Override
	public boolean checkDesigner(int shop_seq) {
		return shopDao.checkDesigner(shop_seq);
	}

}
