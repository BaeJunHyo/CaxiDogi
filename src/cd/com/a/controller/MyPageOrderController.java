package cd.com.a.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cd.com.a.service.MemberService;
import cd.com.a.service.MyPageOrderService;

@Controller
public class MyPageOrderController {
	
	@Autowired
	MyPageOrderService myOrderService;
	
	@Autowired
	MemberService memService;
	
	@RequestMapping(value="getMyOrderList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myorderlist(Model model) {
		
		return "";
	}
}
