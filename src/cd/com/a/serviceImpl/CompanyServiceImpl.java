package cd.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.CompanyDao;
import cd.com.a.model.companyDto;
import cd.com.a.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	CompanyDao companyDao;
	
	@Override
	public int addCompany(companyDto company) {
		return companyDao.addCompany(company);
	}

}
