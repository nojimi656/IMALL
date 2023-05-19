package com.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAO {
	
	Connection conn;
	
	public OrdersDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	
	//결제완료후 주문완료 데이터 입력
	 public void insertData(OrdersDTO dto) {
		 
		 PreparedStatement pstmt = null;
		 String sql;
		 
		 try {
			
			 sql = "insert into orders values (?,?,?,?)";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, dto.getUserId());
			 pstmt.setInt(2, dto.getGoods_num());
			 pstmt.setString(3, dto.getDays());
			 pstmt.setString(4, dto.getOrdeq());
			 
			 pstmt.executeUpdate();
			 
			 pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	 }
	
	 //주문취소시 데이터 삭제
	 public void deleteData(String userid,String days) {
		 
		 PreparedStatement pstmt = null;
		 String sql;
		 
		 try {
			
			 sql = "delete orders where userid = ? and days = ?";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, userid);
			 pstmt.setString(2, days);
			 
			 pstmt.executeUpdate();
			 
			 pstmt.close();
			 
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	 }
	
	//주문완료 데이터 불러오기
	public List<OrdersDTO> selectData(String userid) {
		
		List<OrdersDTO> lists = new ArrayList<OrdersDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
		sql = "select userid,goods_num,to_char(days,'yyyy-mm-dd') days, ordeq ";
		sql+= "from orders where userid = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, userid);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			OrdersDTO dto = new OrdersDTO();
			
			dto.setUserId(rs.getString("userid"));
			dto.setGoods_num(rs.getInt("goods_num"));
			dto.setDays(rs.getString("days"));
			dto.setOrdeq(rs.getString("ordeq"));
			
			lists.add(dto);
		}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	

}
