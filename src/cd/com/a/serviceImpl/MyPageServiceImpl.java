package cd.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.MyPageDao;
import cd.com.a.dao.orderDao;
import cd.com.a.model.groundResvParam;
import cd.com.a.model.poolResvParam;
import cd.com.a.model.productSaleDto;
import cd.com.a.model.shopShowResvParam;
import cd.com.a.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDao myPageDao;
	
	@Autowired
	orderDao orderdao;
	
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
	@Override
	public List<poolResvParam> sellerPoolResvList(int mem_seq) {
		return myPageDao.sellerPoolResvList(mem_seq);
	}
	@Override
	public List<shopShowResvParam> sellerShopResvList(int mem_seq) {
		return myPageDao.sellerShopResvList(mem_seq);
	}
	@Override
	public List<Integer> myOrderList_group(int mem_seq) {
		return orderdao.myOrderList_group(mem_seq);
	}
	@Override
	public List<productSaleDto> myOrderList(int saleing_group) {
		return orderdao.getNowSaleingList(saleing_group);
	}
	
	
	

}
