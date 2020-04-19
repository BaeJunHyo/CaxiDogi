package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.ShopDao;
import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;

@Repository
public class ShopDaoImpl implements ShopDao {
	@Autowired
	SqlSession sqlSession;
	
	String namespace ="Shop.";

	@Override
	public boolean addShop(shopDto shop) {
		int n = sqlSession.insert(namespace+"addShop", shop);
		return n>0?true:false;
	}
	
	@Override
	public List<shopDto> getShopList() {
		List<shopDto> list = sqlSession.selectList(namespace +"getShopList");
		return list;
	}

	@Override
	public List<shopDto> getSellerShopList(int mem_seq) {
		List<shopDto> list = sqlSession.selectList(namespace +"getSellerShopList", mem_seq);
		return list;
	}

	@Override
	public boolean addDesigner(shopDesignerDto designer) {
		int n = sqlSession.insert(namespace+"addDesigner", designer);
		return n>0?true:false;
	}
	
}
