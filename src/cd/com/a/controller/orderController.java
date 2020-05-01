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
import cd.com.a.model.KakaoPayApproveDto;
import cd.com.a.model.KakaoPayReadyDto;
import cd.com.a.model.kakaoAmount;
import cd.com.a.model.kakaoSelectDto;
import cd.com.a.model.memberDto;
import cd.com.a.model.order_PrdParamList;
import cd.com.a.model.productDto;
import cd.com.a.model.productSaleDto;
import cd.com.a.service.orderService;
import cd.com.a.util.orderUtil;

@Controller
public class orderController {

	@Autowired
	orderService orderservice;
	
	@Autowired
	DetailService detailservice;
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
		System.out.println("memberSeq === " + mem.getMem_seq());
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
        params.add("approval_url", "http://localhost:8090/CaxiDogi/kakaoPaySuccess.do"); 	//결제 성공시 넘어갈 servlet Controller 주소 
        params.add("cancel_url", "http://localhost:8090/CaxiDogi/kakaoPayCancel.do");		//결제 취소시 넘어갈 servlet Controller 주소 
        params.add("fail_url", "http://localhost:8090/CaxiDogi/kakaoPaySuccessFail.do"); 	//결제 실패시 넘어갈 servlet Controller 주소
        
		System.out.println("2222");
		

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		System.out.println("333");
		try {
			
			KakaoPayReadyDto kakaoPayDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyDto.class);
			
			System.out.println("4444");
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
	
	
	
	
	//util 함수
	public String changeOrderProductName(List<productSaleDto> orderList) {
		System.out.println("orderUtil   changeOrderProductName()");
		
		
		System.out.println("111");
		System.out.println(orderList.get(0).getProduct_num());
		
		productDto prdDto = detailservice.getPrd(orderList.get(0).getProduct_num());
		System.out.println("22");
		
		String result = "";
		
		
		if(orderList.size() > 1 ) {
			result = prdDto.getProduct_name() + "...외  " + orderList.size() + " 건";
			System.out.println("여러건 === " + result);
		}else if(orderList.size() == 1){
			result = prdDto.getProduct_name();
		}
		
		System.out.println("result == " + result);
		
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
