package DAO.ReviewBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.ReviewBoard.ReviewBoardDTO;

public class ReviewBoardDAO {
    
    // DB연결 메소드
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ottadmin");
        Connection con = ds.getConnection();
        
        System.out.println("ReviewBoard DB 연결 성공");
        return con;
    }
    
    // 전체 리뷰 수 조회
    public long getReviewBoardCount(String searchKeyword, String searchType) {
        System.out.println("리뷰게시판 - 전체 리뷰 수 조회 메소드 실행 중..");
        
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT COUNT(*) FROM ReviewBoard r ");
        sql.append("JOIN Users u ON r.LoginId = u.LoginId ");
        sql.append("WHERE r.IsDeleted = FALSE");
        
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            if ("title".equals(searchType)) {
                sql.append(" AND r.Title LIKE ?");
            } else if ("content".equals(searchType)) {
                sql.append(" AND r.Content LIKE ?");
            } else if ("writer".equals(searchType)) {
                sql.append(" AND u.NickName LIKE ?");
            }
        }
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
            
            int paramIndex = 1;
            
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                pstmt.setString(paramIndex, "%" + searchKeyword + "%");
            }
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                System.out.println("리뷰게시판 - 전체 리뷰 수 조회 완료");
                return rs.getLong(1);
            }
        } catch (Exception e) {
            System.out.println("리뷰게시판 - 전체 리뷰 수 조회 오류");
            e.printStackTrace();
        }
        
        return 0;
    }
    
    // 리뷰게시판 목록 조회
    public List<ReviewBoardDTO> getReviewBoardList(int offset, int limit, 
                                                  String searchKeyword, String searchType) {
        System.out.println("리뷰게시판 - 리뷰 목록 조회 메소드 실행 중..");
        List<ReviewBoardDTO> reviewList = new ArrayList<>();
        
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT r.ReviewBoardId, r.LoginId, r.Title, r.Content, r.Category, ");
        sql.append("r.ViewCount, r.CreatedAt, r.UpdatedAt, r.IsDeleted, u.NickName ");
        sql.append("FROM ReviewBoard r ");
        sql.append("JOIN Users u ON r.LoginId = u.LoginId ");
        sql.append("WHERE r.IsDeleted = FALSE");
        
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            if ("title".equals(searchType)) {
                sql.append(" AND r.Title LIKE ?");
            } else if ("content".equals(searchType)) {
                sql.append(" AND r.Content LIKE ?");
            } else if ("writer".equals(searchType)) {
                sql.append(" AND u.NickName LIKE ?");
            }
        }
        
        sql.append(" ORDER BY r.ReviewBoardId DESC");
        sql.append(" LIMIT ? OFFSET ?");
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
            
            int paramIndex = 1;
            
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                pstmt.setString(paramIndex++, "%" + searchKeyword + "%");
            }
           
            pstmt.setInt(paramIndex++, limit);
            pstmt.setInt(paramIndex, offset);
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                ReviewBoardDTO review = new ReviewBoardDTO();
                
                review.setReviewBoardId(rs.getLong("ReviewBoardId"));
                review.setLoginId(rs.getString("LoginId"));
                review.setTitle(rs.getString("Title"));
                review.setContent(rs.getString("Content"));
                review.setCategory(rs.getString("Category"));
                review.setViewCount(rs.getInt("ViewCount"));
                review.setCreatedAt(rs.getTimestamp("CreatedAt").toLocalDateTime());
                review.setUpdatedAt(rs.getTimestamp("UpdatedAt").toLocalDateTime());
                review.setDeleted(rs.getBoolean("IsDeleted"));
                review.setNickName(rs.getString("NickName"));
                
                // 이미지 파일명 목록 조회
                List<String> imageFileNames = getImageFileNames(review.getReviewBoardId());
                review.setImageFileNames(imageFileNames);
                
                reviewList.add(review);
            }
            
            System.out.println("리뷰게시판 - 리뷰 목록 조회 완료");
            
        } catch (Exception e) {
            System.out.println("리뷰게시판 - 리뷰 목록 조회 오류");
            e.printStackTrace();
        }
        
        return reviewList;
    }
    
    // 특정 리뷰의 이미지 파일명 목록 조회
    public List<String> getImageFileNames(Long reviewBoardId) {
        List<String> imageFileNames = new ArrayList<>();
        String sql = "SELECT FileName FROM ReviewBoardImage WHERE ReviewBoardId = ? ORDER BY ImageId ASC";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, reviewBoardId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                imageFileNames.add(rs.getString("FileName"));
            }
            
        } catch (Exception e) {
            System.out.println("이미지 파일명 조회 오류");
            e.printStackTrace();
        }
        
        return imageFileNames;
    }
    
    // 리뷰 상세 조회
    public ReviewBoardDTO getReviewBoardById(Long reviewBoardId) {
        System.out.println("리뷰게시판 - 상세 조회 메소드 실행 중.. ID: " + reviewBoardId);
        
        String sql = "SELECT r.ReviewBoardId, r.LoginId, r.Title, r.Content, r.Category, " +
                    "r.ViewCount, r.CreatedAt, r.UpdatedAt, r.IsDeleted, u.NickName " +
                    "FROM ReviewBoard r " +
                    "JOIN Users u ON r.LoginId = u.LoginId " +
                    "WHERE r.ReviewBoardId = ? AND r.IsDeleted = FALSE";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, reviewBoardId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                ReviewBoardDTO review = new ReviewBoardDTO();
                
                review.setReviewBoardId(rs.getLong("ReviewBoardId"));
                review.setLoginId(rs.getString("LoginId"));
                review.setTitle(rs.getString("Title"));
                review.setContent(rs.getString("Content"));
                review.setCategory(rs.getString("Category"));
                review.setViewCount(rs.getInt("ViewCount"));
                review.setCreatedAt(rs.getTimestamp("CreatedAt").toLocalDateTime());
                review.setUpdatedAt(rs.getTimestamp("UpdatedAt").toLocalDateTime());
                review.setDeleted(rs.getBoolean("IsDeleted"));
                review.setNickName(rs.getString("NickName"));
                
                // 이미지 파일명 목록 조회
                List<String> imageFileNames = getImageFileNames(reviewBoardId);
                review.setImageFileNames(imageFileNames);
                
                System.out.println("리뷰게시판 - 상세 조회 완료");
                return review;
            }
            
        } catch (Exception e) {
            System.out.println("리뷰게시판 - 상세 조회 오류");
            e.printStackTrace();
        }
        
        return null;
    }
    
    // 조회수 증가
    public boolean increaseViewCount(Long reviewBoardId) {
        String sql = "UPDATE ReviewBoard SET ViewCount = ViewCount + 1 WHERE ReviewBoardId = ?";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, reviewBoardId);
            int result = pstmt.executeUpdate();
            
            return result > 0;
            
        } catch (Exception e) {
            System.out.println("리뷰게시판 - 조회수 증가 오류");
            e.printStackTrace();
        }
        
        return false;
    }
    
    // 리뷰 작성
    public boolean insertReviewBoard(ReviewBoardDTO review, List<String> imageFileNames) {
        System.out.println("리뷰게시판 - 리뷰 작성 메소드 실행 중..");
        
        Connection con = null;
        try {
            con = getConnection();
            
            String reviewSql = "INSERT INTO ReviewBoard (LoginId, Title, Content, Category) VALUES (?, ?, ?, ?)";
            PreparedStatement reviewPstmt = con.prepareStatement(reviewSql, PreparedStatement.RETURN_GENERATED_KEYS);
            
            reviewPstmt.setString(1, review.getLoginId());
            reviewPstmt.setString(2, review.getTitle());
            reviewPstmt.setString(3, review.getContent());
            reviewPstmt.setString(4, review.getCategory());
            
            int reviewResult = reviewPstmt.executeUpdate();
            
            if (reviewResult > 0) {

                ResultSet generatedKeys = reviewPstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    Long reviewBoardId = generatedKeys.getLong(1);
                    review.setReviewBoardId(reviewBoardId);
                    
                    if (imageFileNames != null && !imageFileNames.isEmpty()) {
                        String imageSql = "INSERT INTO ReviewBoardImage (ReviewBoardId, FileName) VALUES (?, ?)";
                        PreparedStatement imagePstmt = con.prepareStatement(imageSql);
                        
                        for (String fileName : imageFileNames) {
                            imagePstmt.setLong(1, reviewBoardId);
                            imagePstmt.setString(2, fileName);
                            imagePstmt.addBatch();
                        }
                        
                        imagePstmt.executeBatch();
                        imagePstmt.close();
                    }
                   
                    System.out.println("리뷰게시판 - 리뷰 작성 완료");
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println("리뷰게시판 - 리뷰 작성 예외처리 오류 발생");
            e.printStackTrace();
        }
        return false;
    }
    
    // 리뷰 수정
    public boolean updateReviewBoardWithImages(ReviewBoardDTO review, List<String> newImageFileNames, boolean updateImages) {
        System.out.println("리뷰게시판 - 리뷰 수정 메소드 실행 중..");
        
        Connection con = null;
        try {
            con = getConnection();
            
            String reviewSql = "UPDATE ReviewBoard SET Title = ?, Content = ?, Category = ?, UpdatedAt = CURRENT_TIMESTAMP " +
                              "WHERE ReviewBoardId = ? AND LoginId = ? AND IsDeleted = FALSE";
            PreparedStatement reviewPstmt = con.prepareStatement(reviewSql);
            
            reviewPstmt.setString(1, review.getTitle());
            reviewPstmt.setString(2, review.getContent());
            reviewPstmt.setString(3, review.getCategory());
            reviewPstmt.setLong(4, review.getReviewBoardId());
            reviewPstmt.setString(5, review.getLoginId());
            
            int reviewResult = reviewPstmt.executeUpdate();
            
            if (reviewResult > 0) {
     
                if (updateImages) {

                    String deleteImageSql = "DELETE FROM ReviewBoardImage WHERE ReviewBoardId = ?";
                    PreparedStatement deleteImagePstmt = con.prepareStatement(deleteImageSql);
                    deleteImagePstmt.setLong(1, review.getReviewBoardId());
                    deleteImagePstmt.executeUpdate();
                    deleteImagePstmt.close();
                    
                    if (newImageFileNames != null && !newImageFileNames.isEmpty()) {
                        String imageSql = "INSERT INTO ReviewBoardImage (ReviewBoardId, FileName) VALUES (?, ?)";
                        PreparedStatement imagePstmt = con.prepareStatement(imageSql);
                        
                        for (String fileName : newImageFileNames) {
                            imagePstmt.setLong(1, review.getReviewBoardId());
                            imagePstmt.setString(2, fileName);
                            imagePstmt.addBatch();
                        }
                        
                        imagePstmt.executeBatch();
                        imagePstmt.close();
                    }
                }
                
                System.out.println("리뷰게시판 - 리뷰 수정 완료");
                return true;
            }
        }catch (Exception e) {
           System.out.println("리뷰게시판 - 리뷰 수정 예외처리 오류 발생");
           e.printStackTrace();
        }
        
        return false;
    }
    
    // 리뷰 삭제
    public boolean deleteReviewBoard(Long reviewBoardId, String loginId) {
        System.out.println("리뷰게시판 - 리뷰 삭제 메소드 실행 중..");
        
        Connection con = null;
        try {
            con = getConnection();
            
            List<String> imageFileNames = getImageFileNames(reviewBoardId);
            
            String deleteImageSql = "DELETE FROM ReviewBoardImage WHERE ReviewBoardId = ?";
            PreparedStatement deleteImagePstmt = con.prepareStatement(deleteImageSql);
            deleteImagePstmt.setLong(1, reviewBoardId);
            deleteImagePstmt.executeUpdate();
            deleteImagePstmt.close();
            
            String deleteSql = "UPDATE ReviewBoard SET IsDeleted = TRUE, UpdatedAt = CURRENT_TIMESTAMP " +
                              "WHERE ReviewBoardId = ? AND LoginId = ? AND IsDeleted = FALSE";
            PreparedStatement deletePstmt = con.prepareStatement(deleteSql);
            
            deletePstmt.setLong(1, reviewBoardId);
            deletePstmt.setString(2, loginId);
            
            int result = deletePstmt.executeUpdate();
            deletePstmt.close();
            
            if (result > 0) {
                System.out.println("리뷰게시판 - 리뷰 삭제 완료");
                
                return true;
            }  
            
        }catch (Exception e) {
        	e.printStackTrace();
        	System.out.println("리뷰게시판 - 리뷰 삭제 예외처리 오류 발생");
        }
        
        return false;
    }
    
    
}
