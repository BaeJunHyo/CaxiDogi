package cd.com.a.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mainController {

	@RequestMapping(value="main.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String main() {
		
		return "/main/main";
	}
}
