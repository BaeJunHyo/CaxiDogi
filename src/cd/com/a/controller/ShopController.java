package cd.com.a.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import cd.com.a.model.adminShopParam;
import cd.com.a.model.memberDto;
import cd.com.a.model.shopDesignerDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopListParam;
import cd.com.a.model.shopPagingParam;
import cd.com.a.model.shopResvDto;
import cd.com.a.model.shopSellerPagingParam;
import cd.com.a.model.shopSellerResvParam;
import cd.com.a.model.shopShowResvParam;
import cd.com.a.service.MemberService;
import cd.com.a.service.ShopService;
import cd.com.a.util.FileUploadUtil;
import oracle.net.aso.f;

@Controller
public class ShopController {
	@Autowired
	ShopService shopService;
	
	@Autowired
	MemberService memService;
	
	@RequestMapping(value="shopRegi.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopRegi() {
		
		return "/smypage/shop/regi_shop";
	}
	
	@RequestMapping(value="adminShopList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String adminShopList(Model model, adminShopParam param) {
		// paging 처리
		int sn = param.getPageNumber();	// 0 1 2	현재 페이지
		int start = sn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (sn + 1) * param.getRecordCountPerPage();	// 10, 20, 30
		
		param.setStart(start);
		param.setEnd(end);
		
		List<shopDto> shopList = shopService.adminShopList(param);
		int totalRecordCount = shopService.adminShopListCount(param);
		
		model.addAttribute("shopList", shopList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("param",param);
		
		return "/bo/shop/bo_shopList";
	}
	
	@RequestMapping(value="adminShopDetail.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String adminShopDetail(int shop_seq, Model model) {
		
		shopDto shop = shopService.getShopDetail(shop_seq);
		model.addAttribute("shop", shop);
		
		return "/bo/shop/bo_ShopDetail";
	}
	
	@RequestMapping(value="adminShopOk.do", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String adminShopOk(int shop_seq) {
		String str = "";
		boolean	status = shopService.adminShopOk(shop_seq);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}
	
	
	@RequestMapping(value="adminShopNo.do", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String adminShopNo(int shop_seq) {
		String str = "";
		boolean	status = shopService.adminShopNo(shop_seq);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}
	
	@RequestMapping(value="imageUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public String imageUpload(HttpServletRequest req, HttpServletResponse resp, 
                 MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null){
			if(file.getSize() > 0){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/images/shopImg");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl = req.getContextPath() + "/images/shopImg/" + fileName;
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                    	
                        if(out != null){
                            out.close();
                        }
                        
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	
	
	@ResponseBody
	@RequestMapping(value = "shopRegiAf.do",method=RequestMethod.POST)
	   public String shopRegiAf(@ModelAttribute shopDto shop, @RequestParam(value="fileload")MultipartFile fileload, HttpServletRequest req){
		String str = "";
		if(!fileload.isEmpty()) {
			String fileUpload = req.getServletContext().getRealPath("/images/shopImg"); 
			String fileName = fileload.getOriginalFilename();
			String saveFileName = "";
			String filepost = "";
			if(fileName.indexOf('.') >= 0) { // 확장자 명이 있을때
				filepost = fileName.substring(fileName.indexOf('.'));
				saveFileName = new Date().getTime() + filepost;
			} 
			
			shop.setShop_photo(saveFileName);
			
			File file = new File(fileUpload + "/" + saveFileName);

			//실제 파일 업로드 되는 부분
			try {
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				System.out.println(shop.toString());
				//db저장
				boolean	status = shopService.addShop(shop);
			
				if(status == true) {
					str = "ok";
				} else {
					str = "no";
				}
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			shop.setShop_photo("default");
			boolean	status = shopService.addShop(shop);
			
			if(status == true) {
				str = "ok";
			} else {
				str = "no";
			}
		}
		
		return str;
	}	
	
	@ResponseBody
	@RequestMapping(value = "shopModifyAf.do",method=RequestMethod.POST)
	   public String shopModifyAf(@ModelAttribute shopDto shop, @RequestParam(value="fileload")MultipartFile fileload, HttpServletRequest req){
		String str = "";
		if(shop.getShop_auth() == 2) {
			shop.setShop_auth(4);
		}
		if(!fileload.isEmpty()) {
			String fileUpload = req.getServletContext().getRealPath("/images/shopImg");
			String fileName = fileload.getOriginalFilename();
			String saveFileName = "";
			String filepost = "";
			if(fileName.indexOf('.') >= 0) { // 확장자 명이 있을때
				filepost = fileName.substring(fileName.indexOf('.'));
				saveFileName = new Date().getTime() + filepost;
			} 
			
			shop.setShop_photo(saveFileName);
			
			File file = new File(fileUpload + "/" + saveFileName);

			//실제 파일 업로드 되는 부분
			try {
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				System.out.println(shop.toString());
				//db저장
				boolean	status = shopService.shopModifyAf(shop);
			
				if(status == true) {
					str = "ok";
				} else {
					str = "no";
				}
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			boolean	status = shopService.shopModifyAf(shop);
			
			if(status == true) {
				str = "ok";
			} else {
				str = "no";
			}
		}
		
		return str;
	}	

	@ResponseBody
	@RequestMapping(value="shopStop.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopStop(int shop_seq) {
		String str = "";
		boolean	status = shopService.shopStopAf(shop_seq);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}

	
	@RequestMapping(value="sellerShopList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String sellerShopList(HttpSession session, Model model) {
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		System.out.println(mem.toString());
		List<shopDto> list = shopService.getSellerShopList(mem.getMem_seq());
		model.addAttribute("shopList", list);
		
		return "/smypage/shop/sellerShopList";
	}
	

	@RequestMapping(value="shopDesignAdd.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopDesignAdd(int shop_seq, Model model) {
		shopDto shop = shopService.getShopDetail(shop_seq);
		model.addAttribute("shop", shop);
		
		return "/smypage/shop/regi_design";
	}
	
	@ResponseBody
	@RequestMapping(value="shopDesignAddAf.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopDesignAddAf(shopDesignerDto designer) {
		String str = "";
		System.out.println(designer.toString());
		boolean	status = shopService.addDesigner(designer);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value="stopDesignAf.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String stopDesignAf(shopDesignerDto designer) {
		String str = "";
		System.out.println(designer.toString());
		boolean	status = shopService.stopDesignAf(designer);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}
	
	
	@ResponseBody
	@RequestMapping(value="playDesignAf.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String playDesignAf(shopDesignerDto designer) {
		String str = "";
		System.out.println(designer.toString());
		boolean	status = shopService.playDesignAf(designer);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}
	
	@RequestMapping(value="shopDesignList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopDesignList(int shop_seq, Model model) {
		List<shopDesignerDto> designerList = shopService.getDesignerAll(shop_seq);
		model.addAttribute("designerList", designerList);
		model.addAttribute("shop_seq", shop_seq);
		
		return "/smypage/shop/shopDesignList";
	}
	
	@ResponseBody
	@RequestMapping(value="checkDesign.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String checkDesign(shopDesignerDto shopDesign) {
		String str = "";
		
		int count = shopService.checkDesign(shopDesign);
		
		if(count == 0) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value="shopDesignModifyAf.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopDesignModifyAf(shopDesignerDto shopDesign) {
		String str = "";
		boolean status = shopService.designModify(shopDesign);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}

	@ResponseBody
	@RequestMapping(value="deleteDesignAf.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String deleteDesign(shopDesignerDto shopDesign) {
		String str = "";
		int count = shopService.checkDesign(shopDesign);
		
		if(count == 0) {
			boolean status = shopService.delDesignAf(shopDesign);
			if(status == true) {
				str = "ok";
			} else {
				str = "no";
			}
		} else {
			str = "no";
		}
		
		return str;
	}
	
	@RequestMapping(value="designModify.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String designModify(shopDesignerDto shopDesign, Model model) {
		shopDto shop = shopService.getShopDetail(shopDesign.getShop_seq());
		shopDesignerDto designer = shopService.getDesignerInfo(shopDesign);
		
		model.addAttribute("shop", shop);
		model.addAttribute("designer", designer);
		
		return "/smypage/shop/modify_design";
	}
	
	@RequestMapping(value="modifyShop.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String modifyShop(int shop_seq, Model model) {
		shopDto shop = shopService.getShopDetail(shop_seq);
		
		model.addAttribute("shop", shop);
		
		return "/smypage/shop/modify_shop";
	}
	
	@RequestMapping(value="reModifyShop.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String reModifyShop(int shop_seq, Model model) {
		shopDto shop = shopService.getShopDetail(shop_seq);
		
		model.addAttribute("shop", shop);
		
		return "/smypage/shop/re_modify_shop";
	}
//--------------------------------------------------------------MJ--------------------------------------------------	
	
	@RequestMapping(value="getShopList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String getShopList(Model model, shopListParam param) {
		
		System.out.println("shoplist Param ========================== "+param.toString());
		// paging 처리
		int pageNumber = param.getPageNumber();	// 0 1 2	현재 페이지
		int start = pageNumber * param.getRecordCountPerPage(); // 0, 10, 21
		
		int end = (pageNumber + 1) * param.getRecordCountPerPage();	// 10, 20, 30
		
		param.setStart(start);
		param.setEnd(end);
		
		List<shopDto> shoplist = shopService.getShopList(param);
		List<shopDto> shopSuccessList = new ArrayList<shopDto>();
		if(shoplist.size()!=0) {
			for(int i = 0; i< shoplist.size(); i++) {
				shopDto shopDesignDto = new shopDto();
				shopDesignDto = shoplist.get(i);
				if(shopService.checkDesigner(shopDesignDto.getShop_seq())) {
					shopSuccessList.add(shopDesignDto);
				}
			}
			
		}
		
		//글의 총수
		int totalRecordCount = shopService.getShopCount();
		
		/* model.addAttribute("shoplist", shoplist); */
		model.addAttribute("shoplist", shopSuccessList);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("param",param);
		
		return "/shop/shop";
	}

	
	
	@ResponseBody
	@RequestMapping(value="getResvTime.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public Map<Integer, Object> resv(shopResvDto resvDto) {
		System.out.println("======ResvDto:" + resvDto.toString());
		
		Map<Integer, Object> map = new HashMap<Integer, Object>();
		
		
		 
		 
	/*	List<shopDesignerDto> resvDesList = shopService.getDesigner(shop_seq);
		for(int i = 0; i<resvDesList.size(); i++) {
			shopDesignerDto dto = resvDesList.get(i);
			dd =  dto.getDesign_name();
		}*/
//		 
		List<String> resvTime = shopService.getResv(resvDto);
		
		for(int i = 0; i<resvTime.size(); i++) {
			map.put(i+1,resvTime.get(i));
		}
//		
//		String noResvTime = "";
//			
//		 List<shopResvDto> resvTimeList = shopService.getResv(design_seq);
//			for(int i = 0; i<resvTimeList.size(); i++) {
//				shopResvDto dto = resvTimeList.get(i);
//			
//			}
//		
//		String d = (String) map.get("design_name");
//		System.out.println("========d" + d);
//		//map.put("resvDesList", resvDesList);
//		//map.put("desgine_name",map.get("design_name"));
//		map.put("desgine_name",dd);
//		
//		String desTime[];
//		
//		List<shopDesignerDto> desList = shopService.getDesigner(shop_seq);
//		for(int j = 0; j<desList.size(); j++ ) {
//			shopDesignerDto desDto = desList.get(j);
//			if(desDto.getDesign_seq() == design_seq) {
//				String time = desDto.getDesign_time();
//				desTime = time.split("/");
//				for(int )
//				System.out.println("==========TestDesTiem:"+ desTime);
//			}
//		}
//		map.put("i", time);
//		map.put("i", time);
//		map.put("i", time);
//		map.put("1", time);
//		map.put("1", time);
//		map.put("1", time);
//		
		
		return map;
	}
	
	
	@RequestMapping(value="shopDetail.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopResv(Model model, int shop_seq) {
		
		
		System.out.println("===========shopSeq" + shop_seq);
		List<shopDesignerDto> designerList = shopService.getDesigner(shop_seq);
		shopDto shopDetail = shopService.getShopDetail(shop_seq);
		model.addAttribute("shopDetail", shopDetail);
		model.addAttribute("designerList", designerList);
		
		return "/shop/shopDetail";
	}
	
	@RequestMapping(value="shopResvWrite.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopResvWrite(Model model, HttpServletRequest request, shopResvDto shopResvdto) {
		//String sshop_seq = request.getParameter("shop_seq");
		//int shop_seq = Integer.parseInt(sshop_seq);
		System.out.println("=========!!!!!!!resvdto" + shopResvdto.toString());
		//System.out.println("===========parameterShopSeq:" +shop_seq);
		
		shopDto shopdto = shopService.getShopDetail(shopResvdto.getShop_seq());
		shopDesignerDto desdto = shopService.getDesignerInfo(shopResvdto.getDesign_seq());
		
		memberDto mem = memService.resvMem(shopResvdto.getMem_seq());
		
		shopResvdto.setShop_resv_name(mem.getUser_name());
		shopResvdto.setShop_resv_tel(mem.getPhone());
		
		model.addAttribute("shopdto", shopdto);
		model.addAttribute("desdto", desdto);
		model.addAttribute("shopResvdto", shopResvdto);
		
		return "/shop/shopResvWrite";
	}
	
	@ResponseBody
	@RequestMapping(value="shopResv.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> shopResv(@ModelAttribute shopResvDto shopResv) {
		System.out.println("shop 예약 내역:" + shopResv.toString());
		int result = shopService.resvShop(shopResv);
		Map<String, Object> rmap = new HashMap<String, Object>();
		
		if(result != 0) {
			rmap.put("status", "ok");
			rmap.put("rnum", result);
		}else {
			rmap.put("status", "no");
		}
		return rmap;
	}
	
	
	@RequestMapping(value="shopResvAf.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopResvAf(int shop_resv_seq, Model model) {
		System.out.println("===========예약완료 시퀀스:"+ shop_resv_seq);
		shopResvDto shopResv = shopService.getShopResv(shop_resv_seq);
		shopDto shop = shopService.getShopDetail(shopResv.getShop_seq());
		System.out.println("shopResvAf shop toString:" + shop.toString() );
		shopDesignerDto desdto = shopService.getDesignerInfo(shopResv.getDesign_seq());
		
		model.addAttribute("shopResv", shopResv);
		model.addAttribute("shop", shop);
		model.addAttribute("desdto", desdto);
		
		return "/shop/shopResvAf";
		
	}
	
	
	// 유저 미용 예약 리스트
	@RequestMapping(value="showShopResv.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String showShopResv(Model model, HttpSession session, shopPagingParam param) {
		memberDto loginUser = (memberDto)session.getAttribute("loginUser");
		System.out.println("=============showResv: " + loginUser.getMem_seq() );
		// paging 처리
		int pageNumber = param.getPageNumber();	// 0 1 2	현재 페이지
		int start = pageNumber * param.getRecordCountPerPage(); // 0, 10, 21
		
		int end = (pageNumber + 1) * param.getRecordCountPerPage();	// 10, 20, 30
		
		param.setStart(start);
		param.setEnd(end);
		param.setMem_seq(loginUser.getMem_seq());
		System.out.println("param=====" + param.toString());
		
		List<shopShowResvParam> showShopList = shopService.showShopResv(param);
		
		for(int i =0; i<showShopList.size(); i++) {
			shopShowResvParam dto = showShopList.get(i);
			System.out.println("=====dto.to.:" +dto.toString());
		}
		
		// 글의 총수
		int totalRecordCount = shopService.getShopResvCount(loginUser.getMem_seq());

		model.addAttribute("showShopList", showShopList);
		System.out.println("size=====" + showShopList.size());
		
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
	
		return "/shop/showShopResv";
	}
	
	// 유저 미용 예약 취소 리스트 
	@RequestMapping(value="shopResvCancelList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopResvCancelList(Model model, HttpSession session, shopPagingParam param) {
		memberDto loginUser = (memberDto)session.getAttribute("loginUser");
		// paging 처리
		int pageNumber = param.getPageNumber();	// 0 1 2	현재 페이지
		int start = pageNumber * param.getRecordCountPerPage(); // 0, 10, 21
		
		int end = (pageNumber + 1) * param.getRecordCountPerPage();	// 10, 20, 30
		
		param.setStart(start);
		param.setEnd(end);
		param.setMem_seq(loginUser.getMem_seq());
		
		List<shopShowResvParam> cancelShopList = shopService.shopShopCancelResv(param);
		
		int totalRecordCount = shopService.getShopCancelResvCount(loginUser.getMem_seq());
		System.out.println("================================================cancelseq+" +loginUser.getMem_seq());
		
		model.addAttribute("cancelShopList", cancelShopList);
		
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		return "/shop/showShopCancelResv";
		
	}
	
	// 유저 미용 예약 취소
	@ResponseBody
	@RequestMapping(value="cancelShopResv.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String cancelShopResv(shopResvDto shopresv) {
		String str = "";
		int count = shopService.shopCalcelTimeCheck(shopresv);
		
		if(count == 1 ) {
			boolean b = shopService.cancelShopResv(shopresv);
			if(b) {
				str = "ok";
			}else {
				str = "no";
			}
		} else if(count == 0) {
			str = "no";
		}
		
		return str;
	}
	
	////// 셀러 미용 예약 리스트
	@RequestMapping(value="shopSellerResvList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopSellerResvList(HttpSession session, Model model, shopSellerPagingParam param) {
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		param.setMemSeq(mem.getMem_seq());
		// paging 처리
		int pageNumber = param.getPageNumber();	// 0 1 2	현재 페이지
		int start = pageNumber * param.getRecordCountPerPage(); // 1, 11, 21
		
		int end = (pageNumber + 1) * param.getRecordCountPerPage();	// 10, 20, 30
		
		param.setStart(start);
		param.setEnd(end);
		int totalRecordCount = shopService.getSellerResvCount(param);
		
		List<shopSellerResvParam> resvlist = shopService.getSellerShopResvList(param);
		for(int i=0; i<resvlist.size();i++) {
			shopSellerResvParam dto = resvlist.get(i);
			
		}
		List<shopDto> shoplist = shopService.getSellerShopList(mem.getMem_seq());
		
		model.addAttribute("shopresvlist", resvlist);
		model.addAttribute("shoplist", shoplist);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("param",param);
		
		return "/smypage/shop/sellerShopResvList";
	}
	
	@RequestMapping(value="shopSellerResvDetail.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopSellerResvDetail(Model model, int shop_resv_seq) {
		shopSellerResvParam shopresv = shopService.getSellerResvDetail(shop_resv_seq);
		model.addAttribute("shopresv", shopresv);
		
		return "/smypage/shop/shopResvDetail";
	}
	
	@RequestMapping(value="shopResvUpdate.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopResvUpdate(Model model,int shop_resv_seq) {
		model.addAttribute("shop_resv_seq", shop_resv_seq);
		return "/shop/shopResvUpdate";
	}

	@ResponseBody
	@RequestMapping(value="shopResvUpdateAf.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopResvUpdate(Model model, shopResvDto resv) {
		String str = "";
		boolean b = shopService.shopResvUpdate(resv);
		
		if(b) {
			str="ok";
		}else {
			str ="no";
		}
		
		return str;
		
	}
	
	
	
	
}






























