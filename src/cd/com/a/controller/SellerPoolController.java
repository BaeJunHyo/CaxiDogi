package cd.com.a.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import cd.com.a.model.memberDto;
import cd.com.a.model.poolDto;
import cd.com.a.model.poolParam;
import cd.com.a.model.poolResvParam;
import cd.com.a.service.MemberService;
import cd.com.a.service.PoolService;

@Controller
public class SellerPoolController {
	@Autowired
	PoolService poolService;
	
	@Autowired
	MemberService memService;
	
	/*  수영장 예약관련   */
	
	@RequestMapping(value="poolList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String poolList(HttpSession session, Model model, poolParam param) {
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		param.setMemSeq(mem.getMem_seq());
		
		// paging 처리
		int sn = param.getPageNumber();	// 0 1 2	현재 페이지
		int start = sn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (sn + 1) * param.getRecordCountPerPage();	// 10, 20, 30
		
		param.setStart(start);
		param.setEnd(end);
		int totalRecordCount = poolService.getPoolResvCount(param);
		
		List<poolResvParam> list = poolService.getSellerResvList(param);
		List<poolDto> poolList = poolService.getSellerPoolList(mem.getMem_seq());
		
		model.addAttribute("poolSellerResvList", list);
		model.addAttribute("poolList", poolList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("param",param);
		
		return "/smypage/pool/poolList";
	}
	
	@RequestMapping(value="sellerPoolList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String sellerPoolList(HttpSession session, Model model) {
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		List<poolDto> list = poolService.getSellerPoolList(mem.getMem_seq());
		model.addAttribute("poolList", list);
		
		return "/smypage/pool/sellerPoolList";
	}
	
	@RequestMapping(value="SellerResvDetail.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String getSellerResvDetail(Model model, int pool_resv_seq) {
		poolResvParam poolResv = poolService.getSellerResvDetail(pool_resv_seq);
		
		model.addAttribute("poolResv", poolResv);
		
		return "/smypage/pool/poolResvDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "setTotalPrice.do",method=RequestMethod.POST)
	public String setTotalPrice(poolResvParam poolResv){
		String str = "";
		boolean	status = poolService.setTotalPrice(poolResv);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value = "setPayment.do",method=RequestMethod.POST)
	public String setPayment(poolResvParam poolResv){
		String str = "";
		boolean	status = poolService.setPayment(poolResv);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}	
	
		
	@RequestMapping(value="poolTodayList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String poolTodayList(HttpSession session, Model model, poolParam param) {
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		param.setMemSeq(mem.getMem_seq());
		
		// paging 처리
		int sn = param.getPageNumber();	// 0 1 2	현재 페이지
		int start = sn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (sn + 1) * param.getRecordCountPerPage();	// 10, 20, 30
		
		param.setStart(start);
		param.setEnd(end);
		int totalRecordCount = poolService.getTodayResvCount(param);
		
		List<poolResvParam> list = poolService.getTodayResvList(param);
		List<poolDto> poolList = poolService.getSellerPoolList(mem.getMem_seq());
		
		model.addAttribute("poolSellerResvList", list);
		model.addAttribute("poolList", poolList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("param",param);
		
		return "/smypage/pool/poolTodayList";
	}
	
	@ResponseBody
	@RequestMapping(value = "poolUse.do",method=RequestMethod.POST)
	public String poolUse(int pool_resv_seq){
		String str = "";
		boolean	status = poolService.poolUse(pool_resv_seq);
		
		if(status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		
		return str;
	}

	/*  수영장 등록관련  */
	
	@RequestMapping(value="modifyPool.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String modifyPool(Model model, int pool_seq, HttpSession session) {
		poolDto pool = poolService.getPoolDetail(pool_seq);
		model.addAttribute("pool", pool);
		
		return "/smypage/pool/modify_pool";
	}
	
	@RequestMapping(value="reModifyPool.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String reModifyPool(Model model, int pool_seq, HttpSession session) {
		poolDto pool = poolService.getPoolDetail(pool_seq);
		model.addAttribute("pool", pool);
		
		return "/smypage/pool/re_modify_pool";
	}
	
	@RequestMapping(value="regiPool.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String regiPool(){
		return "/smypage/pool/regi_pool";
	}
	
	@RequestMapping(value="poolimageUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public String poolimageUpload(HttpServletRequest req, HttpServletResponse resp, 
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
						String uploadPath = req.getServletContext().getRealPath("/images/poolImg");
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
                        String fileUrl = req.getContextPath() + "/images/poolImg/" + fileName;
                        
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
	@RequestMapping(value = "poolRegiAf.do",method=RequestMethod.POST)
	   public String poolRegiAf(@ModelAttribute poolDto pool, @RequestParam(value="fileload")MultipartFile fileload, HttpServletRequest req){
		String str = "";
		
		if(!fileload.isEmpty()) {
			String fileUpload = req.getServletContext().getRealPath("/images/poolImg"); 
			System.out.println("fileUpload" + fileUpload); // 업로드 위치
			//System.out.println(fileUpload);
			String fileName = fileload.getOriginalFilename();
			String saveFileName = "";
			String filepost = "";
			if(fileName.indexOf('.') >= 0) { // 확장자 명이 있을때
				filepost = fileName.substring(fileName.indexOf('.'));
				saveFileName = new Date().getTime() + filepost;
			} 
			
			pool.setPool_photo(saveFileName);
			
			File file = new File(fileUpload + "/" + saveFileName);

			//실제 파일 업로드 되는 부분
			try {
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				System.out.println(pool.toString());
				//db저장
				boolean	status = poolService.addPool(pool);
			
				if(status == true) {
					str = "ok";
				} else {
					str = "no";
				}
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			pool.setPool_photo("default");
			boolean	status = poolService.addPool(pool);
			
			if(status == true) {
				str = "ok";
			} else {
				str = "no";
			}
		}
		
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value = "poolModifyAf.do",method=RequestMethod.POST)
	   public String poolModifyAf(@ModelAttribute poolDto pool, @RequestParam(value="fileload")MultipartFile fileload, HttpServletRequest req){
		String str = "";
		if(pool.getPool_auth() == 2) {
			pool.setPool_auth(4);
		}
		System.out.println(pool.toString());
		
		if(!fileload.isEmpty()) {
			String fileUpload = req.getServletContext().getRealPath("/images/poolImg"); 
			System.out.println("fileUpload" + fileUpload); // 업로드 위치
			//System.out.println(fileUpload);
			String fileName = fileload.getOriginalFilename();
			String saveFileName = "";
			String filepost = "";
			if(fileName.indexOf('.') >= 0) { // 확장자 명이 있을때
				filepost = fileName.substring(fileName.indexOf('.'));
				saveFileName = new Date().getTime() + filepost;
			} 
			pool.setPool_photo(saveFileName);
			
			File file = new File(fileUpload + "/" + saveFileName);

			//실제 파일 업로드 되는 부분
			try {
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				System.out.println(pool.toString());
				//db저장
				boolean	status = poolService.modifyPool(pool);
			
				if(status == true) {
					str = "ok";
				} else {
					str = "no";
				}
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			boolean	status = poolService.modifyPool(pool);
			
			if(status == true) {
				str = "ok";
			} else {
				str = "no";
			}
		}
		
		return str;
	}
}
