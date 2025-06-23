package DAO.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import DTO.User.UsersDTO;

public class UsersDAO {
	
    // DB연결 메소드
    private Connection getConnection() throws Exception {
        // connection pool을 활용한 db연동
        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ottadmin");
        Connection con = ds.getConnection();
        
        System.out.println("Users DB 연결 성공");
        return con;
    }
    
    // 아이디 중복검사 메소드    
    public boolean isLoginIdExists(String loginId) throws SQLException{
        String sql = "SELECT COUNT(*) FROM Users WHERE LoginId = ?";
        
        try(Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);){
            
            pstmt.setString(1, loginId);
            
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()) {
                    int count = rs.getInt(1);
                    System.out.println("중복 검사 결과: " + count + "개 발견");
                    return count > 0;
                }
            }

        }catch(Exception e) {
            System.err.println("중복 검사 오류: " + e.getMessage());
            throw new SQLException("중복 검사 오류", e);
        }
        return false;
    }
    
    // 회원가입 메소드
    public boolean userInsert(UsersDTO dto) {
        String sql = "INSERT INTO Users(LoginId, NickName, Email, Phone, UserPassword, Gender) VALUES(?, ?, ?, ?, ?, ?)";
        
        try(Connection con = getConnection();
        	PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, dto.getLoginId());
            pstmt.setString(2, dto.getNickName());
            pstmt.setString(3, dto.getEmail());
            pstmt.setString(4, dto.getPhone());
            pstmt.setString(5, dto.getUserPassword());
            pstmt.setString(6, dto.getGender());
           
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
            	System.out.println(dto.getLoginId() + "님 회원가입 성공");
            	return true;
            }else {
            	System.out.println(dto.getLoginId() + "님 회원가입 실패");
            	return false;
            }
            
        }
        catch(Exception e) {
        	System.out.println("회원가입 예외처리 오류 발생");
        	e.printStackTrace();
        	return false;
        }
    }
    
    //	로그인 메소드
    public UsersDTO userLogin(String loginId, String password) {
    	String sql = "SELECT UsersId, LoginId, NickName, Email, Phone, Gender, ProfileFileName, CreatedAt, UpdatedAt FROM Users WHERE LoginId = ? AND UserPassword = ?";
    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql);){
    		pstmt.setString(1, loginId);
    		pstmt.setString(2, password);
    		ResultSet rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			UsersDTO dto = new UsersDTO();
    			dto.setUsersId(rs.getLong("UsersId"));
    			dto.setLoginId(rs.getString("LoginId"));
    			dto.setNickName(rs.getString("NickName"));
    			dto.setEmail(rs.getString("Email"));
    			dto.setPhone(rs.getString("Phone"));
    			dto.setGender(rs.getString("Gender"));
    			dto.setProfileFileName(rs.getString("ProfileFileName"));
 
    			System.out.println(dto.getLoginId() + "님 데이터베이스 로그인정보 찾기 성공");
    			
    			return dto;
    		}else {
    			System.out.println("데이터베이스 로그인정보 찾기 실패");
    			return null;
    		}
    	}catch(Exception e) {
    		System.out.println("로그인 예외처리 오류 발생");
    		e.printStackTrace();
    	}
		return null;
    }
    
    //	회원정보수정 메소드
    public boolean userUpdate(String loginId, String nickName, String email, String phone, String password) {
    	String sql = "UPDATE Users SET NickName = ?, Email = ?, Phone = ?, UserPassword = ? WHERE LoginId = ?";
    	try(Connection con = getConnection();
        	PreparedStatement pstmt = con.prepareStatement(sql);){
    		pstmt.setString(1, nickName);
    		pstmt.setString(2, email);
    		pstmt.setString(3, phone);
    		pstmt.setString(4, password);
    		pstmt.setString(5, loginId);
        	
    		System.out.println(loginId + " 님 데이터베이스 회원정보수정 중.....");
        	int result = pstmt.executeUpdate();
        	
        	if (result > 0) {
        		System.out.println(loginId + " 님 데이터베이스 수정 성공");
        		return true;
        	}else {
        		System.out.println(loginId + " 님 데이터베이스 수정 실패");
        		return false;
        	}
    	}catch(Exception e) {
    		System.out.println("회원정보수정 예외처리 오류 발생");
    		e.printStackTrace();
    	}
    	return false;
    }
    
    // 회원정보 가져오기 메소드
    public UsersDTO getUserInfo(String loginId) {
        String sql = "SELECT * FROM Users WHERE LoginId = ?";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setString(1, loginId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    UsersDTO dto = new UsersDTO();
                    
                    dto.setUsersId(rs.getLong("UsersId"));
        			dto.setLoginId(rs.getString("LoginId"));
        			dto.setNickName(rs.getString("NickName"));
        			dto.setEmail(rs.getString("Email"));
        			dto.setPhone(rs.getString("Phone"));
        			dto.setGender(rs.getString("Gender"));
        			dto.setProfileFileName(rs.getString("ProfileFileName"));
        			
                    return dto;
                }
            }
        } catch (Exception e) {
        	System.out.println("회원정보 가져오기 예외처리 오류 발생");
            e.printStackTrace();
        }
        return null;
    }

    // 회원 탈퇴 메소드
    public boolean userDelete(String loginId) {
    	String sql = "DELETE FROM Users WHERE LoginId = ?";
    	
    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql);){
    		System.out.println(loginId + "님 데이터베이스 회원탈퇴 중..");
    		
    		pstmt.setString(1, loginId);
    		
    		int result = pstmt.executeUpdate();
    		
    		if (result > 0) {
    			System.out.println(loginId + "님 데이터베이스 삭제 성공");
    			
    			return true;
    		}else {
    			System.out.print(loginId + "님 데이터베이스 삭제 실패");
    			return false;
    		}
    	}catch(Exception e) {
    		System.out.println("회원탈퇴 예외처리 오류 발생");
    		e.printStackTrace();
    	}
    	return false;
    }
}
