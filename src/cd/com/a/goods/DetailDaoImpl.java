package cd.com.a.goods;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.model.productDto;

@Repository
public class DetailDaoImpl implements DetailDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Product.";
	
	@Override
	public List<productDto> getPrdList() {
		List<productDto> prdList = sqlSession.selectList(ns + "getPrdList");
		return prdList;
	}

	
	@Override
	public productDto getPrd(int product_num) {
		productDto prddto = sqlSession.selectOne(ns + "getPrd", product_num);
		return prddto;
	}
	
	
}
