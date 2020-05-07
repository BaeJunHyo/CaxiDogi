package cd.com.a.goods;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cd.com.a.model.order_PrdParam;
import cd.com.a.model.order_PrdParamList;
import cd.com.a.model.productDto;

@Controller
public class DetailController {

	@Autowired
	DetailService detailService;
	SqlSession sqlSession;
	
	@RequestMapping(value="prdList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String prdList(Model model) {
		List<productDto> prdlist = detailService.getPrdList();
		
		/*
		for(int i=0; i<prdlist.size(); i++) {
			productDto dto = prdlist.get(i);
			System.out.println("====dto.img" + dto.getProduct_img());
			
		}/**/
		model.addAttribute("prdlist", prdlist);
		
		
		return "/goodsShop/productList";
	}
	
	
	@RequestMapping(value="productDetail.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String getPrd(int product_num, Model model) {
		System.out.println("DetailController  productDetail()");
		
		
		System.out.println("prd_num="+product_num);
		productDto produc = detailService.getPrd(product_num);
		
		//클릭한 제품의 readcount를 증가시키는 작업
		detailService.readcountPlus(product_num);
		
		/*
		//옵션 상품(이름이 비슷한)를 가져올 list 생성 
		List<productDto> list = new ArrayList<productDto>();
		String product_name = produc.getProduct_name();
		
		//option제품의 조건을 뽑는 과정 
		if(product_name.split("/").length > 0 ) {
			product_name = product_name.split("/")[0];
			System.out.println("[ split product name ] ==  " + product_name);
		}
		
		list = detailService.getOptionProduct(product_name);
		/**/
		
		
		
		model.addAttribute("prddetail", produc);
		
		/*
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}*/
		//System.out.println("num" + produc.toString());
		
		//model.addAttribute("OptionProduct", list);
		model.addAttribute("prddetail", produc);
		
		//System.out.println("num" + produc.toString());
		
		return "goodsShop/product_detail";
	}
	
	
	@PostMapping(value="productOrder.do")
	public String productOrder(HttpServletRequest request, Model model, @ModelAttribute order_PrdParamList orderList) {
		System.out.println("DetailController   productOrder()");
		//넘어온 파라미터 확인 
		if(orderList.getOrderList() == null) {
			System.out.println("param == NULL");
		}else {
			System.out.println("param == NOT NULL");
			for(int i = 0; i < orderList.getOrderList().size(); i++) {
				System.out.println(orderList.getOrderList().get(i).toString());
			}
		}
		
		List<productDto> list = new ArrayList<productDto>();
		
		for(int i = 0; i < orderList.getOrderList().size(); i++) {
			productDto dto = detailService.getPrd(orderList.getOrderList().get(i).getProduct_num());
			System.out.println(dto.toString());
			list.add(dto);
		}
		
		model.addAttribute("PrdParamList", orderList);
		model.addAttribute("prd_list", list);
		
		return "goodsShop/product_order";
	}
	
	
	@RequestMapping(value="option_prdList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String option_prdList(Model model, @RequestParam(value="option") String option) {
		System.out.println("DetailController option_prdList()");
		//System.out.println(option);
		
		List<productDto> prdList = detailService.getOption_productList(option);
		model.addAttribute("prdlist", prdList);
		model.addAttribute("sortSend", option);
		return "/goodsShop/productList";
	}
	
	
	
}
