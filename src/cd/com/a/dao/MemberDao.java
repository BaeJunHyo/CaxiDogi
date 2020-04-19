package cd.com.a.dao;

import cd.com.a.model.memberDto;

public interface MemberDao {

	boolean idCheck(memberDto dto);

	boolean nickCheck(String nick_name);
	
	boolean newRegi(memberDto dto);
	
	memberDto login(memberDto dto);
	
	String findId(memberDto dto);
	
	String findPwd(memberDto dto);
	
	memberDto snsLogin(memberDto dto);

	boolean snsFirstUpdate(memberDto dto);

	memberDto loginId(int mem_seq);

	boolean pwdCheck(memberDto dto);
	
	public memberDto resvMem(int mem_seq);

}
