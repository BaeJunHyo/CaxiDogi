package cd.com.a.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cd.com.a.service.basketService;

@Controller
public class basketController {

	@Autowired
	basketService service;
	
	
}
