package cd.com.a.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderDao; 
	
}
