package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.basketDao;
import cd.com.a.model.basketDto;

@Repository
public class basketDaoImpl implements basketDao {
	
	@Autowired
	SqlSession sqlSession;
	String ns = "orderBasket.";
	
	@Override
	public boolean createBasket(basketDto dto) {
		return sqlSession.insert(ns + "Basket_create", dto)>0?true:false;
	}
	
}
