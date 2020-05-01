package cd.com.a.service;

import java.util.List;

import cd.com.a.model.AdminPoolParam;
import cd.com.a.model.PoolListParam;
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
	public List<poolResvParam> getTodayResvList(poolParam param);
	public int getTodayResvCount(poolParam param);
	public boolean poolUse(int pool_resv_seq);
	public poolResvParam getSellerResvDetail(int pool_resv_seq);
	public boolean setTotalPrice(poolResvParam poolResv);
	public boolean setPayment(poolResvParam poolResv);
	
	public List<poolDto> getPoolList(PoolListParam param);
	public int getPoolCount(PoolListParam param);
	public List<poolResvParam> poolResvList(poolParam param);
	public boolean poolCancleAf(int pool_resv_seq);
	public int getPoolResvUserCount(poolParam param);
	public int resvPool(poolResvDto poolResv);
	public poolResvDto getResvPool(int pool_resv_seq);
	public int getPoolCancleCount(poolParam param);
	public List<poolResvParam> poolCancleList(poolParam param);
	
	//admin
	public boolean adminPoolOk(int pool_seq);
	public boolean adminPoolNo(int pool_seq);
	public List<poolDto> adminPoolList(AdminPoolParam param);
	public int adminPoolListCount(AdminPoolParam param);
}
