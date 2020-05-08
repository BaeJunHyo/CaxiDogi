package cd.com.a.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import cd.com.a.goods.DetailService;
import cd.com.a.goods.DetailServiceImpl;
import cd.com.a.model.KakaoCancelDto;
import cd.com.a.model.KakaoPayApproveDto;
import cd.com.a.model.KakaoPayReadyDto;
import cd.com.a.model.amountParam;
import cd.com.a.model.kakaoAmount;
import cd.com.a.model.kakaoSelectDto;
import cd.com.a.model.memberDto;
import cd.com.a.model.myBuyParam;
import cd.com.a.model.orderDetailParam;
import cd.com.a.model.order_PrdParamList;
import cd.com.a.model.productDto;
import cd.com.a.model.productSaleDto;
import cd.com.a.model.saleBasketParam;
import cd.com.a.model.saleingOptionParam;
import cd.com.a.service.basketService;
import cd.com.a.service.orderService;
import cd.com.a.util.orderUtil;

@Controller
public class orderController {

	@Autowired
	orderService orderservice;
	
	@Autowired
	DetailService detailservice;
	
	@Autowired
	basketService basketservice;
	
	private static final String HOST = "https://kapi.kakao.com";
	
	
	@RequestMapping(value = "getDefultAddress.do", method = RequestMethod.GET)
	@ResponseBody
	public memberDto getDefultAddress(int mem_seq) {

		System.out.println("orderController getDefultAddress()");
		System.out.println("mem_seq == " + mem_seq);

		memberDto mem = orderservice.getDefultAddress(mem_seq);
		System.out.println(mem.toString());

		return mem;
	}

	@RequestMapping(value = "kakaoReady.do", method = { RequestMethod.POST })
	@ResponseBody
	public String kakaoReady(HttpServletRequest request, int[] acount, int[] productSeq, productSaleDto dto,
			int totalPrice) {
		
		System.out.println("orderController  kakaoReady()");
		
		memberDto mem = (memberDto)request.getSession().getAttribute("loginUser");
		System.out.println(mem.toString());
		//System.out.println("memberSeq === " + mem.getMem_seq());
		
		for(int i = 0; i < acount.length; i++) {
			System.out.println("acount[" + i +"] 번째 == " + acount[i]);
			System.out.println("productSeq[" + i + "]번째 == " + productSeq[i]);
		} 
		
		System.out.println("totalPrice == " + totalPrice);
		// db 주문테이블 생성
		// groupNum 생성
		orderservice.create_SaleGroup(mem.getMem_seq());
		int saleing_group = orderservice.getSaleGroup(mem.getMem_seq());
		System.out.println("saleing_group === " +saleing_group);
		
		//DB로 보내줄 객체를 담을 리스트 생성 
		List<productSaleDto> saleList = new ArrayList<productSaleDto>();
		
		//productSeq 와 수량 , 배송지명/연락처/주소/배송메모 정보를 가진 객체 를 합친다 
		for(int i =0; i < acount.length; i++) {
			//객체를 생성해서 원하는 정보를 넣고 위에 생성한 리스트에 추가 한다.
			productSaleDto saleDto = new productSaleDto(mem.getMem_seq(),
														productSeq[i],
														acount[i],
														dto.getSaleing_addr(),
														dto.getSaleing_tel(),
														dto.getSaleing_name(),
														saleing_group,
														0,
														dto.getDelivery_message());
			
			boolean b = orderservice.crete_productOrder(saleDto);
			saleList.add(saleDto);
		}
		
		System.out.println("kakaoReady list size() == " + saleList.size());
		
		
		
		// 서버와 통신할 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		// 서버로 요청할 header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "cbff925dffacd0e67ba93eed0db3a9a3");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		// 서버로 요청할 Body
		// 고객이 주문한 상품에 대한 정보를 넘겨줘야한다.
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); 					//가맹점 코드 (카카오관리 점포 seq) NOT NULL
        //params.add("cid_secret", value); 					//가맹점 코드 인증키 () NULL  
        params.add("partner_order_id", ""+ saleing_group); 			//(내가 관리하는 DB주문번호) 주문번호 NOT NULL
        params.add("partner_user_id", mem.getId()); 		// (내가 관리하는 DB회원아이디) NOT NULL
        params.add("item_name", changeOrderProductName(saleList));  				//상품명  NOT NULL
        //params.add("item_code", value);  					// 상품코드  NULL
        params.add("quantity", getTotalAmount(saleList));  						//상품 수량 NOT NULL 
        params.add("total_amount", "" + totalPrice);  				//상품 총액 NOT NULL
        params.add("tax_free_amount", "0"); 				//상품 비과세 금액 NOT NULL
        //34.64.221.161:8080
        params.add("approval_url", "http://34.64.221.161:8080/CaxiDogi/kakaoPaySuccess.do"); 	//결제 성공시 넘어갈 servlet Controller 주소 
        params.add("cancel_url", "http://34.64.221.161:8080/CaxiDogi/kakaoPayCancel.do");		//결제 취소시 넘어갈 servlet Controller 주소 
        params.add("fail_url", "http://34.64.221.161:8080/CaxiDogi/kakaoPaySuccessFail.do"); 	//결제 실패시 넘어갈 servlet Controller 주소
        
