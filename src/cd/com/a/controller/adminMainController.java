package cd.com.a.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class adminMainController {

	@GetMapping(value="main.do")
	public String main() {
		System.out.println("/admin/main.do  도착!!!");
		return "admin/main/admin_main";
	}
	
	
}
