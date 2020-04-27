package cd.com.a.service;

import java.util.List;

import cd.com.a.model.poolDto;
import cd.com.a.model.poolParam;
import cd.com.a.model.poolResvDto;
import cd.com.a.model.poolResvParam;

public interface PoolService {
	
	public boolean addPool(poolDto pool);
	public boolean modifyPool(poolDto pool);
	public poolDto getPoolDetail(int pool_seq);
	public List<poolDto> getSellerPoolList(int mem_seq);
	public List<poolResvParam> getSellerResvList(poolParam param);
	public int getPoolResvCount(poolParam param);
	public poolResvParam getSellerResvDetail(int pool_resv_seq);
	public boolean setTotalPrice(poolResvParam poolResv);
	public boolean setPayment(poolResvParam poolResv);
	
	public List<poolDto> getPoolList();
	public List<poolResvParam> poolResvList(poolParam param);
	public int getPoolResvUserCount(poolParam param);
	public int resvPool(poolResvDto poolResv);
	public poolResvDto getResvPool(int pool_resv_seq);
}
