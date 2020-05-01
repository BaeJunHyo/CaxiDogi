package cd.com.a.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.basketDao;
import cd.com.a.model.basketDto;


public interface basketService {

	public boolean createBasket(basketDto dto);
}
