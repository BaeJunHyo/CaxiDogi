package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.PoolDao;
import cd.com.a.model.poolDto;

@Repository
public class PoolDaoImpl implements PoolDao{
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace ="Shop.";

	@Override
	public boolean addPool(poolDto pool) {
		int n = sqlSession.insert(namespace+"addPool", pool);
		return n>0?true:false;
	}

}
