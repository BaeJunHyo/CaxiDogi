package cd.com.a.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
