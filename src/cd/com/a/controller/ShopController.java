package cd.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cd.com.a.model.memberDto;
import cd.com.a.model.shopDto;

@Controller
public class ShopController {
	@RequestMapping(value="shopRegi.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopRegi(HttpSession session) {
		
		memberDto mem = new memberDto("test@naver.com");
		session.setAttribute("login", mem);
		session.setMaxInactiveInterval(60*60*365);
		
		return "/shop/regi_shop";
	}
	@ResponseBody
	@RequestMapping(value = "shopRegiAf.do", method = RequestMethod.POST)
	public String shopRegiAf(shopDto shop, @RequestParam(value ="fileload", required = false)MultipartFile fileload,
							HttpServletRequest req) {
		System.out.println("오나");
		//String fname = fileload.getOriginalFilename();
		//System.out.println(fname);
		String filename =  (new Date().getTime()) + "";
		shop.setShop_photo(filename);
		System.out.println(shop.toString());
		String fileUpload = req.getServletContext().getRealPath("/WEB-INF/views/shop/shopImage"); 
		System.out.println(fileUpload);
		
		return "s";
	}
	
}
