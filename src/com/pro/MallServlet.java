package com.pro;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bag.bagDAO;
import com.bag.bagDTO;
import com.goods.GoodsDAO;
import com.goods.GoodsDTO;
import com.login.CustomInfo;
import com.login.LoginDAO;
import com.login.LoginDTO;
import com.util.FileManager;
import com.util.MyUtil;
import com.util.PJConn;

public class MallServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp,String url) 
			throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Connection conn = PJConn.getConnection();
		LoginDAO lodao = new LoginDAO(conn);
		bagDAO bgdao = new bagDAO(conn);
		GoodsDAO godao = new GoodsDAO(conn);
		MyUtil myUtil = new MyUtil();

		String cp = req.getContextPath(); // /mall �� ����ִ�

		String uri = req.getRequestURI(); // �Ѿ�� �ּ��� ������

		String url;

		if(uri.indexOf("created.do")!=-1) {//ȸ������ ��ư Ŭ��

			url = "/imal/created.jsp";
			forward(req,resp,url);

		}else if(uri.indexOf("created_ok.do")!=-1) {//���ԿϷ� ��ư Ŭ��

			LoginDTO lodto = new LoginDTO();

			String userBirth=req.getParameter("yy") + "-" + req.getParameter("mm") + "-" + req.getParameter("dd");
			String userAddr=req.getParameter("userAddr") + "-" + req.getParameter("userAddr_detail");

			lodto.setUserId(req.getParameter("userId"));
			lodto.setUserPwd(req.getParameter("userPwd"));
			lodto.setUserName(req.getParameter("userName"));
			lodto.setUserBirth(userBirth);
			lodto.setUserTel(req.getParameter("userTel"));
			lodto.setUserAddr(userAddr);

			lodao.insertData(lodto);

			url = cp +"/itmall/login.do";
			resp.sendRedirect(url);

		}else if (uri.indexOf("login.do")!=-1) {//�α��� ����������	

			url = "/imal/login.jsp";
			forward(req,resp,url);

		}else if (uri.indexOf("login_ok.do")!=-1) {//�α��� �����Ͱ˻��� �̵�

			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");


			LoginDTO lodto = lodao.getReadData(userId);


			if(lodto==null || (!lodto.getUserPwd().equals(userPwd))) {

				req.setAttribute("message", "���̵� �Ǵ� �н����带 Ȯ�����ּ���.");

				url = "/imal/login.jsp";
				forward(req, resp, url);
				return;
			}

			CustomInfo info = new CustomInfo();

			info.setUserId(lodto.getUserId());
			info.setUserName(lodto.getUserName());

			HttpSession session = req.getSession(); //re������ ������ ���ǻ���

			session.setAttribute("customInfo", info);

			url = cp +"/itmall/main.do";
			resp.sendRedirect(url);

		}else if (uri.indexOf("logout.do")!=-1) {//�α׾ƿ�	

			HttpSession session = req.getSession();

			session.removeAttribute("customInfo");
			session.invalidate();

			url = cp + "/itmall/main.do";
			resp.sendRedirect(url);


		}else if (uri.indexOf("main.do")!=-1) {

			url = "/imal/main.jsp";
			forward(req,resp,url);

		}else if (uri.indexOf("searchId.do")!=-1) {//���̵�ã��

			url ="/imal/searchId.jsp";
			forward(req, resp, url);

		}else if (uri.indexOf("searchId_ok.do")!=-1) {//���̵� ã�� ������ �˻�

			String userBirth = req.getParameter("yy") + "-" + req.getParameter("mm") + "-" + req.getParameter("dd");
			String userName = req.getParameter("userName");
			String userTel = req.getParameter("userTel");
			
			LoginDTO lodto = lodao.getReadData(userTel, userName, userBirth);
			
			if (lodto==null || lodto.getUserTel().equals("")) {

				req.setAttribute("message","ȸ�������� ���������ʽ��ϴ�.");

				url = "/imal/login.jsp";
				forward(req, resp, url);	
				return;
			}

			String msg = "���̵�� " + lodto.getUserId() +" �Դϴ�";
			req.setAttribute("message", msg);

			url = "/imal/login.jsp";;
			forward(req, resp, url);
			return;

		}else if (uri.indexOf("searchPwd.do")!=-1) {//��й�ȣ ã��	

			url ="/imal/searchPwd.jsp";
			forward(req, resp, url);


		}else if (uri.indexOf("searchPwd_ok.do")!=-1) {//��й�ȣ ã�� ������ �˻�	

			String userId = req.getParameter("userId");
			String userBirth = req.getParameter("yy") + "-" + req.getParameter("mm") + "-" + req.getParameter("dd");
			String userName = req.getParameter("userName");
			String userTel = req.getParameter("userTel");


			LoginDTO lodto = lodao.getReadData(userTel, userName, userBirth, userId);

			if (lodto==null || lodto.getUserId().equals("")) {

				req.setAttribute("message","ȸ�������� ���������ʽ��ϴ�.");

				url = "/imal/login.jsp";
				forward(req, resp, url);	
				return;
			}

			String msg = "��й�ȣ�� " + lodto.getUserPwd() +" �Դϴ�";
			req.setAttribute("message", msg);


			url = "/imal/login.jsp";;
			forward(req, resp, url);
			return;


		}else if(uri.indexOf("idCheckForm.do")!=-1) {//���̵� �ߺ�üũ�� �̵�

			url ="/imal/idCheckForm.jsp";
			forward(req, resp, url);

		}else if (uri.indexOf("idCheckPro.do")!=-1) {//���̵� �ߺ�üũ�� ������ �޾ƿ���

			url ="/imal/idCheckPro.jsp";
			forward(req, resp, url);


		}else if (uri.indexOf("updated.do")!=-1) {//ȸ������ ����

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");

			if(info==null) {

				req.setAttribute("message","ȸ�������� ���������ʽ��ϴ�.");

				url = "/imal/login.jsp";
				forward(req, resp, url);
				return;
			}

			LoginDTO lodto = lodao.getReadData(info.getUserId());

			req.setAttribute("lodto", lodto);

			url = "/imal/updated.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("updated_ok.do")!=-1){


			LoginDTO lodto = new LoginDTO();

			String userAddr=req.getParameter("userAddr") + "-" + req.getParameter("userAddr_detail");
			String userBirth = req.getParameter("yy") + "-" + req.getParameter("mm") + "-" + req.getParameter("dd");

			lodto.setUserId(req.getParameter("userId"));
			lodto.setUserPwd(req.getParameter("userPwd"));
			lodto.setUserName(req.getParameter("userName"));
			lodto.setUserBirth(userBirth);
			lodto.setUserTel(req.getParameter("userTel"));
			lodto.setUserAddr(userAddr);



			lodao.updateData(lodto);

			url = cp + "/itmall/main.do";
			resp.sendRedirect(url);



		}else if(uri.indexOf("goodslist.do")!=-1) {

			//ī�װ������� get������� ī�װ� �����͸� �޾ƿ�
			//ī�װ��� ��ǰ�� ���
			//test��
			//���� ���� ���
			String root = getServletContext().getRealPath("/");
			String path = root + "pds" + File.separator + "test";
			File f = new File(path);

			GoodsDAO dao = new GoodsDAO(conn);//GoodsDAO���Ŵϱ�


			//ī�װ��� �˻�

			String cate = req.getParameter("cate");//ī�װ� ���� �����Ͱ��� �ٸ�

			if(!f.exists()) {

				f.mkdirs();

			}

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if(pageNum!=null) {

				currentPage = Integer.parseInt(pageNum);

			}


			int dataCount = dao.getCateCount(cate);

			int numPerPage = 9;

			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage>totalPage) {

				currentPage = totalPage;

			}

			int start = (currentPage-1)*numPerPage+1;

			int end = (currentPage*numPerPage);

			List<GoodsDTO> lists = dao.getLists(start, end, cate);//cate ���� �����͵� select


			String param = "";
			if(cate!=null && !cate.equals("")) {

				param = "cate=" + cate;

			}

			String listUrl = cp + "/itmall/goodslist.do";

			if(!param.equals("")) {

				listUrl += "?" + param;

			}

			String pageIndexList =
					myUtil.pageIndexList(currentPage, totalPage, listUrl);

			String deletePath = cp + "/itmall/delete.do";//���� �ּ� �ٲ�� �ٲ���ߵ�
			String imagePath = cp + "/pds/test";
			req.setAttribute("imagePath", imagePath);

			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);



			req.setAttribute("deletePath", deletePath);

			url = "/imal/goodslist.jsp"; //forward�� ��� �ּҴ� ���� test�̱� ������ ���߿� �����Ҷ� �ٲ�ߵ�
			forward(req, resp, url);

		}else if(uri.indexOf("goodslist2.do")!=-1) {

			String root = getServletContext().getRealPath("/");
			String path = root + "pds" + File.separator + "test";
			File f = new File(path);

			//GoodsDAO���Ŵϱ�


			//searchValue�� �˻�

			String searchValue = req.getParameter("searchValue");//ī�װ� ���� �����Ͱ��� �ٸ�

			if(!f.exists()) {

				f.mkdirs();

			}

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if(pageNum!=null) {

				currentPage = Integer.parseInt(pageNum);

			}


			int dataCount = godao.getDataCount(searchValue);

			int numPerPage = 9;

			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage>totalPage) {

				currentPage = totalPage;

			}

			int start = (currentPage-1)*numPerPage+1;

			int end = (currentPage*numPerPage);

			List<GoodsDTO> lists = godao.getLists2(start, end, searchValue);


			String param = "";
			if(searchValue!=null && !searchValue.equals("")) {

				param = "searchValue=" + searchValue;

			}

			String listUrl = cp + "/itmall/goodslist2.do";

			if(!param.equals("")) {

				listUrl += "?" + param;

			}

			String pageIndexList =
					myUtil.pageIndexList(currentPage, totalPage, listUrl);

			String deletePath = cp + "/itmall/delete.do";//���� �ּ� �ٲ�� �ٲ���ߵ�
			String imagePath = cp + "/pds/test";
			req.setAttribute("imagePath", imagePath);

			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);

			req.setAttribute("deletePath", deletePath);

			//��ϵ� ������ ������ searchValue�� �������� �ʽ��ϴ� �̷��� ������
			req.setAttribute("searchValue", searchValue);

			url = "/imal/goodslist.jsp"; //forward�� ��� �ּҴ� ���� test�̱� ������ ���߿� �����Ҷ� �ٲ�ߵ�
			forward(req, resp, url);



		}else if(uri.indexOf("goodslist3.do")!=-1) {//ī�װ� ���յȰɷ� �����ð��� ���� ���� ��Ŷ
			
			String root = getServletContext().getRealPath("/");
			String path = root + "pds" + File.separator + "test";
			File f = new File(path);

			GoodsDAO dao = new GoodsDAO(conn);//GoodsDAO���Ŵϱ�


			//ī�װ��� �˻�

			String jacket = req.getParameter("cate");//jacket
			String top = req.getParameter("cate1");//����
			String bottom = req.getParameter("cate2");//����

			if(!f.exists()) {

				f.mkdirs();

			}

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if(pageNum!=null) {

				currentPage = Integer.parseInt(pageNum);

			}


			int dataCount1 = dao.getCateCount(jacket); //jacket
			int dataCount2 = dao.getCateCount(top); //top
			int dataCount3 = dao.getCateCount(bottom); //bottom
			
			int dataCount = dataCount1 + dataCount2 + dataCount3;

			int numPerPage = 9;

			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage>totalPage) {

				currentPage = totalPage;

			}

			int start = (currentPage-1)*numPerPage+1;

			int end = (currentPage*numPerPage);

			List<GoodsDTO> lists = dao.getLists(start, end, jacket,top,bottom);//cate ���� �����͵� select


			String param = "";
			if(jacket!=null && !jacket.equals("")) {

				param = "cate=" + jacket + "&cate1=" + top + "&cate2=" + bottom;

			}

			String listUrl = cp + "/itmall/goodslist3.do";

			if(!param.equals("")) {

				listUrl += "?" + param;

			}

			String pageIndexList =
					myUtil.pageIndexList(currentPage, totalPage, listUrl);

			String deletePath = cp + "/itmall/delete.do";//���� �ּ� �ٲ�� �ٲ���ߵ�
			String imagePath = cp + "/pds/test";
			req.setAttribute("imagePath", imagePath);

			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);



			req.setAttribute("deletePath", deletePath);

			url = "/imal/goodslist.jsp"; //forward�� ��� �ּҴ� ���� test�̱� ������ ���߿� �����Ҷ� �ٲ�ߵ�
			forward(req, resp, url);
			
			
			
		}else if(uri.indexOf("goodslist4.do")!=-1) {//ī�װ� ���յȰɷ� �����ð��� �Ǽ��縮
			
			String root = getServletContext().getRealPath("/");
			String path = root + "pds" + File.separator + "test";
			File f = new File(path);

			GoodsDAO dao = new GoodsDAO(conn);//GoodsDAO���Ŵϱ�


			//ī�װ��� �˻�

			String watch = req.getParameter("cate");//watch
			String cap = req.getParameter("cate1");//cap
			String socks = req.getParameter("cate2");//socks
			String wallet = req.getParameter("cate3");//wallet
			String belt = req.getParameter("cate4");//belt

			if(!f.exists()) {

				f.mkdirs();

			}

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if(pageNum!=null) {

				currentPage = Integer.parseInt(pageNum);

			}


			int dataCount1 = dao.getCateCount(watch); //watch
			int dataCount2 = dao.getCateCount(cap); //cap
			int dataCount3 = dao.getCateCount(socks); //socks
			int dataCount4 = dao.getCateCount(wallet); //wallet
			int dataCount5 = dao.getCateCount(belt); //belt
			
			int dataCount = dataCount1 + dataCount2 + dataCount3 + dataCount4 + dataCount5;

			int numPerPage = 9;

			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage>totalPage) {

				currentPage = totalPage;

			}

			int start = (currentPage-1)*numPerPage+1;

			int end = (currentPage*numPerPage);

			List<GoodsDTO> lists = dao.getLists(start, end, watch,cap,socks,wallet,belt);//cate ���� �����͵� select


			String param = "";
			if(watch!=null && !watch.equals("")) {

				param = "cate=" + watch + "&cate1=" + cap + "&cate2=" + socks;
				param+= "&cate3=" + wallet + "&cate4=" + belt;

			}

			String listUrl = cp + "/itmall/goodslist4.do";

			if(!param.equals("")) {

				listUrl += "?" + param;

			}

			String pageIndexList =
					myUtil.pageIndexList(currentPage, totalPage, listUrl);

			String deletePath = cp + "/itmall/delete.do";//���� �ּ� �ٲ�� �ٲ���ߵ�
			String imagePath = cp + "/pds/test";
			req.setAttribute("imagePath", imagePath);

			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);



			req.setAttribute("deletePath", deletePath);

			url = "/imal/goodslist.jsp"; //forward�� ��� �ּҴ� ���� test�̱� ������ ���߿� �����Ҷ� �ٲ�ߵ�
			forward(req, resp, url);
			
			
			
		}else if(uri.indexOf("article.do")!=-1) {

			String root = getServletContext().getRealPath("/");
			String path = root + "pds" + File.separator + "test";
			File f = new File(path);

			int goods_num = Integer.parseInt(req.getParameter("goods_num"));

			if(!f.exists()) {

				f.mkdirs();

			}

			GoodsDTO dto = godao.getReadData(goods_num);

			req.setAttribute("dto", dto);

			String imagePath = cp + "/pds/test";
			req.setAttribute("imagePath", imagePath);

			url ="/imal/article.jsp";
			forward(req, resp, url);


		}else if(uri.indexOf("mybag.do")!=-1) {//��ٱ��Ϸ� �̵�

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");

			int bagCount = bgdao.bagCount(info.getUserId());
			List<bagDTO> lists = bgdao.allBagData(info.getUserId());

			req.setAttribute("bagCount", bagCount);
			req.setAttribute("lists", lists);

			url = "/imal/bagtest.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("bag_del.do")!=-1) {//��ٱ��� üũ������ ����
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");

			String goods_num[] = req.getParameterValues("check");

			for(String data : goods_num) {
				int num = Integer.parseInt(data);

				bgdao.deleteData(info.getUserId(), num);
			}

			url = cp + "/itmall/mybag.do";
			resp.sendRedirect(url);

		}else if(uri.indexOf("payment.do")!=-1) {//������������ �̵�

			int totalPrice=0;
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");

			//üũ�ڽ��� value���� ��ǰ��ȣ�� �迭�� ����
			String goods_num[] = req.getParameterValues("check");

			//���߿� ���ǿ� ����� ����id�� ����dto ȣ�� ����
			LoginDTO lgdto = lodao.getReadData(info.getUserId());

			List<GoodsDTO> lists = new ArrayList<GoodsDTO>();

			Calendar cal = Calendar.getInstance();

			//�ý��� ���ڸ� �ҷ��� ��Ʋ�ķ� ������ ���������� ���
			cal.add(Calendar.DAY_OF_MONTH, 2);

			int month = cal.get(Calendar.MONTH) +1;
			int day = cal.get(Calendar.DAY_OF_MONTH);

			//�迭�� ���� üũ�ڽ� �����͸� Ȯ��for������ �ϳ����޾�
			//�������� int�� ����ȯ�ѵ� ��ǰ��ȣ�� dto������ ����ѵ� ����Ʈ�� ����
			for(String data : goods_num) {
				int num = Integer.parseInt(data);

				GoodsDTO dto = godao.getReadData(num);

				totalPrice += dto.getPrice();

				lists.add(dto);
			}

			req.setAttribute("lists", lists);
			req.setAttribute("month", month);
			req.setAttribute("day", day);
			req.setAttribute("lgdto", lgdto);
			req.setAttribute("totalPrice", totalPrice);

			url = "/imal/payment.jsp";

			forward(req, resp, url);

		}else if(uri.indexOf("payfinish.do")!=-1) {
			
			String days = "2023-" + req.getParameter("month") +"-"+req.getParameter("day");
			String userId = req.getParameter("userId");
			String ordeq = req.getParameter("ordeq");
			String goods_num[] = req.getParameterValues("goods_num");
			

			Calendar cal = Calendar.getInstance();
			int toYear = cal.get(Calendar.YEAR);
			int toMonth = cal.get(Calendar.MONTH)+1;
			int toDay = cal.get(Calendar.DAY_OF_MONTH);
		
			
//			for(String num : goods_num) {
//				
//				int gnum = Integer.parseInt(num);
//				
//				OrdersDTO dto = new OrdersDTO();
//				dto.setUserId(userId);
//				dto.setGoods_num(gnum);
//				dto.setDays(days);
//				dto.setOrdeq(ordeq);
//				
//				oddao.insertData(dto);
//				
//			}
			
			
			req.setAttribute("toYear", toYear);
			req.setAttribute("toMonth", toMonth);
			req.setAttribute("toDay", toDay);
			req.setAttribute("days", days);
			
			
			
			url = "/imal/payfinish.jsp";
			
			forward(req, resp, url);
			
		}else if(uri.indexOf("inMyBag.do")!=-1) {//��ٱ��Ͽ� ������ �߰�

            HttpSession session = req.getSession();
            CustomInfo info = (CustomInfo)session.getAttribute("customInfo");

            String gNum = req.getParameter("goods_num");

            int goods_num = Integer.parseInt(gNum);
            
            GoodsDTO dto = godao.getReadData(goods_num);
            
            bgdao.insertData(info.getUserId(), dto);
 
            url = cp + "/itmall/article.do?goods_num=" + gNum;

            resp.sendRedirect(url);



        }else if(uri.indexOf("delete.do")!=-1) {//������ ������ �ҰŶ��
			
			String root = getServletContext().getRealPath("/");
			String path = root + "pds" + File.separator + "test";
			
			int goods_num = Integer.parseInt(req.getParameter("goods_num"));
			String pageNum = req.getParameter("pageNum");
		
			String before_address = req.getHeader("referer");//delete.do������ url������ ��, ¬�ּ� �״�� ������ http://~ goodslist?cate=cap&pageNum=7

			GoodsDTO dto = godao.getReadData(goods_num);
			String[] all_category = before_address.split("&");
			//all_category[0]�� �������
			
			String[] category = new String [all_category.length];

				for(int i=0;i<all_category.length;i++) {

					category[i] = all_category[i].substring(all_category[i].lastIndexOf("=")+1);
				}
			
			
			//������ ���ϸ��� �����ߵ�
			//FileManager.doFileDelete(dto.getSaveFilename(), path);
			
			//�ش�db���� �����ߵ�
			//godao.deleteData(goods_num);
			
			if(before_address.indexOf("goodslist4")!=-1) {//�Ǽ��縮 ��ü
				
				url = cp + "/itmall/goodslist4.do?cate="+ category[0] + "&cate1=" + category[1] + "&cate2=" + category[2]
						+ "&cate3=" + category[3] + "&cate4=" + category[4] + "&pageNum=" + pageNum;
				
				resp.sendRedirect(url);
				
			}else if(before_address.indexOf("goodslist3")!=-1) {//clothes��ü
				
				url = cp + "/itmall/goodslist3.do?cate="+ category[0] + "&cate1=" + category[1] + "&cate2=" + category[2] + "&pageNum=" + pageNum;
				
				resp.sendRedirect(url);
				
			}else if(before_address.indexOf("goodslist2")!=-1) {//searchValue��
				
				url = cp + "/itmall/goodslist2.do?searchValue="+ category[0] + "&pageNum=" + pageNum;
				
				resp.sendRedirect(url);
				
			}else {
			//�׳� cate��
			url = cp + "/itmall/goodslist.do?cate=" + category[0] + "&pageNum=" + pageNum;
			
			resp.sendRedirect(url);
			}
			
		}



	}



}
