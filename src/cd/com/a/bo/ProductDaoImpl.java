package cd.com.a.bo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.model.ProductParam;
import cd.com.a.model.productDto;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Product.";

	@Override
	public List<productDto> prdSearchList(ProductParam prdParam) {
		return sqlSession.selectList(ns + "prdSearchList", prdParam);
	}
	
	
	@Override
	public boolean productInsert(productDto dto) {
		int result = sqlSession.insert(ns + "productInsert", dto);
		System.out.println("result=" + result);
		return result > 0 ? true:false;
	}


	@Override
	public void prdUpdate(productDto dto) {
		sqlSession.update(ns + "prdUpdate", dto);
	}


	@Override
	public productDto getPrd(int product_num) {
		productDto prddto = sqlSession.selectOne(ns + "getPrd", product_num);
		return prddto;
	}

	
	




}
