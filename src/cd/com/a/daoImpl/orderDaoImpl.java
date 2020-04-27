package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.orderDao;
import cd.com.a.model.memberDto;

@Repository
public class orderDaoImpl implements orderDao {

	
	@Autowired
	SqlSession sqlSession;
	String ns = "productOrder.";
	
	@Override
	public memberDto getDefultAddress(int mem_seq) {
		
		return sqlSession.selectOne(ns + "getDefultAddress", mem_seq);
	}
	
	
	
}
