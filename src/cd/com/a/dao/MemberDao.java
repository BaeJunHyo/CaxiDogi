package cd.com.a.dao;

import java.util.List;

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

	boolean userUpdate(memberDto dto);
	
	boolean snsUserUpdate(memberDto dto);

	boolean sellerAccess(int mem_seq);

	void memberEscape(int mem_seq);

	void recoveryId(int mem_seq);

	int findSeq(memberDto dto);

	boolean recoveryCheck(memberDto dto);
	
	List<memberDto> getSellerAccessList();

	boolean sellerAccessPass(int[] mem_seq);

	boolean sellerAccessFail(int[] mem_seq);

}
