package cd.com.a.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.model.memberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub
		return memberDao.idCheck(id);
	}
	@Override
	public boolean nickCheck(String nick_name) {
		// TODO Auto-generated method stub
		return memberDao.nickCheck(nick_name);
	}
	@Override
	public boolean newRegi(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.newRegi(dto);
	}
	@Override
	public memberDto login(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.login(dto);
	}
	@Override
	public String findId(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.findId(dto);
	}
	@Override
	public String findPwd(memberDto dto) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public memberDto resvMem(int mem_seq) {
		return memberDao.resvMem(mem_seq);
	}
	
	
}
