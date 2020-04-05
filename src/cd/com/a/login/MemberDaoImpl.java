package cd.com.a.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Member.";
	
	@Override
	public boolean idCheck(String id) {
		int result = sqlSession.selectOne(ns+"idCheck",id);
		System.out.println("result=" + result);
		return result>0?true:false;
	}

	@Override
	public boolean nickCheck(String nick_name) {
		int result = sqlSession.selectOne(ns+"nickCheck",nick_name);
		System.out.println("result=" + result);
		return result>0?true:false;
	}
	
	
	
	
	
}
