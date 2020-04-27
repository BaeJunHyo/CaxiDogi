package cd.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.orderDao;
import cd.com.a.model.memberDto;
import cd.com.a.service.orderService;

@Service
public class orderServiceImpl implements orderService {

	@Autowired
	orderDao orderdao;

	@Override
	public memberDto getDefultAddress(int mem_seq) {
		return orderdao.getDefultAddress(mem_seq);
	}
	
	
	
}
