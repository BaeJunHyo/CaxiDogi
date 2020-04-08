package cd.com.a.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.model.memberDto;

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

	@Override
	public boolean newRegi(memberDto dto) {
		int result = sqlSession.insert(ns+"newRegi",dto);
		System.out.println("newRegi Result = " + result);
		return result>0?true:false;
	}

	@Override
	public memberDto login(memberDto dto) {
		memberDto mem = sqlSession.selectOne(ns+"login",dto);
		System.out.println("mem = " + mem);
		
		return mem; 
	}

	@Override
	public String findId(memberDto dto) {
		String id = sqlSession.selectOne(ns+"findId",dto);
		return id;
	}

	@Override
	public String findPwd(memberDto dto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
}
