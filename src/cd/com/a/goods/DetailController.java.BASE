package cd.com.a.goods;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		model.addAttribute("prddetail", produc);
		
		System.out.println("num" + produc.toString());
		
		
		
		
		
		return "/goodsShop/product_detail";
	}
	
}
