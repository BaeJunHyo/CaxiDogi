package cd.com.a.service;

import java.util.List;

import cd.com.a.model.memberDto;
import cd.com.a.model.productSaleDto;

public interface orderService {

	public memberDto getDefultAddress(int mem_seq);
	public boolean crete_productOrder(productSaleDto saleList);
	public void create_SaleGroup(int mem_seq);
	public int getSaleGroup(int mem_seq);
	public boolean kakaoUpdate(productSaleDto saleDto);
	public productSaleDto getNowSaleing(int mem_seq);
}
