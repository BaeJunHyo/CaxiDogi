package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.CompanyDao;
import cd.com.a.model.companyDto;

@Repository
public class CompanyDaoImpl implements CompanyDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace ="Company.";

	@Override
	public int addCompany(companyDto company) {
		int status = sqlSession.insert(namespace+"addCompany", company);
		return status;
	}
	
	
}
