package cd.com.a.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cd.com.a.model.memberDto;
import cd.com.a.service.orderService;

@Controller
public class orderController {

	@Autowired
	orderService orderservice;
	
	@RequestMapping(value="getDefultAddress.do", method=RequestMethod.POST)
	@ResponseBody
	public memberDto getDefultAddress(int mem_seq) {
		
		System.out.println("orderController getDefultAddress()");
		System.out.println("mem_seq == " + mem_seq);
		
		memberDto mem = orderservice.getDefultAddress(mem_seq);
		System.out.println(mem.toString());
		
		mem.setPhone("0222247191");
		
		return mem;
	}
	
}
