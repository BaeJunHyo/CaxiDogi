package cd.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.PoolDao;
import cd.com.a.model.AdminPoolParam;
import cd.com.a.model.PoolListParam;
import cd.com.a.model.poolDto;
import cd.com.a.model.poolParam;
import cd.com.a.model.poolResvDto;
import cd.com.a.model.poolResvParam;
import cd.com.a.service.PoolService;

@Service
public class PoolServiceImpl implements PoolService {
	@Autowired
	PoolDao poolDao;

	@Override
	public boolean addPool(poolDto pool) {
		return poolDao.addPool(pool);
	}

	@Override
	public List<poolDto> getPoolList(PoolListParam param) {
		return poolDao.getPoolList(param);
	}

	@Override
	public poolDto getPoolDetail(int pool_seq) {
		return poolDao.getPoolDetail(pool_seq);
	}

	@Override
	public int resvPool(poolResvDto poolResv) {
		return poolDao.resvPool(poolResv);
	}

	@Override
	public poolResvDto getResvPool(int pool_resv_seq) {
		return poolDao.getResvPool(pool_resv_seq);
	}

	@Override
	public List<poolDto> getSellerPoolList(int mem_seq) {
		return poolDao.getSellerPoolList(mem_seq);
	}

	@Override
	public boolean modifyPool(poolDto pool) {
		return poolDao.modifyPool(pool);
	}

	@Override
	public List<poolResvParam> getSellerResvList(poolParam param) {
		return poolDao.getSellerResvList(param);
	}

	@Override
	public poolResvParam getSellerResvDetail(int pool_resv_seq) {
		return poolDao.getSellerResvDetail(pool_resv_seq);
	}

	@Override
	public boolean setTotalPrice(poolResvParam poolResv) {
		return poolDao.setTotalPrice(poolResv);
	}

	@Override
	public boolean setPayment(poolResvParam poolResv) {
		return poolDao.setPayment(poolResv);
	}

	@Override
	public int getPoolResvCount(poolParam param) {
		return poolDao.getPoolResvCount(param);
	}

	@Override
	public List<poolResvParam> poolResvList(poolParam param) {
		return poolDao.poolResvList(param);
	}

	@Override
	public int getPoolResvUserCount(poolParam param) {
		return poolDao.getPoolResvUserCount(param);
	}

	@Override
	public boolean poolCancleAf(int pool_resv_seq) {
		return poolDao.poolCancleAf(pool_resv_seq);
	}

	@Override
	public List<poolResvParam> getTodayResvList(poolParam param) {
		return poolDao.getTodayResvList(param);
	}

	@Override
	public int getTodayResvCount(poolParam param) {
		return poolDao.getPoolResvUserCount(param);
	}

	@Override
	public boolean poolUse(int pool_resv_seq) {
		return poolDao.poolUse(pool_resv_seq);
	}

	@Override
	public boolean adminPoolOk(int pool_seq) {
		return poolDao.adminPoolOk(pool_seq);
	}

	@Override
	public boolean adminPoolNo(int pool_seq) {
		return poolDao.adminPoolNo(pool_seq);
	}

	@Override
	public List<poolDto> adminPoolList(AdminPoolParam param) {
		return poolDao.adminPoolList(param);
	}

	@Override
	public int adminPoolListCount(AdminPoolParam param) {
		return poolDao.adminPoolListCount(param);
	}

	@Override
	public int getPoolCount(PoolListParam param) {
		return poolDao.getPoolCount(param);
	}

	@Override
	public int getPoolCancleCount(poolParam param) {
		return poolDao.getPoolCancleCount(param);
	}

	@Override
	public List<poolResvParam> poolCancleList(poolParam param) {
		return poolDao.poolCancleList(param);
	}

}
