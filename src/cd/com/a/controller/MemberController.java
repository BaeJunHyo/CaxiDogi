package cd.com.a.controller;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cd.com.a.goods.DetailService;
import cd.com.a.model.groundResvParam;
import cd.com.a.model.memberDto;
import cd.com.a.model.myBuyParam;
import cd.com.a.model.poolResvParam;
import cd.com.a.model.productDto;
import cd.com.a.model.productSaleDto;
import cd.com.a.model.shopShowResvParam;
import cd.com.a.service.MemberService;
import cd.com.a.service.MyPageService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	MyPageService mypageService;
	
	@Autowired
	DetailService detailService;
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/newAccount.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String newAccount() {
		return "/member/newAccount";
	}
	//로그인 페이지 이동
	@RequestMapping(value = "/loginView.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String loginView(HttpServletRequest req, Model model) {
		String recovery = (String)req.getParameter("recovery");
		String recoverId = (String)req.getSession().getAttribute("recoverId");
		if(recovery != null) {
			model.addAttribute("recoverId",recoverId);
			model.addAttribute("recovery",recovery);
		}
		return "/member/loginView";
	}
	// ID찾기
	@RequestMapping(value="/findId.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findId() {
		return "/member/findId";
	}
	@ResponseBody
	@RequestMapping(value="/findIdAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findIdAf(memberDto dto) {
		String id = memberService.findId(dto);
		return id;
	}
	// PW찾기
	@RequestMapping(value="/findPwd.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findPwd() {
		return "/member/findPwd";
	}
	@ResponseBody
	@RequestMapping(value="/findPwdAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findPwdAf(memberDto dto) {
		String pwd = memberService.findPwd(dto);
		return pwd;
	}
	// 계정복구
	@RequestMapping(value = "/recoveryId.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String recoveryId() {
		return "/member/recoveryId";
	}
	@ResponseBody
	@RequestMapping(value = "/recoveryIdAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String recoveryIdAf(memberDto dto) {
		System.out.println("여기"+dto.toString());
		memberDto detail = memberService.login(dto);
		//틀린정보
		if(detail == null) {
			return "fail";
		//계정 존재
		}else {
			boolean result = memberService.recoveryId(dto);
			if(result) {
				return "success";
			//기존계정
			}else {
				return "fail";
			}
		}
	}
	// SNS제외 자체회원 ID중복 체크
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public boolean idCheck(@RequestParam("idcheck")String id) {
		memberDto dto = new memberDto();
		dto.setId(id);
		dto.setUser_api(0);
		boolean result = memberService.idCheck(dto);
		return result;
	}
	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value="/nickCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public boolean nickCheck(@RequestParam("nickcheck")String nick_name) {
		boolean result = memberService.nickCheck(nick_name);
		return result;
	}

	// 회원가입 완료 여부
	@RequestMapping(value="/memberInsert.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberInsert(memberDto dto, Model model) {
		dto.setUser_api(0);
		boolean result = memberService.newRegi(dto);
		if(result) {
			model.addAttribute("regi","true");
			return "/member/alertPage";
		}
		/* return "redirect:/main.do"; */
		return "/member/alertPage";
	}

	// 마이페이지 이동
	@RequestMapping(value="/myPage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myPage(Model model, HttpServletRequest req, HttpSession session) {
		int mem_seq = ((memberDto)req.getSession().getAttribute("loginUser")).getMem_seq();
		List<poolResvParam> myPoolResvList = mypageService.getPoolResvList(mem_seq);
		List<groundResvParam> myGroundResvList = mypageService.getGroundResvList(mem_seq);
		List<shopShowResvParam> myShopResvList = mypageService.getShopResvList(mem_seq);
		
		//최근 나의 구매 내역 
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		List<Integer> saleGroupList = mypageService.myOrderList_group(mem.getMem_seq());
		
		int fsize = 0; //for문 돌아갈 사이즈 
		if(saleGroupList.size() >= 5) {fsize = 5;}
		else {fsize = saleGroupList.size();}
		
		List<myBuyParam> myBuyList = new ArrayList<myBuyParam>(); 
		
		
		//saleGroupList 만큼 돌리면서 paramList 생성 
		for(int i = 0; i < fsize; i++) {
			//System.out.print("넘어온 saleing_num["+ i +"]  == ");
			//System.out.println(saleGroupList.get(i));
			
			List<productSaleDto> saleList = mypageService.myOrderList(saleGroupList.get(i));
			
			String myOrderName = changeOrderProductName(saleList);
			String saleing_numStr = "" + saleList.get(0).getSaleing_num();
			int amount = saleList.get(0).getSaleing_amount();
			
			int price = detailService.getPrd(saleList.get(0).getProduct_num()).getProduct_price() * amount;
			
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
					prdDto = detailService.getPrd(saleList.get(j).getProduct_num());
					price += prdDto.getProduct_price() * saleList.get(j).getSaleing_amount();
					
				}
			}else {
				prdDto = detailService.getPrd(saleList.get(0).getProduct_num());
			}
			System.out.println(prdDto.getProduct_img());
			myBuyList.add(new myBuyParam(saleing_numStr, myOrderName, strDate, prdDto.getProduct_img(), amount, price, saleGroupList.get(i) , saleList.get(0).getProduct_delivery_state(), Integer.parseInt(prdDto.getProduct_group()), Integer.parseInt(prdDto.getProduct_sub_group()),saleList.get(0).getSaleing_option(),saleList.get(0).getSaleing_option_state()));
			
			
		}
		if(saleGroupList.size() == 0 || saleGroupList == null) {
			myBuyList = null;
		}
			
		
		
		//최근 나의 구매,예약 리스트
		//model.addAttribute("myBuyList",myBuyList);
		model.addAttribute("myGroundResvList",myGroundResvList);
		model.addAttribute("myPoolResvList",myPoolResvList);
		model.addAttribute("myShopResvList",myShopResvList);
		model.addAttribute("myBuyList", myBuyList);
		
		return "/mypage/mypage_main";
	}

	//헤더 마이페이지 클릭시
	@RequestMapping(value="/myPageMove.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myPageMove(HttpServletRequest req, Model model) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		if(loginUser != null) {
			// 자체 회원
			if(loginUser.getUser_api() == 0){
				return "redirect:myPage.do";
			// sns
			}else{
				memberDto memberDetail = memberService.loginId(loginUser.getMem_seq());
				// 회원정보 미입력된 내용 존재 시
				if(memberDetail.getUser_name()==null ||
						memberDetail.getNick_name()==null ||
						memberDetail.getAddress()==null ||
						memberDetail.getPhone()==null ||
						memberDetail.getBirthday()==null){
						//model.addAttribute("info","false");
						model.addAttribute("memberDetail",memberDetail);
					return "/mypage/snsMemberDetail";
				// 회원정보 공란 없을 시
				}else {
					return "redirect:myPage.do";
				}
			}
		}
		return "redirect:myPage.do";
	}
	// sns로 첫 로그인시 미입력 회원정보 입력 하도록
	@RequestMapping(value="/snsFirstLogin.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String snsFirstLogin(HttpServletRequest req,Model model) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		model.addAttribute("memberDetail",memberService.loginId(loginUser.getMem_seq()));
		return "/mypage/snsMemberDetail";
	}

	// 회원정보 상세
	@RequestMapping(value="/memberDetail.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberDetail(HttpServletRequest req, Model model) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		model.addAttribute("memberDetail",memberService.loginId(loginUser.getMem_seq()));
		if(loginUser.getUser_api()==0) {
			return "/mypage/memberDetail";
		}else {
			return "redirect:snsFirstLogin.do";
		}
	}

	// SNS회원정보 기입 후 정보 업데이트
	@RequestMapping(value="/snsFirstUpdate.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String snsFirstUpdate(memberDto dto, Model model, HttpServletRequest req) {
		System.out.println("snsUP="+dto.toString());
		if(memberService.snsFirstUpdate(dto)) {
			//변동된 회원정보로 세션 초기화
			memberDto login = memberService.snsLogin(dto);
			req.getSession().removeAttribute("loginUser");
			req.getSession().setAttribute("loginUser", login);
			req.getSession().setMaxInactiveInterval(60*60*365);
			model.addAttribute("update","true");
			return "/member/alertPage";
		}else {
			model.addAttribute("update","false");
			return "/member/alertPage";
		}

	}
	// 자체회원 정보 변경
	@RequestMapping(value="/memberUpdateMove.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberUpdate(HttpServletRequest req,Model model) {
		memberDto loginUser = (memberDto)req.getSession().getAttribute("loginUser");
		if(loginUser.getUser_api()==0) {
			model.addAttribute("memberDetail",memberService.loginId(loginUser.getMem_seq()));
			return "/mypage/memberUpdate";
		}else {
			model.addAttribute("memberDetail",memberService.loginId(loginUser.getMem_seq()));
			return "/mypage/snsMemberUpdate";
		}
	}
	// 회원정보 변경 시 패스워드 확인
	@ResponseBody
	@RequestMapping(value="/pwdCheck.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String passwordCheck(memberDto dto) {
		boolean result = memberService.pwdCheck(dto);
		if(result) {
			return "true";
		}else {
			return "false";
		}
	}

	// 판매자 등록 신청 ( 승인대기 )
	@ResponseBody
	@RequestMapping(value="/sellerAccess.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String sellerAccess(@RequestParam("mem_seq")int mem_seq,HttpServletRequest req) {
		boolean result = memberService.sellerAccess(mem_seq);
		if(result) {
			// auth 변경 값  세션 재 적용
			req.getSession().removeAttribute("loginUser");
			memberDto login = memberService.loginId(mem_seq);
			req.getSession().setAttribute("loginUser", login);
			req.getSession().setMaxInactiveInterval(60*60*365);
			return "success";
		}else {
			return "fail";
		}
	}

	// 회원 탈퇴
	@RequestMapping(value="/memberEscape.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberEscape(HttpServletRequest req, Model model) {
		int mem_seq = ((memberDto)req.getSession().getAttribute("loginUser")).getMem_seq();
		memberService.memberEscape(mem_seq);
		req.getSession().removeAttribute("loginUser");
		model.addAttribute("msg","탈퇴처리 되었습니다.");
		return "/member/alertPage";
	}

	@RequestMapping(value="/userUpdate.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String userUpdate(memberDto dto,HttpServletRequest req, Model model) {
		boolean result = memberService.userUpdate(dto);
		memberDto login = null;
		if(result) {
			if(dto.getUser_api()==0) {
				login = memberService.login(dto);
			}else {
				login = memberService.snsLogin(dto);
			}

			req.getSession().removeAttribute("loginUser");
			req.getSession().setAttribute("loginUser", login);
			req.getSession().setMaxInactiveInterval(60*60*365);
			model.addAttribute("update","true");
			model.addAttribute("memberDetail",memberService.loginId(dto.getMem_seq()));
			return "/member/alertPage";
		}else {
			model.addAttribute("update","false");
			model.addAttribute("memberDetail",memberService.loginId(dto.getMem_seq()));
			return "/member/alertPage";
		}
	}
		// 판매자 페이지 이동
	   @RequestMapping(value="/sellerMyPage.do", method= {RequestMethod.GET,RequestMethod.POST})
	   public String sellerMyPage(Model model, HttpSession session) {
		   memberDto mem = (memberDto) session.getAttribute("loginUser");
			List<poolResvParam> myPoolResvList = mypageService.sellerPoolResvList(mem.getMem_seq());
			List<shopShowResvParam> myShopResvList = mypageService.sellerShopResvList(mem.getMem_seq());

			//최근 나의 구매,예약 리스트
			//model.addAttribute("myBuyList",myBuyList);
			model.addAttribute("myPoolResvList",myPoolResvList);
			model.addAttribute("myShopResvList",myShopResvList);
	      return "/smypage/mypage_seller";
	   }

	   // [관리자] 승인대기 -> 승인  처리
	   @ResponseBody
	   @RequestMapping(value="/sellerAccessPass.do", method= {RequestMethod.GET,RequestMethod.POST})
	   public String sellerAccessPass(@RequestParam(value="passList[]")int[] mem_seq,HttpServletRequest req) {

		  System.out.println("=="+mem_seq[0]);
		  boolean result = memberService.sellerAccessPass(mem_seq);
		  if(result) {
			  return "success";
		  }else {
			  return "fail";
		  }
	   }
	   // [관리자] 승인대기 -> 승인  반려
	   @ResponseBody
	   @RequestMapping(value="/sellerAccessFail.do", method= {RequestMethod.GET,RequestMethod.POST})
	   public String sellerAccessFail(@RequestParam(value="failList[]")int[] mem_seq,HttpServletRequest req) {
		   System.out.println("++"+mem_seq[0]);
			  boolean result = memberService.sellerAccessFail(mem_seq);
			  if(result) {
				  return "success";
			  }else {
				  return "fail";
			  }
	   }
	   
	   @RequestMapping(value="/sellerAccessMgmt.do", method= {RequestMethod.GET,RequestMethod.POST})
	   public String sellerAccessMgmt(Model model) {
		   List<memberDto> sellerAccessList = memberService.getSellerAccessList();
		   model.addAttribute("sellerAccessList",sellerAccessList);
	      return "/mypage/sellerAccessMgmt";
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	 //util 함수
		public String changeOrderProductName(List<productSaleDto> orderList) {
			System.out.println("orderUtil   changeOrderProductName()");
			
			
			//System.out.println("111");
			System.out.println(orderList.get(0).getProduct_num());
			
			productDto prdDto = detailService.getPrd(orderList.get(0).getProduct_num());
			//System.out.println("22");
			
			String result = "";
			
			
			if(orderList.size() > 1 ) {
				result = prdDto.getProduct_name() + "...외  " + (orderList.size() - 1) + " 건";
				System.out.println("여러건 === " + result);
			}else if(orderList.size() == 1){
				result = prdDto.getProduct_name();
			}
			
			System.out.println("result == " + result);
			
			return result;
		}
	   
	   
	   
	   
	   
	   
	   
}
