package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.ShopDao;
import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopResvDto;

@Repository
public class ShopDaoImpl implements ShopDao {
	@Autowired
	SqlSession sqlSession;
	
	String ns ="Shop.";

	@Override
	public boolean addShop(shopDto shop) {
		int n = sqlSession.insert(ns+"addShop", shop);
		return n>0?true:false;
	}
	
	@Override
	public List<shopDto> getShopList() {
		List<shopDto> list = sqlSession.selectList(ns +"getShopList");
		return list;
	}

	@Override
	public List<shopDto> getSellerShopList(int mem_seq) {
		List<shopDto> list = sqlSession.selectList(ns +"getSellerShopList", mem_seq);
		return list;
	}
	
	@Override
	public List<shopDesignerDto> getDesigner(int shop_seq) {
		List<shopDesignerDto> deslist = sqlSession.selectList(ns+"getDesigner", shop_seq);
		return deslist;
	}

	@Override
	public List<String> getResv(shopResvDto resvDto) {
		List<String> list = sqlSession.selectList(ns+"getShopResv", resvDto);
		return list;
	}

	@Override
	public shopDto getShopDetail(int shop_seq) {
		shopDto dto = sqlSession.selectOne(ns+"getShopDetail", shop_seq);
		return dto;
	}
	@Override
	public boolean addDesigner(shopDesignerDto designer) {
		int n = sqlSession.insert(ns+"addDesigner", designer);
		return n>0?true:false;
	}

	@Override
	public shopDesignerDto getDesignerInfo(int design_seq) {
		shopDesignerDto dto = sqlSession.selectOne(ns+"getDesignerInfo", design_seq);
		return dto;
	}
	
	
	
}
