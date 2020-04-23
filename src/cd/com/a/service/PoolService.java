package cd.com.a.service;

import java.util.List;

import cd.com.a.model.poolDto;
import cd.com.a.model.poolResvDto;
import cd.com.a.model.poolResvParam;

public interface PoolService {
	
	public boolean addPool(poolDto pool);
	public boolean modifyPool(poolDto pool);
	public List<poolDto> getPoolList();
	public poolDto getPoolDetail(int pool_seq);
	public List<poolDto> getSellerPoolList(int mem_seq);
	
	
	public List<poolResvParam> getSellerResvList(int mem_seq);
	public int resvPool(poolResvDto poolResv);
	public poolResvDto getResvPool(int pool_resv_seq);
}
