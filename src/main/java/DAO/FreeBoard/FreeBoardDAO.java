package DAO.FreeBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.FreeBoard.FreeBoardDTO;

public class FreeBoardDAO {
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
    
    // 전체 게시글 수 조회
    public long getFreeBoardCount(String searchKeyword, String searchType) {
    	System.out.println("자유게시판 - 전체 게시글 수 조회 메소드 실행 중..");
    	// 하나의 메소드로 여러 로직들을 처리하기 위해 StringBuilder 클래스를 사용 (가변)
    	// String 객체는 불변, 값을 추가 할 때마다 새로운 String 객체를 생성하여 오버헤드(메모리, 성능)가 상대적으로 크다.
    	StringBuilder sql = new StringBuilder();
    	sql.append("SELECT COUNT(*) FROM FreeBoard f JOIN Users u ON f.LoginId = u.LoginId WHERE f.IsDeleted = FALSE");
    	
    	if(searchKeyword != null && !searchKeyword.trim().isEmpty()) {
    		 if(searchType != null && searchType.equals("title")) {
    			 sql.append(" AND f.Title LIKE ?");
    		 }else if(searchType != null && searchType.equals("content")) {
    			 sql.append(" AND f.Content LIKE ?");
    		 }else if(searchType != null && searchType.equals("writer")) {
    			 sql.append(" AND u.NickName LIKE ?");
    		 }
    	}
    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql.toString())){
    		
    		if(searchKeyword != null && !searchKeyword.trim().isEmpty()) {
    			pstmt.setString(1, "%" + searchKeyword + "%");
    		}
    		
    		ResultSet rs = pstmt.executeQuery();
    		
    		if (rs.next()) {
    			System.out.println("전체 게시글 수 조회 완료");
    			return rs.getLong(1);
    		}
    	}catch(Exception e) {
    		System.out.println("전체 게시글 수 예외처리 오류 발생");
    		e.printStackTrace();    		
    	}
    	return 0;
    }
    
    // 자유게시판 게시글 리스트 조회
    public List<FreeBoardDTO> getFreeBoardList(int offSet, int limit, String searchKeyword, String searchType){
    	System.out.println("자유게시판 - 게시글 조회 메소드 실행 중..");
    	List<FreeBoardDTO> dtos = new ArrayList<FreeBoardDTO>();
    	StringBuilder sql = new StringBuilder();
    	
    	sql.append("SELECT f.FreeBoardId, f.LoginId, f.Title, f.Content, f.Category, f.ViewCount, f.CreatedAt, f.UpdatedAt, f.IsDeleted, u.NickName FROM FreeBoard f JOIN Users u ON f.LoginId = u.LoginId WHERE f.IsDeleted = FALSE");
    	
    	if(searchKeyword != null && !searchKeyword.trim().isEmpty()) {
    		if(searchType != null && searchType.equals("title")) {
    			sql.append(" AND f.Title LIKE ?");
    		}else if(searchType != null && searchType.equals("content")) {
   			 sql.append(" AND f.Content LIKE ?");
   		 	}else if(searchType != null && searchType.equals("writer")) {
   			 sql.append(" AND u.NickName LIKE ?");
   		 	}
    	}
    	
    	// 내림차순 정렬해서 검색    		
    	sql.append(" ORDER BY f.FreeBoardId DESC");
    	sql.append(" LIMIT ? OFFSET ?");
    	
    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql.toString());){
    		
    		int index = 1;	// 변수를 이용해서 쿼리에 들어갈 값을 지정한다.
    		
    		if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
    			pstmt.setString(index++, "%" + searchKeyword + "%");
    		}
    		
    		pstmt.setInt(index++, limit);
    		pstmt.setInt(index, offSet);
    		
    		ResultSet rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			FreeBoardDTO dto = new FreeBoardDTO();
    			
    			dto.setFreeBoardId(rs.getLong("FreeBoardId"));
    			dto.setLoginId(rs.getString("LoginId"));
    			dto.setTitle(rs.getString("Title"));
    			dto.setContent(rs.getString("Content"));
    			dto.setCategory(rs.getString("Category"));
    			dto.setViewCount(rs.getInt("ViewCount"));
    			dto.setCreatedAt(rs.getTimestamp("CreatedAt").toLocalDateTime());
    			dto.setUpdatedAt(rs.getTimestamp("UpdatedAt").toLocalDateTime());
    			dto.setDeleted(rs.getBoolean("IsDeleted"));
    			dto.setNickName(rs.getString("NickName"));
    			
    			dtos.add(dto);
    		}
    		System.out.println("게시글 목록 조회 완료");
    	}catch(Exception e) {
    		System.out.println("전체 게시글 수 예외처리 오류 발생");
    		e.printStackTrace();
    	}
    	
    	return dtos;
    }
    
    // 게시글 상세조회
    public FreeBoardDTO getFreeBoardPost(Long freeBoardId) {
    	System.out.println("자유게시판 - 상세조회 메소드 실행 중..");
    	String sql = "SELECT f.FreeBoardId, f.LoginId, f.Title, f.Content, f.Category, f.ViewCount, f.CreatedAt, f.UpdatedAt, f.IsDeleted, u.NickName FROM FreeBoard f JOIN Users u ON f.LoginId = u.LoginId WHERE f.IsDeleted = FALSE AND f.FreeBoardId = ?";
    	
    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql);){
    		
    		pstmt.setLong(1, freeBoardId);
    		
    		ResultSet rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			FreeBoardDTO dto = new FreeBoardDTO();
    			
    			dto.setFreeBoardId(rs.getLong("FreeBoardId"));
    			dto.setLoginId(rs.getString("LoginId"));
    			dto.setTitle(rs.getString("Title"));
    			dto.setContent(rs.getString("Content"));
    			dto.setCategory(rs.getString("Category"));
    			dto.setViewCount(rs.getInt("ViewCount"));
    			dto.setCreatedAt(rs.getTimestamp("CreatedAt").toLocalDateTime());
    			dto.setUpdatedAt(rs.getTimestamp("UpdatedAt").toLocalDateTime());
    			dto.setDeleted(rs.getBoolean("IsDeleted"));
    			dto.setNickName(rs.getString("NickName"));
    			
    			System.out.println("자유게시판 - 게시글 상세 조회 완료");
    			return dto;
    		}
    	}catch(Exception e) {
    		System.out.println("자유게시판 - 게시글 상세조회 예외처리 오류 발생");
    		e.printStackTrace();
    	}
    	return null;
    }
    
    // 게시글 조회수 증가
    public boolean updateViewCount(Long freeBoardId) {
    	System.out.println("자유게시판 - 게시글 조회수 증가 메소드 실행 중..");
    	String sql = "UPDATE FreeBoard SET ViewCount = ViewCount + 1 WHERE FreeBoardId = ?";
    	
    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql);){
    		
    		pstmt.setLong(1, freeBoardId);
    		
    		int result = pstmt.executeUpdate();
    		
    		if (result > 0) {
    			System.out.println("자유게시판 - 조회수 증가 완료");
    			return true;
    		}
    		
    	}catch(Exception e) {
    		System.out.println("자유게시판 - 게시글 조회수 예외처리 오류 발생");
    		e.printStackTrace();
    	}
    	return false;
    }
    
    // 게시글 작성
    public boolean insertFreeBoard(FreeBoardDTO dto) {
    	System.out.println("자유게시판 - 게시글 작성 메소드 실행 중..");
    	String sql = "INSERT INTO FreeBoard (LoginId, Title, Content, Category) VALUES(?, ?, ?, ?)";
    	
    	try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setString(1, dto.getLoginId());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getCategory());
            
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("자유게시판 - 게시글 작성 완료");
                return true;
            }
            
        } catch (Exception e) {
            System.out.println("자유게시판 - 게시글 작성 예외처리 오류 발생");
            e.printStackTrace();
        }
        
        return false;
    }
    
    // 게시글 수정
    public boolean updateFreeBoard(FreeBoardDTO dto) {
        System.out.println("자유게시판 - 게시글 수정 메소드 실행 중..");
        
        String sql = "UPDATE FreeBoard SET Title = ?, Content = ?, Category = ?, UpdatedAt = CURRENT_TIMESTAMP " +
                    "WHERE FreeBoardId = ? AND LoginId = ? AND IsDeleted = FALSE";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getCategory());
            pstmt.setLong(4, dto.getFreeBoardId());
            pstmt.setString(5, dto.getLoginId());
            
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("자유게시판 - 게시글 수정 완료");
                return true;
            } else {
                System.out.println("수정할 게시글이 없거나 권한이 없습니다.");
            }
            
        } catch (Exception e) {
            System.out.println("자유게시판 - 게시글 수정 예외처리 오류 발생");
            e.printStackTrace();
        }
        
        return false;
    }
    
    // 게시글 삭제
    public boolean deleteFreeBoard(Long freeBoardId, String loginId) {
        System.out.println("자유게시판 - 게시글 삭제 메소드 실행 중..");
        
        String sql = "UPDATE FreeBoard SET IsDeleted = TRUE, UpdatedAt = CURRENT_TIMESTAMP " +
                    "WHERE FreeBoardId = ? AND LoginId = ? AND IsDeleted = FALSE";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, freeBoardId);
            pstmt.setString(2, loginId);
            
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("자유게시판 - 게시글 삭제 완료");
                return true;
            } else {
                System.out.println("자유게시판 - 삭제할 게시글이 없거나 권한이 없습니다.");
            }
            
        } catch (Exception e) {
            System.out.println("자유게시판 - 게시글 삭제 예외처리 오류 발생");
            e.printStackTrace();
        }
        
        return false;
    }

}
