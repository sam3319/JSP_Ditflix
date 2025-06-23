package DTO.FreeBoard;

import java.time.LocalDateTime;

public class FreeBoardCommentDTO {
    private Long commentId;
    private Long freeBoardId;
    private String loginId;
    private String content;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private boolean isDeleted;
    
    private String nickName;
   
    public FreeBoardCommentDTO() {}
    
    public FreeBoardCommentDTO(Long commentId, Long freeBoardId, String loginId, 
                              String content, LocalDateTime createdAt, 
                              LocalDateTime updatedAt, boolean isDeleted) {
        this.commentId = commentId;
        this.freeBoardId = freeBoardId;
        this.loginId = loginId;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }
    
    public Long getCommentId() {
        return commentId;
    }
    
    public Long getFreeBoardId() {
        return freeBoardId;
    }
    
    public String getLoginId() {
        return loginId;
    }
    
    public String getContent() {
        return content;
    }
    
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }
    
    public boolean isDeleted() {
        return isDeleted;
    }
    
    public String getNickName() {
        return nickName;
    }
    
    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }
    
    public void setFreeBoardId(Long freeBoardId) {
        this.freeBoardId = freeBoardId;
    }
    
    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }
    
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
}
