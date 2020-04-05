package cd.com.a.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String memberInsert(memberDto memberDto, Model model) {
		System.out.println("member="+memberDto.toString());
		
		
		return null;
	}
	
	

}
