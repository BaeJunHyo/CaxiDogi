package cd.com.a.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cd.com.a.bo.ProductService;
import cd.com.a.model.ProductParam;
import cd.com.a.model.poolDto;
import cd.com.a.model.productDto;
import cd.com.a.model.shopDto;
import cd.com.a.service.PoolService;
import cd.com.a.service.ShopService;

@Controller
public class mainController {
	@Autowired
	PoolService poolService;
	@Autowired
	ShopService shopService;
	@Autowired
	ProductService prdService;
	
	@RequestMapping(value="main.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String main(Model model, ProductParam prdparam) {
		List<poolDto> poolList = new ArrayList<poolDto>();
		poolList.add(poolService.getPoolDetail(14));
		poolList.add(poolService.getPoolDetail(19));
		poolList.add(poolService.getPoolDetail(8));
		poolList.add(poolService.getPoolDetail(17));
		
		List<shopDto> shopList = new ArrayList<shopDto>();
		shopList.add(shopService.getShopDetail(18));
		shopList.add(shopService.getShopDetail(21));
		shopList.add(shopService.getShopDetail(17));
		shopList.add(shopService.getShopDetail(15));
		
		List<productDto> prdlist = prdService.prdSearchList(prdparam);
		model.addAttribute("prdlist", prdlist);
		model.addAttribute("poolList", poolList);
		model.addAttribute("shopList", shopList);
		
		return "/main/main";
	}
}
