package cd.com.a.service;

import java.util.List;

import cd.com.a.model.poolDto;
import cd.com.a.model.poolResvDto;

public interface PoolService {
	
	public boolean addPool(poolDto pool);
	public List<poolDto> getPoolList();
	public poolDto getPoolDetail(int pool_seq);
	public int resvPool(poolResvDto poolResv);
	public poolResvDto getResvPool(int pool_resv_seq);
}