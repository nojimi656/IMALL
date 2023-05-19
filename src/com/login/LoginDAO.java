package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.PJConn;





public class LoginDAO {
	
	private Connection conn;
	
	public LoginDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	//회원가입
	public int insertData(LoginDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into userac (";
			
			sql+= "userId,userPwd,userName,userBirth,userTel,userAddr) ";
			
			sql+= "values (?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserBirth());
			pstmt.setString(5, dto.getUserTel());
			pstmt.setString(6, dto.getUserAddr());
			

			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//전체 테이터 갯수
	public LoginDTO getReadData(String userId) {
		
		LoginDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String sql;
		
		try {
			
			sql = "select ";
			
			sql+= "userId,userPwd,userName,";
			sql+= "to_char(userBirth,'YYYY-MM-DD') userBirth,userTel,userAddr ";
			
			sql+= "from userac where userId=?";
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				dto = new LoginDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserTel(rs.getString("userTel"));
				dto.setUserAddr(rs.getString("userAddr"));
				
				
			}
			
			rs.close();
			pstmt.close();
			
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return dto;
		
		}
	
		//아이디 찾기 
		public LoginDTO getReadData(String userTel,String userName,String userBirth) {
			
			LoginDTO dto = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String sql;
			
			try {
				
				sql = "select ";
				sql+= "userId,userName, ";
				sql+= "to_char(userBirth,'YYYY-MM-DD') userBirth,userTel ";
				
				sql+= "from userac where userTel=? and userBirth=? and userName=?";
				
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userTel);
				pstmt.setString(2, userBirth);
				pstmt.setString(3, userName);
				
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					dto = new LoginDTO();
					
					
					dto.setUserId(rs.getString("userId"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserBirth(rs.getString("userBirth"));
					dto.setUserTel(rs.getString("userTel"));
					
					
				}
				
				rs.close();
				pstmt.close();
				
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				return dto;
			
			}
	
		//비번 찾기 
		public LoginDTO getReadData(String userTel,String userName,String userBirth,String userId) {
					
				LoginDTO dto = null;
			
				PreparedStatement pstmt = null;
				ResultSet rs = null; 
				String sql;
			
				try {
						
				sql = "select ";
				sql+= "userId,userPwd,userName,";
				sql+= "to_char(userBirth,'YYYY-MM-DD') userBirth,userTel ";
				
				sql+= "from userac where userTel=? and userBirth=? and userName=? and userId=?";
				
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userTel);
				pstmt.setString(2, userBirth);
				pstmt.setString(3, userName);
				pstmt.setString(4, userId);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					dto = new LoginDTO();
					
					
					dto.setUserId(rs.getString("userId"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserBirth(rs.getString("userBirth"));
					dto.setUserTel(rs.getString("userTel"));
					dto.setUserPwd(rs.getString("userPwd"));
					
				}
				
				
				rs.close();
				pstmt.close();
				
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				return dto;
					
			}
		
	//회원정보 수정
	public void updateData(LoginDTO dto) {
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update userac set userpwd=?,username=?,useraddr=?,usertel=?,userBirth=? where userid=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserPwd());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getUserAddr());
			pstmt.setString(4, dto.getUserTel());
			pstmt.setString(5, dto.getUserBirth());
			
			pstmt.setString(6, dto.getUserId());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
			
	}
	
	//아이디 중복확인
	public int duplecateID(String id){
		
			int cnt=0;
		    try{
		    	Connection con = PJConn.getConnection();
		        StringBuilder sql=new StringBuilder();
		        
		        //아이디 중복 확인
		        sql.append(" SELECT count(userid) as cnt ");
		        sql.append(" FROM userac ");
		        sql.append(" WHERE userid = ? ");
		        
		        PreparedStatement pstmt = con.prepareStatement(sql.toString());
		        pstmt.setString(1, id);
		        
		        ResultSet rs = pstmt.executeQuery();
		        if(rs.next()){
		        	cnt=rs.getInt("cnt");
		        }
		    }catch(Exception e){
		     	System.out.println("아이디 중복 확인 실패 : " + e);
		    }//try end
			return cnt;
		}//duplecateID end
	
	

}
