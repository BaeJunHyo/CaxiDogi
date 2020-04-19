package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.dao.MemberDao;
import cd.com.a.model.memberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Member.";
	
	@Override
	public boolean idCheck(memberDto dto) {
		int result = sqlSession.selectOne(ns+"idCheck",dto);
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
		String pwd = sqlSession.selectOne(ns+"findPwd",dto);
		return pwd;
	}

	@Override
	public memberDto snsLogin(memberDto dto) {
		memberDto mem = sqlSession.selectOne(ns+"snsLogin",dto);
		return mem;
	}
	@Override
	public memberDto loginId(int mem_seq) {
		memberDto mem = sqlSession.selectOne(ns+"loginId",mem_seq);
		return mem;
	}
	
	@Override
	public boolean snsFirstUpdate(memberDto dto) {
		int result = sqlSession.update(ns+"snsFirstUpdate",dto);
		return result>0?true:false;
	}
	
	@Override
	public boolean pwdCheck(memberDto dto) {
		int result = sqlSession.selectOne(ns+"pwdCheck",dto);
		return result>0?true:false;
	}
	
	@Override
	public memberDto resvMem(int mem_seq) {
		return sqlSession.selectOne(ns+"resvMem", mem_seq);
	}
	
	
	
	
	
	
	
	
	
	
	
}
