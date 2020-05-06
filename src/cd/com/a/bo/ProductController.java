package cd.com.a.bo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.google.gson.JsonObject;

import cd.com.a.model.ProductParam;
import cd.com.a.model.productDto;
import cd.com.a.util.FileUploadUtil;

@Controller
public class ProductController {

	@Autowired
	ProductService prdService;
	SqlSession sqlSession;
	
	
	
	@RequestMapping(value="productList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String productlist(Model model, ProductParam prdparam) {
		
		// paging 처리
		int pageNumber = prdparam.getPageNumber();	// 0 1 2	현재 페이지
		int start = pageNumber * prdparam.getRecordCountPerPage(); // 1, 11, 21
		int end = (pageNumber + 1) * prdparam.getRecordCountPerPage();	// 10, 20, 30
		
		prdparam.setStart(start);
		prdparam.setEnd(end);
		
		System.out.println("prdparam = " + prdparam.toString());
		List<productDto> prdlist = prdService.prdSearchList(prdparam);
		//System.out.println("productList : " + prdlist);
		
		// count > 글의 총 수
		int totalRecordCount = prdService.getPrdCount(prdparam);
		
		model.addAttribute("prdlist", prdlist);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", prdparam.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		model.addAttribute("s_category", prdparam.getS_category());
		model.addAttribute("s_keyword", prdparam.getS_keyword());
		//model.addAttribute("product_group", prdparam.getProductGroup());
		//model.addAttribute("product_sub_group", prdparam.getProductSubGroup());
		//model.addAttribute("s_soldState", prdparam.getS_soldState());
		model.addAttribute("sorting", prdparam.getSorting());
		model.addAttribute("countList", prdparam.getCountList());
		model.addAttribute("prdparam", prdparam);
		
		
		
		return "/bo/product/bo_02product_1";
	}
	
	
	@RequestMapping(value="productInsert.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String productWrite(Model model) {
		return "/bo/product/bo_02product_2_regi";
	}
	
	
	@RequestMapping(value="productInsertAf.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String productInsert( @ModelAttribute productDto product, @RequestParam(value="fileUpload", required=false)MultipartFile fileUpload,
			HttpServletRequest req) {
		
//		String filename="";
//		
//		if(!dto.getProduct_img().isEmpty()) {
//			filename = dto.getProduct_img().get
//		}
		
		String filename = fileUpload.getOriginalFilename();
		System.out.println(filename);
		
		System.out.println(product.toString());
		
		
		// upload경로 설정
		String fupload = req.getServletContext().getRealPath("/images/goodsImg");
		
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
		
	
		boolean b = prdService.productInsert(product);
		
		if(b) {
			System.out.println("상품등록 성공");
			return "redirect:/productList.do";
		}
		else {
			System.out.println("실패");
			return "redirect:/productInsertAf.do";
		}
		
	}
	
	@RequestMapping(value="boimageUpload.do",  method = {RequestMethod.POST, RequestMethod.GET})
	public String boimageUpload(HttpServletRequest req, HttpServletResponse resp, 
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
		                String uploadPath = req.getServletContext().getRealPath("/images/goodsImg");
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
						String fileUrl = req.getContextPath() + "/images/goodsImg/" + fileName;
                        
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
	
	
	@RequestMapping(value="productUpdate.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String productUpdate(int product_num, Model model) {
		productDto prddto = prdService.getPrd(product_num);
		System.out.println("업데이트페이지 들어오면서 갖고온 dto : " + prddto);
		
		model.addAttribute("prddto", prddto);
		return "/bo/product/bo_02product_3_update";
	}
	
	
	@ResponseBody
	@RequestMapping(value="productUpdateAf.do", method= RequestMethod.POST)
	public String productUpdateAf(@ModelAttribute productDto product, Model model, 
			@RequestParam(value="fileUpload", required=false)MultipartFile fileUpload,
			HttpServletRequest req) {
		String str = "";
		System.out.println("pro : " + product.toString());
		
		// 파일 업로드
		if(!fileUpload.isEmpty()) {
			
			// upload경로 설정
			String fupload = req.getServletContext().getRealPath("/images/goodsImg");
			// 업로드 위치
			System.out.println("productUpdateAf controller fupload : " + fupload);
			
			// 파일명 변경
			String newFileName = FileUploadUtil.getNewFileName(fileUpload.getOriginalFilename());
			product.setProduct_img(newFileName);
			
			File productFile = new File(fupload + "/" + newFileName);
			
			
			// 실제 파일 업로드 되는 부분
			try {
				FileUtils.writeByteArrayToFile(productFile, fileUpload.getBytes());
				System.out.println(product.toString());
				
				// DB저장
				boolean status = prdService.prdUpdate(product);
				
				if(status == true) {
					str = "ok";
					
				} else {
					str = "no";
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			// 
		} else {
			boolean status = prdService.prdUpdate(product);
			
			if(status == true) {
				str = "ok";
			} else {
				str = "on";
			}
		}
		
		return str;
//		prdService.prdUpdate(product);
//		
//		model.addAttribute("product", product);
//		
//		return "redirect:/productList.do";
	}
	
	
	@ResponseBody
	@RequestMapping(value="deletePrd.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String prdDelete(HttpSession session, productDto prddto, Model model, 
		     @RequestParam(value = "chbox[]") int[] product_num) throws Exception {
		
		System.out.println("--------" + product_num[0]);
		
		boolean result = prdService.prdDelete(product_num);
		
		if(result) {
			return "success";
		}else {
			return "fail";
		}
		
//		int result = 0;
//		int prdNum = 0;
//		
//		for(String i : chArr) {
//			prdNum = Integer.parseInt(i);
//			prddto.setProduct_num(prdNum);
//			prdService.prdDelete(prddto);
//		}
//		//productDto prddto = prdService.prdDelete(product_num);
//		
//		//model.addAttribute("prddto", prddto);
//		
//		return result;
//	}
	
	}
	
}
