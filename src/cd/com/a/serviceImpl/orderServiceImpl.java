package cd.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.dao.orderDao;
import cd.com.a.model.memberDto;
import cd.com.a.model.orderDetailParam;
import cd.com.a.model.productSaleDto;
import cd.com.a.model.saleingOptionParam;
import cd.com.a.service.orderService;

@Service
public class orderServiceImpl implements orderService {

	@Autowired
	orderDao orderdao;

	@Override
	public memberDto getDefultAddress(int mem_seq) {
		return orderdao.getDefultAddress(mem_seq);
	}

	@Override
	public boolean crete_productOrder(productSaleDto saleList) {
		return orderdao.crete_productOrder(saleList);
	}

	@Override
	public void create_SaleGroup(int mem_seq) {
		orderdao.create_SaleGroup(mem_seq);
	}

	@Override
	public int getSaleGroup(int mem_seq) {
		return orderdao.getSaleGroup(mem_seq);
	}

	@Override
	public boolean kakaoUpdate(productSaleDto saleDto) {
		return orderdao.kakaoUpdate(saleDto);
	}

	@Override
	public productSaleDto getNowSaleing(int mem_seq) {
		return orderdao.getNowSaleing(mem_seq);
	}

	@Override
	public boolean FailOrder(int saleing_group) {
		
		return orderdao.FailOrder(saleing_group);
	}

	@Override
	public List<productSaleDto> getNowSaleingList(int saleing_group) {
		
		return orderdao.getNowSaleingList(saleing_group);
	}

	@Override
	public List<Integer> myOrderList_group(int mem_seq) {
		
		return orderdao.myOrderList_group(mem_seq);
	}

	@Override
	public List<orderDetailParam> myOrderDetail(int saleing_group) {
	
		return orderdao.myOrderDetail(saleing_group);
	}

	@Override
	public boolean orderOptionProcess(saleingOptionParam param) {
		
		return orderdao.orderOptionProcess(param);
	}
	
	
	
}
