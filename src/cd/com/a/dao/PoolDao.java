package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.poolDto;

public interface PoolDao {
	
	public boolean addPool(poolDto pool);
	public List<poolDto> getPoolList();

}
