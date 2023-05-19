package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	
	//파일 다운로드
	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, 
			String originalFileName, String path) {
		
		try {
			
			String filePath = path + File.separator + saveFileName;
			
			if(originalFileName == null || originalFileName.equals("")) {
				
				originalFileName = saveFileName;
				
			}
			
			//한글 이름의 파일 다운받을때 한글깨짐 방지
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1");
			
			File f = new File(filePath);
			
			if(!f.exists()) {
				
				return false;
				
			}
			
			//서버가 클라이언트에게 파일을 전송
			response.setContentType("application/octet-stream");//~.~같은 파일이야 가 octet-stream, ~.~이 아닌 파일은 unknown-stream
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName);
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));//서버가 읽어들여
			
			OutputStream os = response.getOutputStream();
			
			int data;
			byte[] buffer = new byte[4096];
			
			while((data=bis.read(buffer, 0, 4096))!=-1) {
				
				os.write(buffer,0,data);
				
			}
			
			os.flush();
			os.close();
			bis.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		
		return true;
		
	}
	
	//파일 삭제
	
	public static void doFileDelete(String saveFileName, String path) {
		
		try {
			
			String filePath = path + File.separator + saveFileName;
			
			File f = new File(filePath);
			
			if(f.exists()) {
				
				f.delete(); //물리적 파일 삭제
				
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		
	}
	
}



