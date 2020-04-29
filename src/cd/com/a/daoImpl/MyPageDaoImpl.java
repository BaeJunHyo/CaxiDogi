package cd.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.MyPageDao;
import cd.com.a.model.groundResvParam;
import cd.com.a.model.poolResvParam;
import cd.com.a.model.shopShowResvParam;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "MyPage.";
	
	@Override
	public List<poolResvParam> getPoolResvList(int mem_seq) {
		return sqlSession.selectList(ns+"getPoolResvList", mem_seq);
	}
	@Override
	public List<groundResvParam> getGroundResvList(int mem_seq) {
		return sqlSession.selectList(ns+"getGroundResvList", mem_seq);
	}
	@Override
	public List<shopShowResvParam> getShopResvList(int mem_seq) {
		return sqlSession.selectList(ns+"getShopResvList", mem_seq);
	}
	@Override
	public List<poolResvParam> sellerPoolResvList(int mem_seq) {
		return sqlSession.selectList(ns+"sellerPoolResvList", mem_seq);
	}
	@Override
	public List<shopShowResvParam> sellerShopResvList(int mem_seq) {
		return sqlSession.selectList(ns+"sellerShopResvList", mem_seq);
	}
	
	
}
