package cd.com.a.dao;

import java.util.List;

import cd.com.a.model.memberDto;
import cd.com.a.model.orderDetailParam;
import cd.com.a.model.productSaleDto;
import cd.com.a.model.saleingOptionParam;

public interface orderDao {

	public memberDto getDefultAddress(int mem_seq);
	public boolean crete_productOrder(productSaleDto saleList);
	public void create_SaleGroup(int mem_seq);
	public int getSaleGroup(int mem_seq);
	public boolean kakaoUpdate(productSaleDto saleDto);
	public productSaleDto getNowSaleing(int mem_seq);
	public List<productSaleDto> getNowSaleingList(int saleing_group);
	public boolean FailOrder(int saleing_group);
	public List<Integer>myOrderList_group(int mem_seq);
	public List<orderDetailParam>myOrderDetail(int saleing_group);
	
	public boolean orderOptionProcess(saleingOptionParam param);
	
}
