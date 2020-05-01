package cd.com.a.login;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cd.com.a.model.memberDto;
import cd.com.a.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService memberService;
	
	// 로그인 
	@RequestMapping(value="/login.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(memberDto dto,HttpServletRequest req, Model model) {
		memberDto login = memberService.login(dto);
		// 입력한 id,pwd 존재 유무
		if(login != null && login.getId().equals("") == false ) {
			//탈퇴 회원 일시 
			if(login.getAuth() ==0) {
				model.addAttribute("login", "secession");
				req.getSession().setAttribute("recoverId", login.getId());
			// 유지 고객
			}else {
				req.getSession().removeAttribute("recoverId");
				req.getSession().setAttribute("loginUser", login);
				req.getSession().setMaxInactiveInterval(60*60*365);
				model.addAttribute("login", "success");
				model.addAttribute("memberDetail",memberService.loginId(login.getMem_seq()));
			}
		// 존재 하지 않을시 
		}else {
			model.addAttribute("login", "fail");
		}
		return "/member/alertPage";
	}
	
	// 로그아웃 
	@RequestMapping(value="/logout.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest req, Model model) {
		req.getSession().removeAttribute("loginUser");
		model.addAttribute("msg","로그아웃되었습니다.");
		return "/member/alertPage";
	}
	
	// 카카오 로그인
	@RequestMapping(value="/kakaoLogin.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code,HttpServletRequest req,Model model) {
		System.out.println("code = " + code);
		String loginApi = "kakao";
		String access_Token = memberService.getAccessToken(code,loginApi);
		System.out.println("accessToken = "+ access_Token);
		
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token,loginApi);
		System.out.println("userInfo = "+userInfo);
		if(userInfo.get("id")!=null) {
			memberDto login = new memberDto();
			login.setId((String)userInfo.get("id"));
			login.setUser_api(1);
			boolean idcheck = memberService.idCheck(login);
					
			//DB에 id 존재시
			if(idcheck) {
				memberDto snsDto = new memberDto();
				snsDto.setId((String)userInfo.get("id"));
				snsDto.setUser_api(1);
				login = memberService.snsLogin(snsDto);
			//DB에 id가 존재 하지 않을경우
			}else {
				memberDto snsDto = new memberDto();
				snsDto.setId((String)userInfo.get("id"));
				snsDto.setNick_name((String)userInfo.get("nick_name"));
				snsDto.setUser_api(1);
				if(userInfo.get("birthday")!=null) {
					snsDto.setBirthday((String)userInfo.get("birthday"));
				}
				System.out.println("snsDto="+snsDto.toString());
				boolean result = memberService.newRegi(snsDto);
				if(result) {
					login = memberService.snsLogin(snsDto);
				}
			}
			/* req.getSession().setAttribute("loginUser", login); */
			req.getSession().setAttribute("loginUser", memberService.loginId(login.getMem_seq()));
			req.getSession().setMaxInactiveInterval(60*60*365);
			model.addAttribute("login", "success");
			model.addAttribute("memberDetail",memberService.loginId(login.getMem_seq()));
			return "/member/alertPage";
		}else {
			model.addAttribute("login", "fail");
			return "/member/alertPage";
		}
	}
	//네이버 로그인
	@RequestMapping(value="/naverLogin.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String naverLogin(@RequestParam("code") String code,HttpServletRequest req,Model model) {
		System.out.println("naver Code="+code);
		String loginApi="naver";
		String access_Token = memberService.getAccessToken(code,loginApi);
		System.out.println("accessToken = "+ access_Token);
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token,loginApi);
		System.out.println("userInfo = "+userInfo);
		if(userInfo.get("id")!=null) {
			memberDto login = new memberDto();
			login.setId((String)userInfo.get("id"));
			login.setUser_api(2);
			boolean idcheck = memberService.idCheck(login);
			//DB에 id 존재시
			if(idcheck) {
				memberDto snsDto = new memberDto();
				snsDto.setId((String)userInfo.get("id"));
				snsDto.setUser_api(2);
				login = memberService.snsLogin(snsDto);
			//DB에 id가 존재 하지 않을경우
			}else {
				memberDto snsDto = new memberDto();
				snsDto.setId((String)userInfo.get("id"));
				snsDto.setNick_name((String)userInfo.get("nick_name"));
				snsDto.setUser_name((String)userInfo.get("name"));
				
				if(userInfo.get("birthday")!=null) {
					snsDto.setBirthday((String)userInfo.get("birthday"));
				}
				snsDto.setUser_api(2);
				System.out.println("snsDto="+snsDto.toString());
				boolean result = memberService.newRegi(snsDto);
				if(result) {
					login = memberService.snsLogin(snsDto);
				}
			}
			/* req.getSession().setAttribute("loginUser", login); */
			req.getSession().setAttribute("loginUser", memberService.loginId(login.getMem_seq()));
			req.getSession().setMaxInactiveInterval(60*60*365);
			model.addAttribute("login", "success");
			model.addAttribute("memberDetail",memberService.loginId(login.getMem_seq()));
			return "/member/alertPage";
		}else {
			model.addAttribute("login", "fail");
			return "/member/alertPage";
		}
	}
	// 구글 로그인
	@RequestMapping(value="/googleLogin.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String googleLogin(@RequestParam("code") String code,HttpServletRequest req,Model model) {
		System.out.println("google Code="+code);
		String loginApi="google";
		String access_Token = memberService.getAccessToken(code,loginApi);
		System.out.println("accessToken = "+ access_Token);
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token,loginApi);
		System.out.println("userInfo = "+userInfo);
		if(userInfo.get("id")!=null) {
			memberDto login = new memberDto();
			login.setId((String)userInfo.get("id"));
			login.setUser_api(3);
			boolean idcheck = memberService.idCheck(login);
			//DB에 id 존재시
			if(idcheck) {
				memberDto snsDto = new memberDto();
				snsDto.setId((String)userInfo.get("id"));
				snsDto.setUser_api(3);
				login = memberService.snsLogin(snsDto);
			//DB에 id가 존재 하지 않을경우
			}else {
				memberDto snsDto = new memberDto();
				snsDto.setId((String)userInfo.get("id"));
				snsDto.setUser_api(3);
				
				System.out.println("snsDto="+snsDto.toString());
				boolean result = memberService.newRegi(snsDto);
				if(result) {
					login = memberService.snsLogin(snsDto);
				}
			}
			/* req.getSession().setAttribute("loginUser", login); */
			req.getSession().setAttribute("loginUser", memberService.loginId(login.getMem_seq()));
			req.getSession().setMaxInactiveInterval(60*60*365);
			model.addAttribute("login", "success");
			model.addAttribute("memberDetail",memberService.loginId(login.getMem_seq()));
			return "/member/alertPage";
		}else {
			model.addAttribute("login", "fail");
			return "/member/alertPage";
		}
	}
}
