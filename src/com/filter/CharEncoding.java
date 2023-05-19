package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class CharEncoding implements Filter{//�ڹڽ��� ����

	private String charset;
	
	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		String uri;
		
		if(request instanceof HttpServletRequest) {
			
			HttpServletRequest req = (HttpServletRequest)request;
			
			if(req.getMethod().equalsIgnoreCase("POST")) {
				//post������� request�� �Ѿ�ö� UTF-8�� �����Ѵ�
				req.setCharacterEncoding("UTF-8");
			}else {
				req.setCharacterEncoding(charset);
			}
		}
		
		chain.doFilter(request, response);
		
	}



	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

		charset = filterConfig.getInitParameter("charset");
		
		if(charset==null) {
			charset = "UTF-8";
		}
		
		
	
	}
	
	
	
	

}
