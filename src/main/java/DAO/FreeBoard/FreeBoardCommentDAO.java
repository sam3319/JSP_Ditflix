package DAO.FreeBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.FreeBoard.FreeBoardCommentDTO;

public class FreeBoardCommentDAO {
    
    // DB연결 메소드
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ottadmin");
        Connection con = ds.getConnection();
        
        System.out.println("FreeBoard Comment DB 연결 성공");
        return con;
    }
    
    // 특정 게시글의 댓글 목록 조회
    public List<FreeBoardCommentDTO> getCommentsByBoardId(Long freeBoardId) {
        System.out.println("댓글 목록 조회 메소드 실행 중.. 게시글 ID: " + freeBoardId);
        List<FreeBoardCommentDTO> comments = new ArrayList<>();
        
        String sql = "SELECT c.CommentId, c.FreeBoardId, c.LoginId, c.Content, " +
                    "c.CreatedAt, c.UpdatedAt, c.IsDeleted, u.NickName " +
                    "FROM FreeBoardComment c " +
                    "JOIN Users u ON c.LoginId = u.LoginId " +
                    "WHERE c.FreeBoardId = ? AND c.IsDeleted = FALSE " +
                    "ORDER BY c.CreatedAt ASC";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, freeBoardId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                FreeBoardCommentDTO comment = new FreeBoardCommentDTO();
                
                comment.setCommentId(rs.getLong("CommentId"));
                comment.setFreeBoardId(rs.getLong("FreeBoardId"));
                comment.setLoginId(rs.getString("LoginId"));
                comment.setContent(rs.getString("Content"));
                comment.setCreatedAt(rs.getTimestamp("CreatedAt").toLocalDateTime());
                comment.setUpdatedAt(rs.getTimestamp("UpdatedAt").toLocalDateTime());
                comment.setDeleted(rs.getBoolean("IsDeleted"));
                comment.setNickName(rs.getString("NickName"));
                
                comments.add(comment);
            }
            
            System.out.println("댓글 목록 조회 완료: " + comments.size() + "개");
            
        } catch (Exception e) {
            System.out.println("댓글 목록 조회 오류");
            e.printStackTrace();
        }
        
        return comments;
    }
    
    // 댓글 작성
    public boolean insertComment(FreeBoardCommentDTO comment) {
        System.out.println("댓글 작성 메소드 실행 중..");
        
        String sql = "INSERT INTO FreeBoardComment (FreeBoardId, LoginId, Content) VALUES (?, ?, ?)";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, comment.getFreeBoardId());
            pstmt.setString(2, comment.getLoginId());
            pstmt.setString(3, comment.getContent());
            
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("댓글 작성 완료");
                return true;
            }
            
        } catch (Exception e) {
            System.out.println("댓글 작성 오류" );
            e.printStackTrace();
        }
        
        return false;
    }
    
    // 댓글 삭제
    public boolean deleteComment(Long commentId, String loginId) {
        System.out.println("댓글 삭제 메소드 실행 중.. 댓글 ID: " + commentId);
        
        String sql = "UPDATE FreeBoardComment SET IsDeleted = TRUE, UpdatedAt = CURRENT_TIMESTAMP " +
                    "WHERE CommentId = ? AND LoginId = ? AND IsDeleted = FALSE";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, commentId);
            pstmt.setString(2, loginId);
            
            int result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("댓글 삭제 완료");
                return true;
            } else {
                System.out.println("삭제할 댓글이 없거나 권한이 없습니다.");
            }
            
        } catch (Exception e) {
            System.out.println("댓글 삭제 오류");
            e.printStackTrace();
        }
        
        return false;
    }
    
    // 특정 게시글의 댓글 수 조회
    public int getCommentCount(Long freeBoardId) {
        String sql = "SELECT COUNT(*) FROM FreeBoardComment WHERE FreeBoardId = ? AND IsDeleted = FALSE";
        
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setLong(1, freeBoardId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (Exception e) {
            System.out.println("댓글 수 조회 오류");
            e.printStackTrace();
        }
        
        return 0;
    }
}
