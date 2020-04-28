package cd.com.a.daoImpl;

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
	public boolean crete_productOrder(productSaleDto saleDto) {
		return sqlSession.insert(ns + "crete_productOrder", saleDto) > 0? true:false;
	}

	@Override
	public void create_SaleGroup(int mem_seq) {
		sqlSession.insert(ns + "create_SaleGroup", mem_seq);
	}

	@Override
	public int getSaleGroup(int mem_seq) {
		return sqlSession.selectOne(ns + "getSaleGroup", mem_seq);
	}
	
	
	
}
