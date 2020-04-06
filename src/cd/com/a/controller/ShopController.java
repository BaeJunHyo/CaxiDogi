package cd.com.a.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cd.com.a.model.memberDto;

@Controller
public class ShopController {
	@RequestMapping(value="shopRegi.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopRegi(HttpSession session) {
		
		//memberDto mem = new memberDto("test@naver.com");
		//session.setAttribute("login", mem);
		//session.setMaxInactiveInterval(60*60*365);
		
		return "/shop/regi_shop";
	}
}
