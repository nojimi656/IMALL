package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class CharEncoding implements Filter{//자박스의 필터

	private String charset;
	
	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		String uri;
		
		if(request instanceof HttpServletRequest) {
			
			HttpServletRequest req = (HttpServletRequest)request;
			
			if(req.getMethod().equalsIgnoreCase("POST")) {
				//post방식으로 request가 넘어올때 UTF-8로 변경한다
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
