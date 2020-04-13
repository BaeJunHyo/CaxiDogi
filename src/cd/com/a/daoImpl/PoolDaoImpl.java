package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.PoolDao;
import cd.com.a.model.poolDto;

@Repository
public class PoolDaoImpl implements PoolDao{
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace ="Pool.";

	@Override
	public boolean addPool(poolDto pool) {
		int n = sqlSession.insert(namespace+"addPool", pool);
		return n>0?true:false;
	}

	@Override
	public List<poolDto> getPoolList() {
		return sqlSession.selectList(namespace+"getPoolList");
	}

}
