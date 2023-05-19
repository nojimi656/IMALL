package com.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class GoodsDAO {

	private Connection conn;

	public GoodsDAO(Connection conn) {

		this.conn = conn;

	}

	//goods_num최대값

	public int getMaxNum(String cate) {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(goods_num),0) from goods";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				maxNum = rs.getInt(1);

			}

			rs.close();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}

	//전체리스트 where cate(gory)

	public List<GoodsDTO> getLists(int start, int end, String cate){

		List<GoodsDTO> lists = new ArrayList<GoodsDTO>();

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "select * from (";
			sql+= "select rownum rnum, data.* from (";
			sql+= "select goods_num,title,content,saveFilename,";
			sql+= "originalFilename,cate,price from goods where cate = ? order by goods_num desc) data) ";
			sql+= "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cate);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				GoodsDTO dto = new GoodsDTO();

				dto.setGoods_num(rs.getInt("goods_num"));		
				dto.setTitle(rs.getString("title"));				
				dto.setContent(rs.getString("content"));				
				dto.setSaveFilename(rs.getString("saveFileName"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dto.setCate(rs.getString("cate"));
				dto.setPrice(rs.getInt("price"));

				lists.add(dto);

			}


			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	//전체리스트 뽑아내기 searchkey와 searchvalue, 페이징을 위한 start와 end 

	public List<GoodsDTO> getLists2(int start, int end, 
			String searchValue){

		List<GoodsDTO>lists = new ArrayList<GoodsDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select * from (";
			sql+= "select rownum rnum, data.* from (";
			sql+= "select goods_num,title,content,saveFilename,";
			sql+= "originalFilename,cate,price from goods where title like ? ";
			sql+= "order by goods_num desc) data) where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			//제목 작성자(name) 이메일 내용 패스워드만 사용자에게 받음 나머지는 내가 알아서
			//여기선 name subject만 사용자에게 받은 값을 씀
			while(rs.next()) {

				GoodsDTO dto = new GoodsDTO();

				dto.setGoods_num(rs.getInt("goods_num"));		
				dto.setTitle(rs.getString("title"));				
				dto.setContent(rs.getString("content"));				
				dto.setSaveFilename(rs.getString("saveFileName"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dto.setCate(rs.getString("cate"));
				dto.setPrice(rs.getInt("price"));

				lists.add(dto);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	
	//전체리스트 뽑아내기(jacket,top,bottom)
	public List<GoodsDTO> getLists(int start, int end, String jacket,String top, String bottom){

		List<GoodsDTO> lists = new ArrayList<GoodsDTO>();

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "select * from (";
			sql+= "select rownum rnum, data.* from (";
			sql+= "select goods_num,title,content,saveFilename,";
			sql+= "originalFilename,cate,price from goods where cate = ? or cate = ? or cate = ? order by goods_num desc) data) ";
			sql+= "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, jacket);
			pstmt.setString(2, top);
			pstmt.setString(3, bottom);
			pstmt.setInt(4, start);
			pstmt.setInt(5, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				GoodsDTO dto = new GoodsDTO();

				dto.setGoods_num(rs.getInt("goods_num"));		
				dto.setTitle(rs.getString("title"));				
				dto.setContent(rs.getString("content"));				
				dto.setSaveFilename(rs.getString("saveFileName"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dto.setCate(rs.getString("cate"));
				dto.setPrice(rs.getInt("price"));

				lists.add(dto);

			}


			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	
	//전체리스트 뽑아내기(watch,cap,socks,wallet,belt)
		public List<GoodsDTO> getLists(int start, int end, String watch,String cap, String socks, String wallet, String belt){

			List<GoodsDTO> lists = new ArrayList<GoodsDTO>();

			ResultSet rs = null;
			PreparedStatement pstmt = null;
			String sql;

			try {

				sql = "select * from (";
				sql+= "select rownum rnum, data.* from (";
				sql+= "select goods_num,title,content,saveFilename,";
				sql+= "originalFilename,cate,price from goods where cate = ? or cate = ? or cate = ? or cate = ? or cate = ? ";
				sql+= "order by goods_num desc) data) ";
				sql+= "where rnum>=? and rnum<=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, watch);
				pstmt.setString(2, cap);
				pstmt.setString(3, socks);
				pstmt.setString(4, wallet);
				pstmt.setString(5, belt);
				pstmt.setInt(6, start);
				pstmt.setInt(7, end);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					GoodsDTO dto = new GoodsDTO();

					dto.setGoods_num(rs.getInt("goods_num"));		
					dto.setTitle(rs.getString("title"));				
					dto.setContent(rs.getString("content"));				
					dto.setSaveFilename(rs.getString("saveFileName"));
					dto.setOriginalFilename(rs.getString("originalFilename"));
					dto.setCate(rs.getString("cate"));
					dto.setPrice(rs.getInt("price"));

					lists.add(dto);

				}


				rs.close();
				pstmt.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}

			return lists;

		}


	//하나의 데이터만 뽑아야되고getReadData

	public GoodsDTO getReadData(int goods_num) {

		GoodsDTO dto = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "select goods_num,title,content,saveFilename,";
			sql+= "originalFilename,cate,price from goods where goods_num = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, goods_num);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new GoodsDTO();

				dto.setGoods_num(rs.getInt("goods_num"));		
				dto.setTitle(rs.getString("title"));				
				dto.setContent(rs.getString("content"));				
				dto.setSaveFilename(rs.getString("saveFileName"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dto.setCate(rs.getString("cate"));
				dto.setPrice(rs.getInt("price"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}

	//insertData(관리자아이디일때만)

	public int insertData(GoodsDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into goods(goods_num,title,content,saveFilename,originalFilename,cate,price)" ;
			sql+= "values(?,?,?,?,?,?,?)";


			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getGoods_num());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getSaveFilename());
			pstmt.setString(5, dto.getOriginalFilename());
			pstmt.setString(6, dto.getCate());
			pstmt.setInt(7, dto.getPrice());

			result = pstmt.executeUpdate();

			pstmt.close();



		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	//deleteData(관리자아이디일때만)

	public int deleteData(int goods_num) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete goods where goods_num = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, goods_num);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	//전체 데이터 개수(serarchKey searchValue로 개수)

	public int getDataCount(String searchValue) {

		int totalCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select nvl(count(*),0) from goods ";
			sql+= "where title like ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				totalCount = rs.getInt(1);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return totalCount;
	}

	//전체 데이터 개수(cate로)

	public int getCateCount(String cate) {

		int totalCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {


			sql = "select nvl(count(*),0) from goods ";
			sql+= "where cate = ?"; 

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cate);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				totalCount = rs.getInt(1);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return totalCount;
	}


}
