package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.groundResvParam;
import cd.com.a.model.poolResvParam;
import cd.com.a.model.shopShowResvParam;

public interface MyPageDao {

	List<poolResvParam> getPoolResvList(int mem_seq);

	List<shopShowResvParam> getShopResvList(int mem_seq);

	List<groundResvParam> getGroundResvList(int mem_seq);
	
	List<poolResvParam> sellerPoolResvList(int mem_seq);

	List<shopShowResvParam> sellerShopResvList(int mem_seq);
	

}
