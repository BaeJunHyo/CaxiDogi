package cd.com.a.goods;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cd.com.a.model.productDto;

@Controller
public class DetailController {

	@Autowired
	DetailService detailService;
	SqlSession sqlSession;
	
	@RequestMapping(value="prdList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String prdList(Model model) {
		List<productDto> prdlist = detailService.getPrdList();
		for(int i=0; i<prdlist.size(); i++) {
			productDto dto = prdlist.get(i);
			System.out.println("====dto.img" + dto.getProduct_img());
			
		}
		model.addAttribute("prdlist", prdlist);
		
		
		return "/goodsShop/productList";
	}
	
	
	@RequestMapping(value="productDetail.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String getPrd(int product_num, Model model) {
		
		System.out.println("prd_num="+product_num);
		productDto produc = detailService.getPrd(product_num);
		
		//옵션 상품(이름이 비슷한)를 가져올 list 생성 
		List<productDto> list = new ArrayList<productDto>();
		String product_name = produc.getProduct_name();
		
		//option제품의 조건을 뽑는 과정 
		if(product_name.split("/").length > 0 ) {
			product_name = product_name.split("/")[0];
			System.out.println("[ split product name ] ==  " + product_name);
		}
		
		list = detailService.getOptionProduct(product_name);
		
		
		/*
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}*/
		
		model.addAttribute("OptionProduct", list);
		model.addAttribute("prddetail", produc);
		
		System.out.println("num" + produc.toString());
		
		return "goodsShop/product_detail";
	}
	
	
	@GetMapping(value="productOrder.do")
	public String productOrder(HttpServletRequest request, Model model) {
		
		return "goodsShop/product_order";
	}
	
}
