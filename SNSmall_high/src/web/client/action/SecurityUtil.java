package web.client.action;

import java.security.*;

public class SecurityUtil {

    public String encryptSHA256(String str){

    	String sha = ""; 

    	try{
    		//MessageDigest 인스턴스 생성
    		MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
    		//해쉬값 업데이트
    		sh.update(str.getBytes()); 
    		//해쉬값(다이제스트) 얻기
    		byte byteData[] = sh.digest();
    		
    		StringBuffer sb = new StringBuffer();

    		//출력: 해쉬값을 16진수로 표현한 문자로 변환
    		for(int i = 0 ; i < byteData.length ; i++){
    			sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
    		}

    		sha = sb.toString();

    	}catch(NoSuchAlgorithmException e){
    		//e.printStackTrace(); 
    		System.out.println("Encrypt Error - NoSuchAlgorithmException");
    		sha = null; 
    	}
    	return sha;
    }	
}
