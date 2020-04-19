package cd.com.a.service;

import java.util.HashMap;

import cd.com.a.model.memberDto;

public interface MemberService {
	// 자체 회원
	boolean idCheck(memberDto dto);
	boolean nickCheck(String nick_name);
	boolean newRegi(memberDto dto);
	memberDto login(memberDto dto);
	String findId(memberDto dto);
	String findPwd(memberDto dto);
	memberDto snsLogin(memberDto dto);
	memberDto loginId(int seq);
	boolean pwdCheck(memberDto dto);
	public memberDto resvMem(int mem_seq);
	
	//SNS Login
	public String getAccessToken(String authorize_code,String loginApi);
	public HashMap<String, Object> getUserInfo (String access_Token,String loginApi);
	
	boolean snsFirstUpdate(memberDto dto);
	
	
	

}
