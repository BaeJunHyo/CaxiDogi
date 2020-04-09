package cd.com.a.util;

import java.util.Date;

public class FileUploadUtil {
	//myfile.txt => f.indexOf('.') -> 6
	//파일명, 확장자명
	//f.substring(6) -> .txt
	//f.substring (0, 6) -> myfile
	
	//myfile.txt -> 24223423423.txt
	
	public static String getNewFileName(String filename) {
		String saveFileName = "";
		String filepost = "";
		
		if(filename.indexOf('.') >= 0) { // 확장자 명이 있을때
			filepost = filename.substring(filename.indexOf('.'));
			saveFileName = new Date().getTime() + filepost;
		} else { // 확장자 명 없음
			saveFileName = new Date().getTime() + ".back";
		}
		return saveFileName;
	}
}
