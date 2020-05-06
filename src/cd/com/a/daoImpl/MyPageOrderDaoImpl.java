package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.MyPageOrderDao;

@Repository
public class MyPageOrderDaoImpl implements MyPageOrderDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "MyPageOrder.";
	
}
