package com.util;

//����¡ó��
public class MyUtil2 {
	
	//��ü ������ ������ ���ϴ� �޼ҵ�
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount%numPerPage != 0) {
			pageCount++;
		}
		
		return pageCount;
	}
	
	
	//����¡ ��ũ
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //�����ϴ� �������� ����
		int currentPageSetup; //���� �������� ��ȣ(���簡 6~10�̸� ������������ 5)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			return "";
		}
		
		//listUrl
		//list.jsp //�׳� �ҽ�
		//list.jsp?searchKey=subject&seatchValue=suzi //�˻��ҽ�
		
		if(listUrl.indexOf("?")!=-1) { //�ڿ� ?,& �� ������ �����ϱ� ����
			listUrl += "&"; //?�� �ִٸ�
		}else {
			listUrl += "?"; //?�� ���ٸ�
		}
		
		//���� ������ ��ȣ ����
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		//���� �������� �������� ���������� ���� ū ���϶�
		//������� numPerBlock�� ����� �Ѵ�.
		if(currentPage % numPerBlock ==0) {
			currentPageSetup -= numPerBlock;
		}
		
		
		//������
		//��ü �������� ������ ������ ������ ũ��,
		//���� �������� 0���� Ŀ�߸� ���� ��ư�� ���� �� �ִ�
		//12>5 && 5>0 : ���������� �ʿ�, 12>5 && 0>0 : ���� ������ �ʿ� ����
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + 
					currentPageSetup + "\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">������<a/>nbsp;
			//\" : ����ǥ�� ����� ���� �ʰ�, ���� ��ü�� ����ǥ��� ǥ��
			//���� "<a�� ����ǥ�� ���̸� �ȵǹǷ� ������ ����
			// \">������ �� \"�� ���̴� ����ǥ
		}
		
		//�ٷΰ��� ������
		page = currentPageSetup + 1; //�������� ���� �������� +1
		
		//ǥ���� �������� ��ü ���������� �۾ƾ��ϰ�
		//������ �������� ������ŭ �����ֱ� ����
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
		
		//������
		//(��ü����������-������������ȣ)�� ������ �������� �������� Ŀ�߸� �Ѵ�
		//12-5>5 : ���� �������� �ʿ�, 8-5>5? ���� �������� �ʿ����
		if(totalPage-currentPageSetup>numPerBlock) {
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + 
					"\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">������</a>&nbsp;
		}
		
		return sb.toString();
		
	}
	
	
	
	
}










