package cd.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cd.com.a.model.companyDto;
import cd.com.a.model.memberDto;
import cd.com.a.service.CompanyService;

@Controller
public class CompanyController {
	@Autowired
	CompanyService companyService;

	@RequestMapping(value="companyRegi.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String companyRegi(HttpSession session) {
		
		//memberDto mem = new memberDto("test@naver.com");
		//session.setAttribute("login", mem);
		session.setMaxInactiveInterval(60*60*365);
		
		return "/company/regi_company";
	}
	
	@ResponseBody
	@RequestMapping(value = "companyRegiAf.do", method = RequestMethod.POST, produces = "application/String; charset=utf-8")
	public String companyRegiAf(companyDto company) {
		//logger.info("MemberController regiAf.do" + new Date());
		company.setCompany_key(new Date().getTime()+"");
		int status = companyService.addCompany(company);

		String str = "";
		if (status == 1) {
			str = "ok";
		} else {
			str = "no";
		}
		return str;
	}
}
