package cd.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.PoolDao;
import cd.com.a.model.poolDto;
import cd.com.a.model.poolResvDto;
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
	public List<poolDto> getPoolList() {
		return poolDao.getPoolList();
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

}
