package cd.com.a.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import cd.com.a.service.ShopService;
import cd.com.a.util.FileUploadUtil;

@Controller
public class ShopController {
	@Autowired
	ShopService shopService;
	
	@RequestMapping(value="shopRegi.do",  method= {RequestMethod.GET,RequestMethod.POST})
	public String shopRegi(HttpSession session) {
		
		memberDto mem = new memberDto(8);
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
						String uploadPath = req.getServletContext().getRealPath("/views/shop/uploadImg");
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
                        String fileUrl = req.getContextPath() + "/views/shop/uploadImg/" + fileName;
                        
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
	   public String multipartUpload(@ModelAttribute shopDto shop,@RequestParam(value="fileload")MultipartFile fileload, HttpServletRequest req){
	    System.out.println("file"+fileload.getOriginalFilename());

		//System.out.println(shop.toString());
		String fileUpload = req.getServletContext().getRealPath("/WEB-INF/views/shop/shopImage"); 
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
		String str = "";
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
		
		return str;
	}
	
}
