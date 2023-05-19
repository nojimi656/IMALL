package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	
	//���� �ٿ�ε�
	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, 
			String originalFileName, String path) {
		
		try {
			
			String filePath = path + File.separator + saveFileName;
			
			if(originalFileName == null || originalFileName.equals("")) {
				
				originalFileName = saveFileName;
				
			}
			
			//�ѱ� �̸��� ���� �ٿ������ �ѱ۱��� ����
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1");
			
			File f = new File(filePath);
			
			if(!f.exists()) {
				
				return false;
				
			}
			
			//������ Ŭ���̾�Ʈ���� ������ ����
			response.setContentType("application/octet-stream");//~.~���� �����̾� �� octet-stream, ~.~�� �ƴ� ������ unknown-stream
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName);
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));//������ �о�鿩
			
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
	
	//���� ����
	
	public static void doFileDelete(String saveFileName, String path) {
		
		try {
			
			String filePath = path + File.separator + saveFileName;
			
			File f = new File(filePath);
			
			if(f.exists()) {
				
				f.delete(); //������ ���� ����
				
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		
	}
	
}



