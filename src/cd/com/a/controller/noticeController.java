package cd.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import cd.com.a.model.admin_noticeDto;
import cd.com.a.service.admin_noticeService;
import cd.com.a.util.FileUploadUtil;

@Controller
public class noticeController {

	@Autowired
	admin_noticeService noticeService;


	@RequestMapping(value="adminNotice.do", method=RequestMethod.GET)
	public String adminNotice(Model model)	{

		return "admin/notice/notice_main";
	}



	@GetMapping(value="adminNoticeWrite.do")
	public String write_get() {
		//
		return "admin/notice/notice_insert2";
	}
	
	@PostMapping(value="adminNoticeWriteAf.do", consumes ={"multipart/form-data"})
	@ResponseBody
	//@ModelAttribute 자동으로 dto로 넣어준다
	//@RequestParam(value="ajaxContents",required=false) String contents,
	//@RequestParam(value="title", required=false) String title,
	public String writeAf(
				@ModelAttribute admin_noticeDto adminNoticeDto,
				@RequestParam(value = "files", required=false)MultipartFile[] files,
				MultipartHttpServletRequest req) {



		System.out.println("toString = " + adminNoticeDto.toString());

		//DB에 보관할 문자열을 만들 변수 선언
		String server_filename = "";
		String filename = "";
		boolean isError = true;

		//파일 업로드 경로 설정
		String fupload = req.getSession().getServletContext().getRealPath("/");
		fupload += "upload\\notice";
		System.out.println("upload 경로 = " + fupload);

		// filename 취득
		System.out.println("files size = " + files.length);

		for(int i = 0; i < files.length; i++) {

			if(files[i].getOriginalFilename() != null && files[i].getOriginalFilename() != "") {
				System.out.println("i = " + i + "   fileName = " + files[i].getOriginalFilename());

				filename += "" + files[i].getOriginalFilename() + "&";
				String newFileName = FileUploadUtil.getNewFileName(files[i].getOriginalFilename());
				server_filename += newFileName + "&";

				//파일 생성
				File file = new File(fupload + "/" + newFileName);

				//파일 업로드
				try {
					FileUtils.writeByteArrayToFile(file, files[i].getBytes());
					System.out.println("파일 업로드!");
				} catch (IOException e) {
					System.out.println("noticeController / writeAf.do method / FileUtils error");
					isError = false;
					e.printStackTrace();
					return String.valueOf(isError);
				}

			}

		}


		/* 업로드 파일 확인용 코드
		try {

			File file2 = new File(fupload + "/" + "1586769707808.txt");

			Scanner scan = new Scanner(file2);

			while(scan.hasNextLine()) {
				System.out.println(scan.nextLine());
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/

		if(filename.length() > 0) {
			//마지막 '&' 제거
			filename = filename.substring(0, filename.length()-1);
			server_filename = server_filename.substring(0, server_filename.length()-1);
		}
		System.out.println("origin FileName = " + filename);
		System.out.println("server FileName = " + server_filename);

		adminNoticeDto.setNotice_filename(filename);
		adminNoticeDto.setNotice_server_filename(server_filename);

		System.out.println("모든 업로드 종료 후 dto 확인  = " + adminNoticeDto.toString());

		isError = noticeService.notice_insert(adminNoticeDto);

		return String.valueOf(isError);
	}



}
