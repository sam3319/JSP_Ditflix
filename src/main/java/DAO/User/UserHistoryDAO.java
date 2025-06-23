package DAO.User;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.User.UserHistoryDTO;

public class UserHistoryDAO {
	
    // DB연결 메소드
    private Connection getConnection() throws Exception {
        // connection pool을 활용한 db연동
        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ottadmin");
        Connection con = ds.getConnection();
        
        System.out.println("방문기록 DB 연결 성공");
        return con;
    }
    
    //	유저 방문기록 저장 메소드   
    public boolean insertHistory(UserHistoryDTO dto) {
    	String sql = "INSERT INTO UserHistory(LoginId, UserIP, UserAgent) VALUES(?, ?, ?)";
    	
    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql);){
    		pstmt.setString(1, dto.getLoginId());
    		pstmt.setString(2, dto.getUserIP());
    		pstmt.setString(3, dto.getUserAgent());
    		
    		int result = pstmt.executeUpdate();
    		
    		System.out.println(dto.getLoginId() + "님 방문기록 저장");
    		
    		return result > 0;
    	}
    	catch(Exception e) {
    		System.out.println("방문기록 저장 오류");
    		e.printStackTrace();
    	}
    	return false;
    }
}
