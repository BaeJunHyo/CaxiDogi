package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.poolDto;
import cd.com.a.model.poolResvDto;

public interface PoolDao {
	
	public boolean addPool(poolDto pool);
	public List<poolDto> getPoolList();
	public poolDto getPoolDetail(int pool_seq);
	public boolean resvPool(poolResvDto poolResv);

}
