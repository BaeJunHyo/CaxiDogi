package cd.com.a.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cd.com.a.goods.DetailService;
import cd.com.a.model.basketDto;
import cd.com.a.model.memberDto;
import cd.com.a.model.productDto;
import cd.com.a.service.basketService;

@Controller
public class basketController {

	@Autowired
	basketService service;
	@Autowired
	DetailService detailService;
	
	
	@RequestMapping(value="orderBasket.do", method=RequestMethod.GET)
	public String orderBasket(Model model, HttpSession session) {
		
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		
		List<basketDto> list = service.getMyBasketList(mem.getMem_seq());

		
		System.out.println("================== 가져온 장바구니 리스트  ==================");
		for(basketDto dto : list) {
			System.out.println(dto.toString());
			productDto produc = detailService.getPrd(dto.getProduct_num());
			
		}
		
		model.addAttribute("basketList", list);
		
		return "basket/order_basket";
	}
	
	@PostMapping(value="createBasket.do")
	@ResponseBody
	public String createBasket(basketDto dto) {
		System.out.println("basketController   createBasket()");
		
		System.out.println(dto.toString());
		
		boolean is = service.createBasket(dto);
		
		if(is) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value="deleteBasket.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteBasket(int basket_num) {
		
		System.out.println("basketController  deleteBasket()");
		System.out.println("basket_num ==== " + basket_num);
		boolean is = service.deleteMyBasket(basket_num);
		
		return String.valueOf(is);
	}
	
}
