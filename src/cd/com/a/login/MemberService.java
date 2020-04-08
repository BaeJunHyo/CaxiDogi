package cd.com.a.login;

import cd.com.a.model.memberDto;

public interface MemberService {

	boolean idCheck(String id);

	boolean nickCheck(String nick_name);
	
	boolean newRegi(memberDto dto);
	
	memberDto login(memberDto dto);
	
	String findId(memberDto dto);
	
	String findPwd(memberDto dto);

}
