package cd.com.a.serviceImpl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import cd.com.a.dao.MemberDao;
import cd.com.a.model.memberDto;
import cd.com.a.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Override
	public boolean idCheck(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.idCheck(dto);
	}
	@Override
	public boolean nickCheck(String nick_name) {
		// TODO Auto-generated method stub
		return memberDao.nickCheck(nick_name);
	}
	@Override
	public boolean newRegi(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.newRegi(dto);
	}
	@Override
	public memberDto login(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.login(dto);
	}
	@Override
	public String findId(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.findId(dto);
	}
	@Override
	public String findPwd(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.findPwd(dto);
	}
	@Override
	public memberDto resvMem(int mem_seq) {
		return memberDao.resvMem(mem_seq);
	}
	@Override
	public memberDto snsLogin(memberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.snsLogin(dto);
	}
	@Override
	public memberDto loginId(int mem_seq) {
		// TODO Auto-generated method stub
		return memberDao.loginId(mem_seq);
	}
	
	@Override
	public boolean snsFirstUpdate(memberDto dto) {
		return memberDao.snsFirstUpdate(dto);
	}
	@Override
	public boolean pwdCheck(memberDto dto) {
		return memberDao.pwdCheck(dto);
	}
	
	@Override
	public boolean userUpdate(memberDto dto) {
		if(dto.getUser_api()==0) {
			return memberDao.userUpdate(dto);
		}else {
			return memberDao.snsUserUpdate(dto);
		}
	}
	@Override
	public boolean sellerAccess(int mem_seq) {
		return memberDao.sellerAccess(mem_seq);
	}
	@Override
	public void memberEscape(int mem_seq) {
		memberDao.memberEscape(mem_seq);
	}
	
	@Override
	public boolean recoveryId(memberDto dto) {
		if(memberDao.recoveryCheck(dto)) {
			int mem_seq = memberDao.findSeq(dto);
			memberDao.recoveryId(mem_seq);
			return true;
		}else {
			return false;
		}
		
	}
	@Override
	public List<memberDto> getSellerAccessList() {
		return memberDao.getSellerAccessList();
	}
	@Override
	public boolean sellerAccessPass(int[] mem_seq) {
		return memberDao.sellerAccessPass(mem_seq);
	}
	@Override
	public boolean sellerAccessFail(int[] mem_seq) {
		return memberDao.sellerAccessFail(mem_seq);
	}
	
	// SNS Login
	@Override
	public String getAccessToken(String authorize_code,String loginApi) {
		String access_Token = "";
		String refresh_Token = "";
		String id_Token = "";
		String requestURL = "";
		if(loginApi.equals("kakao")) {
			 requestURL = "https://kauth.kakao.com/oauth/token";
		}else if(loginApi.equals("naver")) {
			requestURL = "https://nid.naver.com/oauth2.0/token";
		}else if(loginApi.equals("google")) {
			requestURL="https://accounts.google.com/o/oauth2/token";
		}
		try {
            URL url = new URL(requestURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
	            if(loginApi.equals("kakao")) {
	            	sb.append("&client_id=954754c02265363c5d9a6b60519b14d3");
	            	//sb.append("&redirect_uri=http://192.168.2.85:8080/CaxiDogi/kakaoLogin.do");
	            	sb.append("&redirect_uri=http://34.64.221.161:8080/CaxiDogi/kakaoLogin.do");
		   		}else if(loginApi.equals("naver")) {
		   			sb.append("&client_id=i11QdJzq8f_afJodIjCw");
		   			sb.append("&client_secret=QRK9UbfQ8z");
		   			sb.append("&redirect_uri=http://34.64.221.161:8080/CaxiDogi/naverLogin.do");
		   		}else if(loginApi.equals("google")) {
		   			sb.append("&client_id=957946411907-ufnltniu55q10le4b4io0tmrqgsbk8v1.apps.googleusercontent.com");
		   			sb.append("&client_secret=PEiSHOoKNHyUJyEel5J-eJwI");
		   			sb.append("&redirect_uri=http://localhost:8080/CaxiDogi/googleLogin.do");
		   		}
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("responsebody : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
        	refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
        	System.out.println("access_token : " + access_Token);
        	System.out.println("refresh_token : " + refresh_Token);
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return access_Token;
	}
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token,String loginApi) {
//	    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		    HashMap<String, Object> userInfo = new HashMap<>();
		    String reqURL = "";
		    if(loginApi.equals("kakao")) {
		    	reqURL = "https://kapi.kakao.com/v2/user/me";
			}else if(loginApi.equals("naver")) {
				reqURL = "https://openapi.naver.com/v1/nid/me";
			}else if(loginApi.equals("google")) {
				reqURL = "https://www.googleapis.com/oauth2/v1/userinfo?access_token="+access_Token;
			}
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        //    요청에 필요한 Header에 포함될 내용
		        if(loginApi.equals("google")) {
		        	System.out.println("conn="+conn);
		        }else {
		        	conn.setRequestMethod("POST");
		        	conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        }
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String line = "";
		        String result = "";
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println("response body : " + result);
		        JsonParser parser = new JsonParser();
		        JsonElement element = parser.parse(result);
		        JsonObject account = null;
		        String email="";
		        String nickName = "";
		        String name="";
		        String birthday="";
		        if(loginApi.equals("kakao")) {
		        	JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		        	account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
		        	nickName = properties.getAsJsonObject().get("nickname").getAsString();
		        	email = account.getAsJsonObject().get("email").getAsString();
		        	if(account.getAsJsonObject().get("has_birthday").getAsString().equals("true")) {
		        		birthday = account.getAsJsonObject().get("birthday").getAsString();
		        		userInfo.put("birthday",birthday);
		        	}
		        	userInfo.put("id", email);
		        	userInfo.put("nick_name", nickName);
		        	
				}else if(loginApi.equals("naver")) {
					account = element.getAsJsonObject().get("response").getAsJsonObject();
					nickName = account.getAsJsonObject().get("nickname").getAsString();
					birthday = account.getAsJsonObject().get("birthday").getAsString().replaceAll("-", "");
					name = account.getAsJsonObject().get("name").getAsString();
					email = account.getAsJsonObject().get("email").getAsString();
					userInfo.put("birthday", birthday);
					userInfo.put("user_name", name);
					userInfo.put("id", email);
			        userInfo.put("nick_name", nickName);
			        
				}else if(loginApi.equals("google")) {
					email = element.getAsJsonObject().get("email").getAsString();
					userInfo.put("id", email);
				}
		    } catch (IOException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		    return userInfo;
	}


}
