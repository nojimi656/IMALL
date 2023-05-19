package com.bag;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.goods.GoodsDTO;

public class bagDAO {
	
	Connection conn;

	
	public bagDAO(Connection conn) {
		this.conn = conn;
	}

	//����ID�� �Ű������� �޾� ����� ��ٱ��� �����Ͱ��� �ҷ�����
	public int bagCount(String userId) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select count(*) from bag ";
			sql+= "where userid = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				result = rs.getInt(1);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	//����ID�� ����ִ� ��ٱ��� ������ ��������
	public List<bagDTO> allBagData(String userid){
		
		List<bagDTO> lists = new ArrayList<bagDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select userid, goods_num, savefilename, originalfilename,";
			sql+= "created, title, price from bag where userid = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				bagDTO dto = new bagDTO();
				
				dto.setUserId(rs.getString(1));
				dto.setGoods_num(rs.getInt(2));
				dto.setSaveFileName(rs.getString(3));
				dto.setOriginalFileName(rs.getString(4));
				dto.setCreated(rs.getString(5));
				dto.setTitle(rs.getString(6));
				dto.setPrice(rs.getInt(7));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	//����ID�� ��ǰ��ȣ�� �Ű������� ������ ����
	//������ǰ������ �����Ϸ��� �����Ϸ�� ������ ����
	public void deleteData(String userid,int goods_num) {
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete bag where userid = ? and goods_num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setInt(2, goods_num);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
				
	}
	
	public void insertData(String userId,GoodsDTO gddto) {

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "insert into bag (userId,goods_num,saveFileName,originalFileName,created,title,price) ";
            sql+= "values (?,?,?,?,sysdate,?,?)";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userId);
            pstmt.setInt(2, gddto.getGoods_num());
            pstmt.setString(3, gddto.getSaveFilename());
            pstmt.setString(4, gddto.getOriginalFilename());
            pstmt.setString(5, gddto.getTitle());
            pstmt.setInt(6, gddto.getPrice());

            pstmt.executeUpdate();
            
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

    }
	
	
	
	
	
}
