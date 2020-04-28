package cd.com.a.controller;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import cd.com.a.model.KakaoPayReadyDto;

@Controller
public class kakaoPayController {

	private final String HOST = "https://kapi.kakao.com";
	
	@RequestMapping(value="kakaoPayReady.do")
	@ResponseBody
	public String kakaoPayReady() {
		
		System.out.println("kakaoPayController  kakaoPayReady()");
		
		
		//db 주문테이블 생성

		//서버와 통신할 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		//서버로 요청할 header 
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "cbff925dffacd0e67ba93eed0db3a9a3");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		

        // 서버로 요청할 Body
        // 고객이 주문한 상품에 대한 정보를 넘겨줘야한다.
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); 					//가맹점 코드 (카카오관리 점포 seq) NOT NULL
        //params.add("cid_secret", value); 					//가맹점 코드 인증키 () NULL  
        params.add("partner_order_id", "1001"); 			//(내가 관리하는 DB주문번호) 주문번호 NOT NULL
        params.add("partner_user_id", "박지훈 테스트"); 		// (내가 관리하는 DB회원아이디) NOT NULL
        params.add("item_name", "갱아지사료");  				//상품명  NOT NULL
        //params.add("item_code", value);  					// 상품코드  NULL
        params.add("quantity", "1");  						//상품 수량 NOT NULL 
        params.add("total_amount", "1500");  				//상품 총액 NOT NULL
        params.add("tax_free_amount", "100"); 				//상품 비과세 금액 NOT NULL
        params.add("approval_url", "http://localhost:8090/kakaoTest/kakaoPaySuccess.do"); 	//결제 성공시 넘어갈 servlet Controller 주소 
        params.add("cancel_url", "http://localhost:8090/kakaoTest/kakaoPayCancel.do");		//결제 취소시 넘어갈 servlet Controller 주소 
        params.add("fail_url", "http://localhost:8090/kakaoTest/kakaoPaySuccessFail.do"); 	//결제 실패시 넘어갈 servlet Controller 주소
        //params.add("available_cards", json Array); 			//결제 수단 카드사 설정 NULL이면 모두 허용  (ex :  우리은행 o  , 국민은행 x , 신한은행  o) 이런식   NULL
        //params.add("payment_method_type", String); 			//결제 허용 수단 설정  카드/현금 중 선택   NULL이면 모두 허용    NULL 
        //params.add("install_month", integer); 				//카드 할부 개월 0 ~ 12 NULL
        //params.add("custom_json", json map); 				//결제 화면에 보여줄 사용자 정의 문구 (카카오와 협의필요) NULL
        
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
			KakaoPayReadyDto kakaoPayDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyDto.class);
			
			System.out.println();
			
			//db 주문 테이블 update (tid 넣기)
			
			
			return kakaoPayDto.getNext_redirect_pc_url();
			
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return null;
	}
	
	/*
	 @RequestMapping(value="kakaoPaySuccess.do",method= {RequestMethod.GET,RequestMethod.POST})
	    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
	        logger.info("kakaoPaySuccess get............................................");
	        logger.info("kakaoPaySuccess pg_token : " + pg_token);
	        logger.info("카카오 페이 성공!!!!! ");
	        
	    }
	 
	 @RequestMapping(value="kakaoPaySuccessFail.do", method= {RequestMethod.GET,RequestMethod.POST})
	    public String kakaoPaySuccessFail(@RequestParam("pg_token") String pg_token, Model model) {
	        logger.info("kakaoPaySuccessFail get............................................");
	        logger.info("kakaoPaySuccessFail pg_token : " + pg_token);
	        //cid 
	        //tid
	        //주문번호 (DB)
	        //회원아이디(DB)
	        
	        
	        return "";
	    }
	 
	 @RequestMapping(value="kakaoPayCancel.do", method= {RequestMethod.GET,RequestMethod.PUT})
	    public String kakaoPayCancel(Model model) {
	        logger.info("kakaoPayCancel get............................................");
	        return "kakao_close";
	    }
	
	
	*/
}