		//System.out.println("2222");
		
        
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		//System.out.println("333");
		try {
			
			KakaoPayReadyDto kakaoPayDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyDto.class);
			
			//System.out.println("4444");
			System.out.println(kakaoPayDto.toString());

			// db 주문 테이블 update (tid 넣기)
			dto.setSaleing_group(saleing_group);
			dto.setKakao_cid("TC0ONETIME");
			dto.setKakao_tid(kakaoPayDto.getTid());
			orderservice.kakaoUpdate(dto);
	
			return kakaoPayDto.getNext_redirect_pc_url();
			
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "";
	}
	
	
	@RequestMapping(value="kakaoPaySuccess.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
		
		System.out.println("orderController kakaoPaySuccess()");
		System.out.println(pg_token);
		
		
		// 서버와 통신할 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		// 서버로 요청할 header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "cbff925dffacd0e67ba93eed0db3a9a3");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		
		productSaleDto saleDto = orderservice.getNowSaleing(mem.getMem_seq());
		System.out.println(saleDto.toString());
		
		
		//장바구니 삭제 처리 
		List<productSaleDto> saleList = orderservice.getNowSaleingList(saleDto.getSaleing_group());
		System.out.println("saleList size == " + saleList.size());
		
		for(productSaleDto dto : saleList) {
			basketservice.saleBasket(new saleBasketParam(dto.getMem_seq(), dto.getProduct_num()));
		}
		
		
		// 서버로 요청할 Body
		// 결제 정보를 넘겨줘야 한다
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", saleDto.getKakao_tid());
		params.add("partner_order_id", String.valueOf(saleDto.getSaleing_group()));  //가맹점 주문번호 (saleing_group)
		params.add("partner_user_id", mem.getId());   //user id
		params.add("pg_token", pg_token);
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		try {
			
			KakaoPayApproveDto kakaoPayDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApproveDto.class);

			System.out.println(kakaoPayDto.toString());
			
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		kakaoSelectDto kakaodto = selectKakao(saleDto.getKakao_tid());
		model.addAttribute("kakaoDto", kakaodto);
		
		
		return "kakao/success";
	}
	
	@RequestMapping(value="kakaoPayCancel.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String kakaoPayCancel(Model model, HttpSession session) {
		
		System.out.println("orderController kakaoPayCancel()");
		
		
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		productSaleDto saleDto = orderservice.getNowSaleing(mem.getMem_seq());
		
		//제품구매 테이블 삭제 처리 
		orderservice.FailOrder(saleDto.getSaleing_group());
		
		kakaoSelectDto kakaodto = selectKakao(saleDto.getKakao_tid());
		model.addAttribute("kakaoDto", kakaodto);
		
		
		
		return "kakao/cancel";
	}
	
	@RequestMapping(value="kakaoPaySuccessFail.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String kakaoPaySuccessFail(Model model, HttpSession session) {
		
		System.out.println("orderController kakaoPaySuccessFail()");
		
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		productSaleDto saleDto = orderservice.getNowSaleing(mem.getMem_seq());
		
		
		kakaoSelectDto kakaodto = selectKakao(saleDto.getKakao_tid());
		model.addAttribute("kakaoDto", kakaodto);
		
		return "kakao/fail";
	}
	
	
	@RequestMapping(value="MyOrderList.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Integer> MyOrderList(Model model, HttpSession session) {
		
		//db에서 그룹으로 묶어서 그룹번호만 받아온다 
		/*
		 	select saleing_group from product_saleing
			where mem_seq = #{mem_seq} 
			group by saleing_group
			order by saleing_group desc;
		 */
		
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		List<Integer> saleSeqList = orderservice.myOrderList_group(mem.getMem_seq());
		
		int fsize = 0; //for문 돌아갈 사이즈 
		if(saleSeqList.size() >= 5) {fsize = 5;}
		else {fsize = saleSeqList.size();}
		
		List<Integer> result = new ArrayList<Integer>();
		
		for(int i = 0; i < fsize; i++) {
			System.out.print("넘어온 saleing_num["+ i +"]  == ");
			System.out.println(saleSeqList.get(i));
			
			result.add(saleSeqList.get(i));
		}
		if(saleSeqList.size() == 0 || saleSeqList == null) {
			result = null;
		}
		//받아온 list.size() 만큼 for문 돌린다 
		//그다음에는 changeOrderProductName() 사용해서 이름 바꾸어 놓고 
		//saleing_num 만 String 으로 변형해서 모아준다   list[0] 에 
		
		return result;
	}
	
	@RequestMapping(value="myBuyDetail.do", method=RequestMethod.GET)
	public String myBuyDetail(Model model, @RequestParam(value = "index") String index) {
		
		System.out.println("index == " + index);
		List<orderDetailParam> detailList = orderservice.myOrderDetail(Integer.parseInt(index));
		
		model.addAttribute("detailList", detailList);
		return "mypage/myBuyDetail";
	}
	
	@RequestMapping(value="myBuyListAll.do", method=RequestMethod.GET)
	public String myBuyListAll(Model model, HttpSession session) {
		
		//최근 나의 구매 내역 
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		List<Integer> saleGroupList = orderservice.myOrderList_group(mem.getMem_seq());
		
		List<myBuyParam> myBuyList = new ArrayList<myBuyParam>(); 
		
		if(saleGroupList.size() > 0) {
			//saleGroupList 만큼 돌리면서 paramList 생성 
			for(int i = 0; i < saleGroupList.size(); i++) {
				//System.out.print("넘어온 saleing_num["+ i +"]  == ");
				//System.out.println(saleGroupList.get(i));
				
				List<productSaleDto> saleList = orderservice.getNowSaleingList(saleGroupList.get(i));
				
				String myOrderName = changeOrderProductName(saleList);
				String saleing_numStr = "" + saleList.get(0).getSaleing_num();
				int amount = saleList.get(0).getSaleing_amount();
				
				int price = detailservice.getPrd(saleList.get(0).getProduct_num()).getProduct_price() * amount;
				
				String strDate = saleList.get(0).getSaleing_date();
		
				String[] strDate2 = strDate.split("\\s");
				//System.out.println(strDate2[0]);
				//System.out.println(strDate2[1]);
				strDate = strDate2[0] + "/";
				
				strDate2[1] = strDate2[1].substring(0, 8);
				strDate += strDate2[1];
				
				//System.out.println("완성 === " + strDate);
				productDto prdDto = null;
				
				if(saleList.size() > 1) {
					for(int j = 1; j < saleList.size(); j++) {
						saleing_numStr += "/" + saleList.get(j).getSaleing_num();
						amount += saleList.get(j).getSaleing_amount();
						//가격
						prdDto = detailservice.getPrd(saleList.get(j).getProduct_num());
						price += prdDto.getProduct_price() * saleList.get(j).getSaleing_amount();
						
					}
				}else {
					prdDto = detailservice.getPrd(saleList.get(0).getProduct_num());
				}
				//System.out.println(prdDto.getProduct_img());
				myBuyList.add(new myBuyParam(saleing_numStr, myOrderName, strDate, prdDto.getProduct_img(), amount, price, saleGroupList.get(i) , saleList.get(0).getProduct_delivery_state(),Integer.parseInt(prdDto.getProduct_group()), Integer.parseInt(prdDto.getProduct_sub_group()),saleList.get(0).getSaleing_option(),saleList.get(0).getSaleing_option_state()));
				
			}
		}else {
			myBuyList = null;	
		}
		
		model.addAttribute("myBuyList", myBuyList);
		
		return "mypage/myBuyListAll";
	}
	
	
	
	@RequestMapping(value="orderCancel.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String orderCancel(Model	model, @RequestParam(value="index") int saleing_num) {
		
		System.out.println("seleing_num ===" + saleing_num);
		
		List<productSaleDto> list = orderservice.getNowSaleingList(saleing_num);
		
		kakaoSelectDto dto = selectKakao(list.get(0).getKakao_tid());
		model.addAttribute("kakaoDto", dto);
		model.addAttribute("saleing_num", saleing_num);
		
		return"kakao/order_cancel";
	}
	
	
	@RequestMapping(value="kakaoOrderCancel.do", method=RequestMethod.POST)
	@ResponseBody
	public String kakaoOrderCancel(String tid, String cancel_amount, String cancel_vat_amount, int saleing_num) {
		
		//모델로 넘겨줌 
		// 서버와 통신할 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		// 서버로 요청할 header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "cbff925dffacd0e67ba93eed0db3a9a3");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		// 서버로 요청할 Body
		// 결제 정보를 넘겨줘야 한다
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", tid );
		params.add("cancel_amount", cancel_amount); //취소금액
		params.add("cancel_tax_free_amount", "0"); //취소 비과세금액
		params.add("cancel_vat_amount", cancel_vat_amount);
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		try {
			
			KakaoCancelDto kakaoPayDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body,
					KakaoCancelDto.class);
			
			System.out.println(kakaoPayDto.toString());
			
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}/**/
		
		//saleing 테이블 option 값 변경  
		orderservice.orderOptionProcess(new saleingOptionParam("cancel", saleing_num));
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//util 함수
	public String changeOrderProductName(List<productSaleDto> orderList) {
		//System.out.println("orderUtil   changeOrderProductName()");
		
		
		//System.out.println("111");
		//System.out.println(orderList.get(0).getProduct_num());
		
		productDto prdDto = detailservice.getPrd(orderList.get(0).getProduct_num());
		//System.out.println("22");
		
		String result = "";
		
		
		if(orderList.size() > 1 ) {
			result = prdDto.getProduct_name() + "...외  " + (orderList.size() - 1) + " 건";
			//System.out.println("여러건 === " + result);
		}else if(orderList.size() == 1){
			result = prdDto.getProduct_name();
		}
		
		//System.out.println("result == " + result);
		
		return result;
	}
	
	public String getTotalAmount(List<productSaleDto> orderList) {
		
		System.out.println("orderUtil   getTotalAmount()");
		
		int totalAmount = 0;
		
		for(int i = 0; i < orderList.size(); i++) {
			
			totalAmount += orderList.get(i).getSaleing_amount();
			
		}
		System.out.println("총 갯수 == "  + totalAmount);
		return String.valueOf(totalAmount);
	}
	
	
	
	public kakaoSelectDto selectKakao(String tid) {
		
		//모델로 넘겨줌 
		// 서버와 통신할 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		// 서버로 요청할 header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "cbff925dffacd0e67ba93eed0db3a9a3");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		// 서버로 요청할 Body
		// 결제 정보를 넘겨줘야 한다
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", tid );
		
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		try {
			
			kakaoSelectDto kakaoPayDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/order"), body,
					kakaoSelectDto.class);

			System.out.println(kakaoPayDto.toString());
			Object obj = kakaoPayDto.getAmount();
			Gson gson = new Gson();
			
			String stra = gson.toJson(obj);
			kakaoAmount amount = gson.fromJson(stra, kakaoAmount.class);
			System.out.println(amount.getTotal());
			kakaoPayDto.setTotalPrice("" + amount.getTotal());
			kakaoPayDto.setVat(amount.getVat());
			return kakaoPayDto;
			
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return null;
	}
	
	
}
