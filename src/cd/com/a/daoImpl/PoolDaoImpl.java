package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.PoolDao;
import cd.com.a.model.AdminPoolParam;
import cd.com.a.model.PoolListParam;
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
	public List<poolDto> getPoolList(PoolListParam param) {
		return sqlSession.selectList(namespace+"getPoolList", param);
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

	@Override
	public List<poolResvParam> poolResvList(poolParam param) {
		return sqlSession.selectList(namespace+"poolResvList",param);
	}

	@Override
	public int getPoolResvUserCount(poolParam param) {
		return sqlSession.selectOne(namespace+"getPoolResvUserCount", param);
	}

	@Override
	public boolean poolCancleAf(int pool_resv_seq) {
		int n = sqlSession.update(namespace+"poolCancleAf", pool_resv_seq);
		return n>0?true:false;
	}

	@Override
	public List<poolResvParam> getTodayResvList(poolParam param) {
		return sqlSession.selectList(namespace+"getTodayResvList", param);
	}

	@Override
	public int getTodayResvCount(poolParam param) {
		return sqlSession.selectOne(namespace+"getTodayResvCount",param);
	}

	@Override
	public boolean poolUse(int pool_resv_seq) {
		int n = sqlSession.update(namespace+"poolUse", pool_resv_seq);
		return n>0?true:false;
	}

	@Override
	public boolean adminPoolOk(int pool_seq) {
		int n = sqlSession.update(namespace+"adminPoolOk", pool_seq);
		 return n>0?true:false; 
	}

	@Override
	public boolean adminPoolNo(int pool_seq) {
		int n = sqlSession.update(namespace+"adminPoolNo", pool_seq);
		 return n>0?true:false; 
	}

	@Override
	public List<poolDto> adminPoolList(AdminPoolParam param) {
		return sqlSession.selectList(namespace+"adminPoolList", param);
	}

	@Override
	public int adminPoolListCount(AdminPoolParam param) {
		return sqlSession.selectOne(namespace+"adminPoolListCount", param);
	}

	@Override
	public int getPoolCount(PoolListParam param) {
		return sqlSession.selectOne(namespace+"getPoolCount", param);
	}

	@Override
	public int getPoolCancleCount(poolParam param) {
		return sqlSession.selectOne(namespace+"getPoolCancleCount", param);
	}

	@Override
	public List<poolResvParam> poolCancleList(poolParam param) {
		return sqlSession.selectList(namespace+"poolCancleList", param);
	}

}
