package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.PoolDao;
import cd.com.a.model.poolDto;
import cd.com.a.model.poolResvDto;

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

	@Override
	public poolDto getPoolDetail(int pool_seq) {
		return sqlSession.selectOne(namespace+"getPoolDetail", pool_seq);
	}

	@Override
	public int resvPool(poolResvDto poolResv) {
		int n = sqlSession.insert(namespace+"resvPool", poolResv);
		System.out.println(poolResv.getPool_resv_seq());
		int pool_resv_seq = 0;
		if(n>0) {
			pool_resv_seq = poolResv.getPool_resv_seq();
		}
		return pool_resv_seq;
	}

	@Override
	public poolResvDto getResvPool(int pool_resv_seq) {
		return sqlSession.selectOne(namespace+"getResvPool", pool_resv_seq);
	}

	@Override
	public List<poolDto> getSellerPoolList(int mem_seq) {
		return sqlSession.selectList(namespace+"getSellerPoolList", mem_seq);
	}

	@Override
	public boolean modifyPool(poolDto pool) {
		int n = sqlSession.update(namespace+"modifyPool", pool);
		return n>0?true:false; 
	}

}
