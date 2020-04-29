package cd.com.a.bo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	SqlSession sqlSession;
	String ns = "Order.";
	
}
