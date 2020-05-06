package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.basketDao;
import cd.com.a.model.amountParam;
import cd.com.a.model.basketDto;
import cd.com.a.model.saleBasketParam;

@Repository
public class basketDaoImpl implements basketDao {
	
	@Autowired
	SqlSession sqlSession;
	String ns = "orderBasket.";
	
	@Override
	public boolean createBasket(basketDto dto) {
		return sqlSession.insert(ns + "Basket_create", dto)>0?true:false;
	}

	@Override
	public List<basketDto> getMyBasketList(int mem_seq) {
		return sqlSession.selectList(ns + "getMyBasketList", mem_seq);
	}

	@Override
	public boolean deleteMyBasket(int basket_num) {

		return sqlSession.delete(ns + "deleteMyBasket", basket_num)>0? true: false;
	}

	@Override
	public boolean amountUpdate(amountParam param) {
		
		return sqlSession.update(ns + "amountUpdate", param)>0?true:false;
	}

	@Override
	public basketDto getBasketDto(int basket_num) {
		
		return sqlSession.selectOne(ns + "getBasketDto", basket_num);
	}

	@Override
	public void saleBasket(saleBasketParam param) {
		sqlSession.delete(ns + "saleBasket", param);
		
	}
	
	
	
	
	
}
