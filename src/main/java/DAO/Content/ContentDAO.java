package DAO.Content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.Content.ContentDTO;

public class ContentDAO {

	// DB연결 메소드
    private Connection getConnection() throws Exception {
        // connection pool을 활용한 db연동
        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ottadmin");
        Connection con = ds.getConnection();
        
        System.out.println("Content DB 연결 성공");
        return con;
    }
    
    // 장르 별 조회 메소드
    public List<ContentDTO> getContentByGenre(String genre, int limit){
    	String sql = "SELECT ContentId, Title, Info, Genre, ReleaseDate, Director, AgeRating, PosterFileName, ThumbnailFileName FROM Content WHERE  Genre = ? ORDER BY ContentId DESC LIMIT ?";
    	
    	List<ContentDTO>dtos = new ArrayList<ContentDTO>();
    	
    	System.out.println("장르 별 Content 조회 메소드 실행 중..");
    	
    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql);){
    		
    		pstmt.setString(1, genre);
    		pstmt.setInt(2, limit);
    		
    		ResultSet rs = pstmt.executeQuery();
    		
    		while (rs.next()) {
    			ContentDTO dto = new ContentDTO();
    			
    			dto.setContentId(rs.getLong("ContentId"));
                dto.setTitle(rs.getString("Title"));
                dto.setInfo(rs.getString("Info"));
                dto.setGenre(rs.getString("Genre"));
                dto.setReleaseDate(rs.getString("ReleaseDate"));
                dto.setDirector(rs.getString("Director"));
                dto.setAgeRating(rs.getString("AgeRating"));
                dto.setPosterFileName(rs.getString("PosterFileName"));
                dto.setThumbnailFileName(rs.getString("ThumbnailFileName"));
                
                dtos.add(dto);
    		}
    	}catch(Exception e) {
    		System.out.println("장르별 조회 예외처리 오류 발생");
    		e.printStackTrace();
    	}
    	
    	return dtos;
    }
    
    // 콘텐츠 상세 조회 메소드
    public ContentDTO getContentById(Long contentId) {
        String sql = "SELECT * FROM Content WHERE ContentId = ?";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, contentId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                ContentDTO dto = new ContentDTO();
                dto.setContentId(rs.getLong("ContentId"));
                dto.setTitle(rs.getString("Title"));
                dto.setInfo(rs.getString("Info"));
                dto.setGenre(rs.getString("Genre"));
                dto.setReleaseDate(rs.getString("ReleaseDate"));
                dto.setDirector(rs.getString("Director"));
                dto.setAgeRating(rs.getString("AgeRating"));
                dto.setPosterFileName(rs.getString("PosterFileName"));
                dto.setThumbnailFileName(rs.getString("ThumbnailFileName"));
                
                return dto;
            }
            
        } catch (Exception e) {
            System.out.println("콘텐츠 상세 조회 예외처리 오류 발생");
            e.printStackTrace();
        }
        
        return null;
    }
    
    // 키워드 별 콘텐츠 검색 메소드
    public List<ContentDTO> getContentSearch(String keyword, int limit) {
    	List<ContentDTO> dtos = new ArrayList<ContentDTO>();
    	String sql = "SELECT * FROM Content WHERE Title LIKE ? ORDER BY Title LIMIT ?";

    	try(Connection con = getConnection();
    		PreparedStatement pstmt = con.prepareStatement(sql);){
    		
    		pstmt.setString(1, "%" + keyword + "%");
    		pstmt.setInt(2, limit);
    		
    		ResultSet rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			ContentDTO dto = new ContentDTO();
    			
    			dto.setContentId(rs.getLong("ContentId"));
                dto.setTitle(rs.getString("Title"));
                dto.setInfo(rs.getString("Info"));
                dto.setGenre(rs.getString("Genre"));
                dto.setReleaseDate(rs.getString("ReleaseDate"));
                dto.setDirector(rs.getString("Director"));
                dto.setAgeRating(rs.getString("AgeRating"));
                dto.setPosterFileName(rs.getString("PosterFileName"));
                dto.setThumbnailFileName(rs.getString("ThumbnailFileName"));
    			
    			dtos.add(dto);
    		}
    	}catch(Exception e) {
    		System.out.println("콘텐츠 검색 예외처리 오류 발생");
    		e.printStackTrace();
    	}
    	return dtos;
    }
    	
    
}
