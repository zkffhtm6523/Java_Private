package com.allWebtoon.api;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.BufferedReader;

public class GoogleAPI2 {
	public static String getAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://accounts.google.com/o/oauth2/v2/auth"; 
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("&response_type=token");
			sb.append("&scope = https % 3A // www.googleapis.com / auth / drive.metadata.readonly");
			sb.append("&client_id=659641044041-d8d9d26ubldu5veldv2g3cqaqedv6htq.apps.googleusercontent.com");
			sb.append("&client_secret=LxGdpTGyFqWFj3AT1167xbvF");
			sb.append("&state=state_parameter_passthrough_value");
			sb.append("&redirect_uri=http://localhost:8089/login?platNo=3");
			sb.append("&code=" + code);
			sb.append("&grant_type=authorization_code");
            bw.write(sb.toString());
            bw.flush();
            System.out.println("결과 200전");
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            
            
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
	public static HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
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
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
	        String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
	        String thumbnail_image = properties.getAsJsonObject().get("thumbnail_image").getAsString();
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        userInfo.put("profile_image", profile_image);
	        userInfo.put("thumbnail_image", thumbnail_image);
	        userInfo.put("birthday", birthday);
	        userInfo.put("gender", gender);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
}
