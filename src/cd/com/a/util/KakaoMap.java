package cd.com.a.util;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cd.com.a.model.memberDto;
import cd.com.a.service.MemberService;

@Controller
public class KakaoMap {
	@Autowired
	MemberService memberService;
	@RequestMapping(value="/searchHospital.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String searchHospital(HttpServletRequest req,Model model) {
		memberDto member = (memberDto)req.getSession().getAttribute("loginUser");
		if(member != null) {
			memberDto memberDetail = memberService.loginId(member.getMem_seq());
			model.addAttribute("memberDetail",memberDetail);
		}
		return "/mypage/hospitalMap";
	}
}
