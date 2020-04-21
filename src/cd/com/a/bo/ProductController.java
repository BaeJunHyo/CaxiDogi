package cd.com.a.bo;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.GenericServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import cd.com.a.model.ProductParam;
import cd.com.a.model.productDto;
import cd.com.a.util.FileUploadUtil;

@Controller
public class ProductController {

	@Autowired
	ProductService service;
	SqlSession sqlSession;
	
	
//	@RequestMapping(value = "test.do")
//	public String test() {
//		return "member/test";
//	}
	
	
	@RequestMapping(value="productList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String productlist(Model model, ProductParam prdparam) {
//		Gson gson = new Gson();
//		List<productDto> prdlist = new ArrayList<productDto>();
//		System.out.println("productList : " + prdlist);
		List<productDto> prdlist = service.prdSearchList(prdparam);
		
		model.addAttribute("prdlist", prdlist);
		
		model.addAttribute("s_category", prdparam.getS_category());
		model.addAttribute("s_keyword", prdparam.getS_keyword());
		
		return "/bo/bo_02product_1";
	}
	
	
	@RequestMapping(value="productInsert.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String productWrite(Model model) {
		return "/bo/bo_02product_2_regi";
	}
	
	
	@RequestMapping(value="productInsertAf.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String productInsert( @ModelAttribute productDto product, @RequestParam(value="fileUpload", required=false)MultipartFile fileUpload,
			HttpServletRequest req) {
		
//		String filename="";
//		
//		if(!dto.getProduct_img().isEmpty()) {
//			filename = dto.getProduct_img().get
//		}
		

				
//		System.out.println("상품명(product_name) : " + product_name + " " +
//				"상품코드(product_code) : " + product_code + " " +
//				"상품가격(product_price) : " + product_price + " " +
//				"상품구분(product_group) : " + product_group + " " +
//				"상품종류(product_sub_group) : " + product_sub_group);
		
		//productDto dto = new productDto();
		
		
		String filename = fileUpload.getOriginalFilename();
		System.out.println(filename);
//		product.setProduct_group(sproduct_group);
//		product.setProduct_sub_group(sproduct_sub_group);
//		product.setProduct_price(sproduct_price);
//		product.setProduct_code(product_code);
//		product.setProduct_content(product_content);
//		product.setProduct_name(product_name);
		
		System.out.println(product.toString());
		
		
		// upload경로 설정
		String fupload = req.getServletContext().getRealPath("upload/boUpload");
		
		System.out.println("controller fupload : " + fupload);
		
		// 파일명 변경
		String newFileName = FileUploadUtil.getNewFileName(fileUpload.getOriginalFilename());
		product.setProduct_img(newFileName);
		
		File productFile = new File(fupload + "/" + newFileName);
		
		
		// DB저장
		try {
			FileUtils.writeByteArrayToFile(productFile, fileUpload.getBytes());
			
			//service.productInsert(dto);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	
		boolean b = service.productInsert(product);
		
		if(b) {
			System.out.println("상품등록 성공");
			return "redirect:/productList.do";
		}
		else {
			System.out.println("실패");
			return "redirect:/productInsertAf.do";
		}
		
	}
	
	@RequestMapping(value="boimageUpload.do", method=RequestMethod.POST)
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
		                String uploadPath = req.getServletContext().getRealPath("/upload/boUpload");
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
						String fileUrl = req.getContextPath() + "/upload/boUpload/" + fileName;
                        
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
	
	
	
	
	
}
