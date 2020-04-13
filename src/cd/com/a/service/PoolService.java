package cd.com.a.service;

import java.util.List;

import cd.com.a.model.poolDto;

public interface PoolService {
	
	public boolean addPool(poolDto pool);
	public List<poolDto> getPoolList();
}
