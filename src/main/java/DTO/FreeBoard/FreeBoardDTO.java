package DTO.FreeBoard;

import java.time.LocalDateTime;

public class FreeBoardDTO {
    private Long freeBoardId;
    private String loginId;
    private String title;
    private String content;
    private String category;
    private int viewCount;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private boolean isDeleted;
    
    private String nickName;
    private int commentCount;
    
    public FreeBoardDTO() {}
    
    public FreeBoardDTO(Long freeBoardId, String loginId, String title, String content, String category, int viewCount, LocalDateTime createdAt, LocalDateTime updatedAt, boolean isDeleted) {
        this.freeBoardId = freeBoardId;
        this.loginId = loginId;
        this.title = title;
        this.content = content;
        this.category = category;
        this.viewCount = viewCount;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }
    
    public Long getFreeBoardId() {
        return freeBoardId;
    }
    
    public String getLoginId() {
        return loginId;
    }
    
    public String getTitle() {
        return title;
    }
    
    public String getContent() {
        return content;
    }
    
    public String getCategory() {
        return category;
    }
    
    public int getViewCount() {
        return viewCount;
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
    
    public int getCommentCount() {
        return commentCount;
    }
    
    public void setFreeBoardId(Long freeBoardId) {
        this.freeBoardId = freeBoardId;
    }
    
    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
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
    
    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }
}