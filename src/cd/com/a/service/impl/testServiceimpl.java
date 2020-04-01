package cd.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.testDao;
import cd.com.a.model.testDto;
import cd.com.a.service.testService;

@Service
public class testServiceimpl implements testService {
	
	@Autowired
	testDao dao;
	
	@Override
	public testDto DBtest() {
		
		return dao.DBtest();
	}

}
