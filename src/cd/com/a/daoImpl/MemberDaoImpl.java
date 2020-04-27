package cd.com.a.daoImpl;

import java.util.List;

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
	
	@Override
	public boolean userUpdate(memberDto dto) {
		int result = sqlSession.update(ns+"userUpdate", dto);
		return result>0?true:false;
	}
	@Override
	public boolean snsUserUpdate(memberDto dto) {
		int result = sqlSession.update(ns+"snsUserUpdate", dto);
		return result>0?true:false;
	}

	@Override
	public boolean sellerAccess(int mem_seq) {
		int result = sqlSession.update(ns+"sellerAccess",mem_seq);
		return result>0?true:false;
	}
	@Override
	public boolean sellerAccessPass(int[] mem_seq) {
		int result = sqlSession.update(ns+"sellerAccessPass",mem_seq);
		return result>0?true:false;
	}
	@Override
	public boolean sellerAccessFail(int[] mem_seq) {
		int result = sqlSession.update(ns+"sellerAccessFail",mem_seq);
		return result>0?true:false;
	}
	
	@Override
	public void memberEscape(int mem_seq) {
		sqlSession.update(ns+"memberEscape",mem_seq);
	}
	
	@Override
	public void recoveryId(int mem_seq) {
		sqlSession.update(ns+"recoveryId",mem_seq);
	}
	
	@Override
	public int findSeq(memberDto dto) {
		return sqlSession.selectOne(ns+"findSeq",dto);
	}
	@Override
	public boolean recoveryCheck(memberDto dto) {
		int result = sqlSession.selectOne(ns+"recoveryCheck",dto);
		return result>0?true:false;
	}

	@Override
	public List<memberDto> getSellerAccessList() {
		return sqlSession.selectList(ns+"sellerAccessList");
	}
	
	
}
