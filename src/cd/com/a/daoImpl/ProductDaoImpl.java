package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.ProductDao;
import cd.com.a.model.productDto;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Product.";

	@Override
	public boolean productInsert(productDto dto) {
		int result = sqlSession.insert(ns + "productInsert", dto);
		System.out.println("result=" + result);
		return result > 0 ? true:false;
	}



}
