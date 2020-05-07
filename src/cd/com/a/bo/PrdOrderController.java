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
		
<<<<<<< HEAD
		return "/bo/order/bo_01order_1";
=======
		
		
		return "admin/order/orderList";
>>>>>>> 0e27802216b905eb83c2c75bf38c7e50f2632904
	}
}
