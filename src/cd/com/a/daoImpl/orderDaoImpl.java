package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.orderDao;

@Repository
public class orderDaoImpl implements orderDao {

	
	@Autowired
	SqlSession sqlSession;
	String ns = "productOrder.";
	
	
	
}
