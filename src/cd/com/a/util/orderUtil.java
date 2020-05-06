package cd.com.a.util;

import java.util.List;

import cd.com.a.goods.DetailService;
import cd.com.a.goods.DetailServiceImpl;
import cd.com.a.model.productDto;
import cd.com.a.model.productSaleDto;
import cd.com.a.service.orderService;
import cd.com.a.serviceImpl.orderServiceImpl;

public class orderUtil {

	public static String getMemberAuth(int mem_auth) {
		String[] strAuth = {"탈퇴회원","일반회원","일반회원","업체회원","관리자","관리자"};
		
		return strAuth[mem_auth];
	}
	
	
}
