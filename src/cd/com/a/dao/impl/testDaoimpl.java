package cd.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.testDao;
import cd.com.a.model.testDto;

@Repository
public class testDaoimpl implements testDao {
	
	@Autowired
	SqlSession sqlSession;
	String ns = "DBtest.";
	
	
	@Override
	public testDto DBtest() {
		return sqlSession.selectOne(ns + "sel");
	}

		
}
