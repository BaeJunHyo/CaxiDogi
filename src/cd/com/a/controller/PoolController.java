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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;


import cd.com.a.model.memberDto;
import cd.com.a.model.poolDto;
import cd.com.a.model.poolResvDto;
import cd.com.a.model.shopDto;
import cd.com.a.service.MemberService;
import cd.com.a.service.PoolService;


@Controller
public class PoolController {
	@Autowired
	PoolService poolService;
	
	@Autowired
	MemberService memService;
	
	@RequestMapping(value="getPoolList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String getPoolList(Model model) {
		
		List<poolDto> poolList = poolService.getPoolList();
		model.addAttribute("poolList", poolList);
		return "/pool/pool_list";
	}
	
	@RequestMapping(value="sellerPoolList.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String sellerPoolList(HttpSession session, Model model) {
		memberDto mem = (memberDto)session.getAttribute("loginUser");
		System.out.println(mem.toString());
		List<poolDto> list = poolService.getSellerPoolList(mem.getMem_seq());
		model.addAttribute("poolList", list);
		
		return "/smypage/sellerPoolList";
	}
	
	@RequestMapping(value="poolDetail.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String getPoolDetail(Model model, int pool_seq, HttpSession session) {
		poolDto pool = poolService.getPoolDetail(pool_seq);
		model.addAttribute("pool", pool);
		
		return "/pool/pool_detail";
	}
	
	@RequestMapping(value="poolResvView.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String poolResvView(Model model, poolResvDto poolResv) {
		System.out.println("pool_seq : " + poolResv.toString());
		
		  poolDto pool = poolService.getPoolDetail(poolResv.getPool_seq()); 
		  memberDto mem = memService.resvMem(poolResv.getMem_seq());
		  poolResv.setPool_resv_name(mem.getUser_name());
		  poolResv.setPool_resv_tel(mem.getPhone());

		  model.addAttribute("pool", pool); model.addAttribute("poolResv", poolResv);
		 
		return "/pool/pool_resv";
	}
	
	
	@RequestMapping(value = "poolResvAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> poolResvAf(@ModelAttribute poolResvDto poolResv) {
		int	result = poolService.resvPool(poolResv);
		Map<String, Object> rmap = new HashMap<String, Object>();
		if(result != 0) {
			rmap.put("status", "ok");
			rmap.put("rnum", result);
		} else {
			rmap.put("status", "no");
		}
		return rmap;
	}
	
	@RequestMapping(value = "pool_reservation.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String poolReservation(int pool_resv_seq, Model model) {
		poolResvDto resv = poolService.getResvPool(pool_resv_seq);
		poolDto pool = poolService.getPoolDetail(resv.getPool_seq()); 
		model.addAttribute("pool_resv", resv);
		model.addAttribute("pool", pool);
		return "/pool/pool_resv_detail";
	}
	
	@RequestMapping(value="regiPool.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String regiPool(){
		return "/smypage/regi_pool";
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
	   public String multipartUpload(@ModelAttribute poolDto pool, @RequestParam(value="fileload")MultipartFile fileload, HttpServletRequest req){
		String str = "";
		
		System.out.println(pool.toString());
		
		if(!fileload.isEmpty()) {
			String fileUpload = req.getServletContext().getRealPath("/images/poolImg"); 
			System.out.println("fileUpload" + fileUpload); 
			//System.out.println(fileUpload);
			String fileName = fileload.getOriginalFilename();
			String saveFileName = "";
			String filepost = "";
			if(fileName.indexOf('.') >= 0) { 
				filepost = fileName.substring(fileName.indexOf('.'));
				saveFileName = new Date().getTime() + filepost;
			} 
			pool.setPool_photo(saveFileName);
			
			File file = new File(fileUpload + "/" + saveFileName);

			
			try {
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				
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
}
