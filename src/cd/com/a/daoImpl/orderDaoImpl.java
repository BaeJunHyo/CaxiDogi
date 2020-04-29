package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.orderDao;
import cd.com.a.model.memberDto;
import cd.com.a.model.productSaleDto;

@Repository
public class orderDaoImpl implements orderDao {

	
	@Autowired
	SqlSession sqlSession;
	String ns = "productOrder.";
	
	@Override
	public memberDto getDefultAddress(int mem_seq) {
		
		return sqlSession.selectOne(ns + "getDefultAddress", mem_seq);
	}

	@Override
	public boolean crete_productOrder(productSaleDto saleList) {

		return sqlSession.insert(ns + "crete_productOrder", saleList) > 0? true:false;
	}

	@Override
	public void create_SaleGroup(int mem_seq) {
		sqlSession.insert(ns + "create_SaleGroup", mem_seq);
	}

	@Override
	public int getSaleGroup(int mem_seq) {
		return sqlSession.selectOne(ns + "getSaleGroup", mem_seq);
	}

	@Override
	public boolean kakaoUpdate(productSaleDto saleDto) {
		return sqlSession.update(ns + "kakaoUpdate", saleDto)>0?true:false;
	}

	@Override
	public productSaleDto getNowSaleing(int mem_seq) {
		return sqlSession.selectOne(ns + "getNowSaleing", mem_seq);
	}
	
	
	
}
