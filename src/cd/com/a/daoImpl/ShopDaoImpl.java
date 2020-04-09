package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.ShopDao;
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
	
}
