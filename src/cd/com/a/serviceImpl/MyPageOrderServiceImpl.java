package cd.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.MyPageOrderDao;
import cd.com.a.service.MyPageOrderService;

@Service
public class MyPageOrderServiceImpl implements MyPageOrderService {

	@Autowired
	MyPageOrderDao myPageOrderDao;
	
}
