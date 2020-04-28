package cd.com.a.service;

import java.util.List;

import cd.com.a.model.groundResvParam;
import cd.com.a.model.poolResvParam;
import cd.com.a.model.shopShowResvParam;

public interface MyPageService {
	List<poolResvParam> getPoolResvList(int mem_seq);
	List<shopShowResvParam> getShopResvList(int mem_seq);
	List<groundResvParam> getGroundResvList(int mem_seq);

}
