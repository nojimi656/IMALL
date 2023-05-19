package com.util;

//페이징처리
public class MyUtil2 {
	
	//전체 페이지 갯수를 구하는 메소드
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount%numPerPage != 0) {
			pageCount++;
		}
		
		return pageCount;
	}
	
	
	//페이징 링크
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //선택하는 페이지의 갯수
		int currentPageSetup; //이전 페이지의 번호(현재가 6~10이면 이전페이지는 5)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			return "";
		}
		
		//listUrl
		//list.jsp //그냥 할시
		//list.jsp?searchKey=subject&seatchValue=suzi //검색할시
		
		if(listUrl.indexOf("?")!=-1) { //뒤에 ?,& 뭘 붙일지 구분하기 위해
			listUrl += "&"; //?가 있다면
		}else {
			listUrl += "?"; //?가 없다면
		}
		
		//이전 페이지 번호 생성
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		//현재 페이지가 보여지는 페이지에서 가장 큰 값일때
		//결과값에 numPerBlock을 빼줘야 한다.
		if(currentPage % numPerBlock ==0) {
			currentPageSetup -= numPerBlock;
		}
		
		
		//◀이전
		//전체 페이지가 보여질 페이지 수보다 크고,
		//이전 페이지가 0보다 커야만 이전 버튼을 넣을 수 있다
		//12>5 && 5>0 : 이전페이지 필요, 12>5 && 0>0 : 이전 페이지 필요 없음
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + 
					currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">◀이전<a/>nbsp;
			//\" : 따옴표의 기능을 하지 않고, 글자 자체가 따옴표라는 표시
			//앞의 "<a의 따옴표와 엮이면 안되므로 저렇게 선언
			// \">◀이전 의 \"와 엮이는 따옴표
		}
		
		//바로가기 페이지
		page = currentPageSetup + 1; //시작점은 이전 페이지의 +1
		
		//표시할 페이지가 전체 페이지보다 작아야하고
		//설정한 페이지의 개수만큼 보여주기 위해
		while(page<=totalPage && page<=(currentPageSetup+numPerBlock)) {
			
			if(page == currentPage) {
				
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				//<font color="Fuchsia">6</font>&nbsp;
			}else {
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + 
						page + "</a>&nbsp;");
				//<a href=list.jsp?pageNum=7">7</a>&nbsp;
			}
			
			page++;
			
		}
		
		//다음▶
		//(전체페이지개수-이전페이지번호)가 설정한 페이지의 갯수보다 커야만 한다
		//12-5>5 : 다음 페이지가 필요, 8-5>5? 다음 페이지가 필요없다
		if(totalPage-currentPageSetup>numPerBlock) {
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + 
					"\">다음▶</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">다음▶</a>&nbsp;
		}
		
		return sb.toString();
		
	}
	
	
	
	
}










