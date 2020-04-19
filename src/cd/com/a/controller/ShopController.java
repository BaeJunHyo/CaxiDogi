package cd.com.a.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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

import cd.com.a.model.memberDto;
import cd.com.a.model.shopDto;
import cd.com.a.model.shopResvDto;
import cd.com.a.service.ShopService;
import cd.com.a.util.FileUploadUtil;

@Controller
public class ShopController {
	@Autowired
	ShopService shopService;
	
	@RequestMapping(value="getShopList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String getShopList(Model model) {
		List<shopDto> shoplist = shopService.getShopList();
		model.addAttribute("shoplist", shoplist);
		
		return "/shop/shop";
	}
	
	@RequestMapping(value="shopRegi.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopRegi(HttpSession session) {
		
		memberDto mem = new memberDto(5);
		session.setAttribute("login", mem);
		session.setMaxInactiveInterval(60*60*365);
		
		return "/shop/regi_shop";
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
	   public String multipartUpload(@ModelAttribute shopDto shop, @RequestParam(value="fileload")MultipartFile fileload, HttpServletRequest req){
		String str = "";
		if(!fileload.isEmpty()) {
			String fileUpload = req.getServletContext().getRealPath("/images/shopImg"); 
			System.out.println("fileUpload" + fileUpload); // 업로드 위치
			//System.out.println(fileUpload);
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
	
	@RequestMapping(value="sellerShopList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String sellerShopList(int mem_seq, Model model) {
		List<shopDto> list = shopService.getSellerShopList(mem_seq);
		model.addAttribute("shopList", list);
		
		return "/shop/sellerShopList";
	}
	
	@RequestMapping(value="shop.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shop() {
		return "/shop/shop";
	}
	
	
	@ResponseBody
	@RequestMapping(value="getshopResv.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> getshopResv(Model model, int shop_seq, int design_seq) {
//		List<shopParam> sParam = service.getDesigner(seq);
//		for(int i = 0; i< sParam.size(); i++) {
//			shopParam dto = sParam.get(i);
//			String str = dto.getDesign_time();
//			String [] time = str.split("/");
//			String dtime[] = time;
//			System.out.println("============"+dtime);
//		}
//		System.out.println("============"+seq);
//		System.out.println("dto=======" + sParam.get(0).getShop_small_price());
//		//String sp = sParam.get(0).getDesign_name();
//		model.addAttribute("getDesigner", sParam);
//		/* model.addAttribute("getDesignerTime", time); */
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		//shopDesignerDto designgDto = shopService.getDesigner(shop_seq); 
	//	List<shopResvDto> resvlist = shopService.getResv(design_seq); 얘는 에이작스 불러올때 필요함
		List<shopDto> shoplist = shopService.getShopList();
		
		
		//map.put("designerDto", designgDto);
		//map.put("resvlist", resvlist);
		
//		
//		
//		model.addAttribute("designgDto", designgDto);
//		model.addAttribute("resvlist", resvlist);
//		
		
		
		
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="resv.do",  method= {RequestMethod.GET,RequestMethod.POST})
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
	
	@ResponseBody
	@RequestMapping(value="test.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String test(Model model, String data,int design_seq, int shop_seq, String shop_resv_rday) {
		System.out.println("======Testdata:" + data);
		System.out.println("======Testshop_seq:" + shop_seq);
		System.out.println("============Testdesign_seq:" + design_seq);
		System.out.println("============Testshop_resv_rday:" + shop_resv_rday);
		
		String resvTime = "";
		String noResvTime = "";
		
//		List<shopResvDto> resvTimeList = shopService.getResv(design_seq);
//		for(int i = 0; i<resvTimeList.size(); i++) {
//			shopResvDto dto = resvTimeList.get(i);
//			if(dto.getShop_resv_rday().equals(shop_resv_rday) && dto.getDesign_seq() == design_seq ) {
//				resvTime = dto.getShop_resv_time();
//				System.out.println("======TestresvTime:" +resvTime);
//			}else if(dto.getShop_resv_rday().equals(shop_resv_rday) && dto.getDesign_seq() == design_seq && !dto.getShop_resv_time().equals(resvTime)){
//				noResvTime = dto.getShop_resv_time();
//				System.out.println("======TestNoResvTime:" +noResvTime);
//			}
//		}
		
		
		
//		List<shopDesignerDto> desList = shopService.getDesigner(shop_seq);
//		for(int j = 0; j<desList.size(); j++ ) {
//			shopDesignerDto desDto = desList.get(j);
//			if(desDto.getDesign_seq() == design_seq) {
//				String desTime = desDto.getDesign_time();
//				System.out.println("==========TestDesTiem:"+ desTime);
//			}
//			
//		}
		return resvTime;
	}
	
	@RequestMapping(value="shopResv.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopResv(Model model, int shop_seq) {
		
		
		System.out.println("===========shopSeq" + shop_seq);
		List<shopDesignerDto> designerList = shopService.getDesigner(shop_seq);
		shopDto shopDetail = shopService.getShopDetail(shop_seq);
		model.addAttribute("shopDetail", shopDetail);
		model.addAttribute("designerList", designerList);
		
		return "/shop/shopResv2";
	}
	
}
