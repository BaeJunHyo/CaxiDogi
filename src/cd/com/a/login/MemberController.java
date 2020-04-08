package cd.com.a.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cd.com.a.model.memberDto;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value = "/newAccount.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String newAccount() {
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
		boolean result = memberService.idCheck(id);
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
		
		boolean result = memberService.newRegi(dto);
		
		if(result) {
			System.out.println("MemberInsert result = " +result);
			model.addAttribute("regi","true");
			return "/member/alertPage";
		}
		/* return "redirect:/main.do"; */
		return "/member/alertPage";
		
	}
	
	@RequestMapping(value="/login.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(memberDto dto,HttpServletRequest req, Model model) {
		System.out.println("login="+dto.toString());
		
		memberDto login = memberService.login(dto);
		// 입력한 id,pwd 존재 유무
		if(login != null && login.getId().equals("") == false ) {
			
			req.getSession().setAttribute("login", login);
			req.getSession().setMaxInactiveInterval(60*60*365);
			model.addAttribute("login", "true");
			return "/member/alertPage";
		// 존재 하지 않을시 
		}else {
			model.addAttribute("login", "false");
			return "/member/alertPage";
		}
	}
	
	@RequestMapping(value="/logout.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest req, Model model) {
		System.out.println("로그아웃페이지");
		req.getSession().removeAttribute("login");
		model.addAttribute("msg","로그아웃되었습니다.");
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
	
	

}
