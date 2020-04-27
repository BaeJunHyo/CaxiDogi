package cd.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.MyPageDao;
import cd.com.a.model.groundResvParam;
import cd.com.a.model.poolResvParam;
import cd.com.a.model.shopShowResvParam;
import cd.com.a.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDao myPageDao;
	
	@Override
	public List<poolResvParam> getPoolResvList(int mem_seq) {
		// TODO Auto-generated method stub
		return myPageDao.getPoolResvList(mem_seq);
	}
	@Override
	public List<groundResvParam> getGroundResvList(int mem_seq) {
		// TODO Auto-generated method stub
		return myPageDao.getGroundResvList(mem_seq);
	}

	@Override
	public List<shopShowResvParam> getShopResvList(int mem_seq) {
		// TODO Auto-generated method stub
		return myPageDao.getShopResvList(mem_seq);
	}

	

}
