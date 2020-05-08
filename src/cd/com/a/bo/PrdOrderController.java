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

	@RequestMapping(value="adminOrderList.do", method=RequestMethod.GET)
	public String adminOrderList(Model model){
		
		return "/bo/order/bo_01order_1";

	}
}
