package cd.com.a.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cd.com.a.model.productSaleDto;

@Controller
public class myBuyController {

	@RequestMapping(value="myBuyMain.do", method=RequestMethod.GET)
	public String myBuyMain() {
		
		List<productSaleDto> list = service.getMyBuyList();
		
		String seq = "";
		
		int group = -1;
		
		int count = 0;
		
		for(int i = 0; i < list.size(); i++) {
			
			if(i == 0) {
				//그룹번호 세팅
				group = list.get(i).getSaleing_group();
				//제품번호 세팅 
				seq += list.get(i).getProduct_num();
				//갯수 세팅 
				count++;
				
			}else if(i > 0) {
				
				if(group == list.get(i).getSaleing_group()) {
					seq += "&" + list.get(i).getSaleing_num(); //1&2
				}else {
					//다시 그룹번호 세팅
					group = list.get(i).getSaleing_group();
					
					//myBuyDto 생성 
					myBuyDto dto = new myBuyDto(seq, list.get(i-1).get)
					
				}
			}
			
			
		}
		
		return "";
	}
	
}
