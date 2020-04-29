package cd.com.a.bo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PrdOrderController {
	
	@Autowired
	PrdOrderService orderService;
	SqlSession sqlSession;
	
	@RequestMapping(value="orderList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String orderlist(Model model) {
		
		return "/bo/order/bo_01order_1.jsp";
	}
}
