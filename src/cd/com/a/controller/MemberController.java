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
	public String newAccount() {
		return "/member/newAccount";
	}
	
	@RequestMapping(value = "/loginView.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String loginView(HttpServletRequest req, Model model) {
		String recovery = (String)req.getParameter("recovery");
		String recoverId = (String)req.getSession().getAttribute("recoverId");
		if(recovery != null) {
			model.addAttribute("recoverId",recoverId);
			model.addAttribute("recovery",recovery);
		}
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
	@RequestMapping(value = "/recoveryId.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String recoveryId() {
		return "/member/recoveryId";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public boolean idCheck(@RequestParam("idcheck")String id) {
		memberDto dto = new memberDto();
		dto.setId(id);
		dto.setUser_api(0);
		boolean result = memberService.idCheck(dto);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/nickCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public boolean nickCheck(@RequestParam("nickcheck")String nick_name) {
		boolean result = memberService.nickCheck(nick_name);
		return result;
	}
	
	@RequestMapping(value="/memberInsert.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberInsert(memberDto dto, Model model) {
		dto.setUser_api(0);
		boolean result = memberService.newRegi(dto);
		
		if(result) {
			model.addAttribute("regi","true");
			return "/member/alertPage";
		}
		/* return "redirect:/main.do"; */
		return "/member/alertPage";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/findIdAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findIdAf(memberDto dto) {
		String id = memberService.findId(dto);
		return id;
	}
	
	@ResponseBody
	@RequestMapping(value="/findPwdAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findPwdAf(memberDto dto) {
		String pwd = memberService.findPwd(dto);
		return pwd;
	}
	
	@ResponseBody
	@RequestMapping(value = "/recoveryIdAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String recoveryIdAf(memberDto dto) {
		System.out.println("여기"+dto.toString());
		memberDto detail = memberService.login(dto);
		//틀린정보
		if(detail == null) {
			return "fail";
		//계정 존재
		}else {
			boolean result = memberService.recoveryId(dto);
			if(result) {
				return "success";
			//기존계정
			}else {
				return "fail";
			}
			
		}
	}
	
	@RequestMapping(value="/myPage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myPage() {
		return "/mypage/mypage_main";
	}
	@RequestMapping(value="/snsFirstLogin.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String snsFirstLogin(HttpServletRequest req,Model model) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		model.addAttribute("memberDetail",memberService.loginId(loginUser.getMem_seq()));
		return "/mypage/snsMemberDetail";
	}
	
	@RequestMapping(value="/memberDetail.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberDetail(HttpServletRequest req, Model model) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		model.addAttribute("memberDetail",memberService.loginId(loginUser.getMem_seq()));
		if(loginUser.getUser_api()==0) {
			return "/mypage/memberDetail";
		}else {
			return "/mypage/snsMemberDetail";
		}
	}
	
	@RequestMapping(value="/snsFirstUpdate.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String snsFirstUpdate(memberDto dto, Model model, HttpServletRequest req) {
		if(memberService.snsFirstUpdate(dto)) {
			memberDto login = memberService.login(dto);
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
				memberDto memberDetail = memberService.loginId(loginUser.getMem_seq());
				if(memberDetail.getUser_name()==null || 
						memberDetail.getNick_name()==null ||
						memberDetail.getAddress()==null ||
						memberDetail.getPhone()==null ||
						memberDetail.getBirthday()==null){
						//model.addAttribute("info","false");
						model.addAttribute("memberDetail",memberDetail);
					return "/mypage/snsMemberDetail";
				}else {
					return "redirect:myPage.do";
				}
			}
		}
		return "redirect:myPage.do";
	}
	@RequestMapping(value="/memberUpdateMove.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberUpdate(HttpServletRequest req,Model model) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		if(loginUser.getUser_api()==0) {
			model.addAttribute("memberDetail",memberService.loginId(loginUser.getMem_seq()));
			return "/mypage/memberUpdate";
		}else {
			model.addAttribute("memberDetail",memberService.loginId(loginUser.getMem_seq()));
			return "/mypage/snsMemberUpdate";
		}
	}
	@ResponseBody
	@RequestMapping(value="/pwdCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String passwordCheck(memberDto dto) {
		boolean result = memberService.pwdCheck(dto);
		if(result) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/sellerAccess.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String sellerAccess(@RequestParam("mem_seq")int mem_seq,HttpServletRequest req) {
		boolean result = memberService.sellerAccess(mem_seq);
		if(result) {
			req.getSession().removeAttribute("loginUser");
			memberDto login = memberService.loginId(mem_seq);
			req.getSession().setAttribute("loginUser", login);
			req.getSession().setMaxInactiveInterval(60*60*365);
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@RequestMapping(value="/memberEscape.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberEscape(HttpServletRequest req, Model model) {
		int mem_seq = ((memberDto)req.getSession().getAttribute("loginUser")).getMem_seq();
		memberService.memberEscape(mem_seq);
		req.getSession().removeAttribute("loginUser");
		model.addAttribute("msg","탈퇴처리 되었습니다.");
		return "/member/alertPage";
	}
	
	@RequestMapping(value="/userUpdate.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String userUpdate(memberDto dto,HttpServletRequest req, Model model) {
		boolean result = memberService.userUpdate(dto);
		memberDto login = null;
		if(result) {
			if(dto.getUser_api()==0) {
				login = memberService.login(dto);
			}else {
				login = memberService.snsLogin(dto);
			}
				
			req.getSession().removeAttribute("loginUser");
			req.getSession().setAttribute("loginUser", login);
			req.getSession().setMaxInactiveInterval(60*60*365);
			model.addAttribute("update","true");
			model.addAttribute("memberDetail",memberService.loginId(dto.getMem_seq()));
			return "/member/alertPage";
		}else {
			model.addAttribute("update","false");
			model.addAttribute("memberDetail",memberService.loginId(dto.getMem_seq()));
			return "/member/alertPage";
		}
	}
	
	
   @RequestMapping(value="/sellerMyPage.do", method= {RequestMethod.GET,RequestMethod.POST})
   public String sellerMyPage() {
      return "/mypage/mypage_seller";
   }
	
	
	
	
}
