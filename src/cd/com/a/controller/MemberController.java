package cd.com.a.controller;


import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cd.com.a.model.memberDto;
import cd.com.a.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value = "/newAccount.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String newAccount(HttpServletRequest req) {
		
		return "/member/newAccount";
	}
	
	@RequestMapping(value = "/loginView.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String loginView() {
		return "/member/loginView";
	}
	
	@RequestMapping(value="/findId.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findId() {
		return "/member/findId";
	}
	@RequestMapping(value="/findPwd.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findPwd() {
		return "/member/findPwd";
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public boolean idCheck(@RequestParam("idcheck")String id) {
		System.out.println("idcheck="+id);
		memberDto dto = new memberDto();
		dto.setId(id);
		dto.setUser_api(0);
		boolean result = memberService.idCheck(dto);
		System.out.println("result="+result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/nickCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public boolean nickCheck(@RequestParam("nickcheck")String nick_name) {
		System.out.println("nickcheck="+nick_name);
		boolean result = memberService.nickCheck(nick_name);
		System.out.println("result="+result);
		return result;
	}
	
	@RequestMapping(value="/memberInsert.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberInsert(memberDto dto, Model model) {
		System.out.println("member="+dto.toString());
		dto.setUser_api(0);
		boolean result = memberService.newRegi(dto);
		
		if(result) {
			System.out.println("MemberInsert result = " +result);
			model.addAttribute("regi","true");
			return "/member/alertPage";
		}
		/* return "redirect:/main.do"; */
		return "/member/alertPage";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/findIdAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findIdAf(memberDto dto) {
		System.out.println("findID="+dto);
		String id = memberService.findId(dto);
		System.out.println("id=========//"+id);
		return id;
	}
	
	@ResponseBody
	@RequestMapping(value="/findPwdAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findPwdAf(memberDto dto) {
		System.out.println("findPwd="+dto);
		String pwd = memberService.findPwd(dto);
		System.out.println("pw=========//"+pwd);
		return pwd;
	}
	
	@RequestMapping(value="/myPage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myPage() {
		return "/mypage/mypage_main";
	}
	@RequestMapping(value="/snsFirstLogin.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String snsFirstLogin() {
		return "/mypage/snsMemberDetail";
	}
	
	@RequestMapping(value="/memberDetail.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberDetail(HttpServletRequest req) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		if(loginUser.getUser_api()==0) {
			return "/mypage/memberDetail";
		}else {
			return "/mypage/snsMemberDetail";
		}
	}
	
	@RequestMapping(value="/snsFirstUpdate.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String snsFirstUpdate(memberDto dto, Model model, HttpServletRequest req) {
		System.out.println("dto = " + dto.toString());
		
		if(memberService.snsFirstUpdate(dto)) {
			memberDto login = memberService.loginId(dto.getMem_seq());
			req.getSession().removeAttribute("loginUser");
			req.getSession().setAttribute("loginUser", login);
			req.getSession().setMaxInactiveInterval(60*60*365);
			model.addAttribute("update","true");
			return "/member/alertPage";
		}else {
			model.addAttribute("update","false");
			return "/member/alertPage";
		}
		
	}
	
	@RequestMapping(value="/myPageMove.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myPageMove(HttpServletRequest req, Model model) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		if(loginUser != null) {
			if(loginUser.getUser_api() == 0){
				return "redirect:myPage.do";
				// sns 마이페이지 회원정보이동
			}else{
				if(loginUser.getUser_name()==null || 
						loginUser.getNick_name()==null ||
						loginUser.getAddress()==null ||
						loginUser.getPhone()==null ||
						loginUser.getBirthday()==null){
						model.addAttribute("info","false");
					return "/mypage/snsMemberDetail";
				}
			}
		}
		return "redirect:myPage.do";
	}
	@RequestMapping(value="/memberUpdateMove.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberUpdate(HttpServletRequest req) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		if(loginUser.getUser_api()==0) {
			return "/mypage/memberUpdate";
		}else {
			return "/mypage/snsMemberUpdate";
		}
	}
	@ResponseBody
	@RequestMapping(value="/pwdCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String passwordCheck(memberDto dto) {
		System.out.println("dto="+dto.toString());
		boolean result = memberService.pwdCheck(dto);
		if(result) {
			return "true";
		}else {
			return "false";
		}
	}
	
	
	
	
}
