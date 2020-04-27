package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.PoolDao;
import cd.com.a.model.poolDto;
import cd.com.a.model.poolParam;
import cd.com.a.model.poolResvDto;
import cd.com.a.model.poolResvParam;

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

	@Override
	public List<poolResvParam> getSellerResvList(poolParam param) {
		return sqlSession.selectList(namespace+"getSellerResvList", param);
	}

	@Override
	public poolResvParam getSellerResvDetail(int pool_resv_seq) {
		return sqlSession.selectOne(namespace+"getSellerResvDetail", pool_resv_seq);
	}

	@Override
	public boolean setTotalPrice(poolResvParam poolResv) {
		 int n = sqlSession.update(namespace+"setTotalPrice", poolResv);
		 return n>0?true:false; 
	}

	@Override
	public boolean setPayment(poolResvParam poolResv) {
		int n = sqlSession.update(namespace+"setPayment", poolResv);
		return n>0?true:false;
	}

	@Override
	public int getPoolResvCount(poolParam param) {
		return sqlSession.selectOne(namespace+"getPoolResvCount", param);
	}

}
