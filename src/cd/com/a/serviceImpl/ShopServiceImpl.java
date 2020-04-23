package cd.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.ShopDao;
import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopResvDto;
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
	public List<shopDto> getShopList() {
		return shopDao.getShopList();
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

}
