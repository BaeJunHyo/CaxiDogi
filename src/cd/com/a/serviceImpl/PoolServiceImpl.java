package cd.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.PoolDao;
import cd.com.a.model.poolDto;
import cd.com.a.service.PoolService;

@Service
public class PoolServiceImpl implements PoolService {
	@Autowired
	PoolDao poolDao;

	@Override
	public boolean addPool(poolDto pool) {
		return poolDao.addPool(pool);
	}

}
