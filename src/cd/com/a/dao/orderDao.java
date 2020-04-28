package cd.com.a.dao;

import cd.com.a.model.memberDto;
import cd.com.a.model.productSaleDto;

public interface orderDao {

	public memberDto getDefultAddress(int mem_seq);
	public boolean crete_productOrder(productSaleDto saleDto);
	public void create_SaleGroup(int mem_seq);
	public int getSaleGroup(int mem_seq);
}
