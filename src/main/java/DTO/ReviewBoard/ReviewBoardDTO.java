package DTO.ReviewBoard;

import java.time.LocalDateTime;
import java.util.List;

public class ReviewBoardDTO {
    private Long reviewBoardId;
    private String loginId;
    private String title;
    private String content;
    private String category;
    private int viewCount;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private boolean isDeleted;
    
    private String nickName;                    // Users 테이블과 조인
    private List<String> imageFileNames;        // 이미지 파일명 목록
    private String mainImageFileName;           // 대표 이미지 (첫 번째 이미지)
    

    public ReviewBoardDTO() {}
    

    public ReviewBoardDTO(Long reviewBoardId, String loginId, String title, String content, 
                         String category, int viewCount, LocalDateTime createdAt, 
                         LocalDateTime updatedAt, boolean isDeleted) {
        this.reviewBoardId = reviewBoardId;
        this.loginId = loginId;
        this.title = title;
        this.content = content;
        this.category = category;
        this.viewCount = viewCount;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isDeleted = isDeleted;
    }
    
    public Long getReviewBoardId() { return reviewBoardId; }
    public void setReviewBoardId(Long reviewBoardId) { this.reviewBoardId = reviewBoardId; }
    
    public String getLoginId() { return loginId; }
    public void setLoginId(String loginId) { this.loginId = loginId; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    
    public int getViewCount() { return viewCount; }
    public void setViewCount(int viewCount) { this.viewCount = viewCount; }
    
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    
    public boolean isDeleted() { return isDeleted; }
    public void setDeleted(boolean deleted) { isDeleted = deleted; }
    
    public String getNickName() { return nickName; }
    public void setNickName(String nickName) { this.nickName = nickName; }
    
    public List<String> getImageFileNames() { return imageFileNames; }
    public void setImageFileNames(List<String> imageFileNames) { 
        this.imageFileNames = imageFileNames;
        
        // 대표 이미지 설정 (리스트의 첫 번째 이미지를 저장)
        if (imageFileNames != null && !imageFileNames.isEmpty()) {
            this.mainImageFileName = imageFileNames.get(0);
        }
    }
    
    public String getMainImageFileName() { return mainImageFileName; }
    public void setMainImageFileName(String mainImageFileName) { this.mainImageFileName = mainImageFileName; }
}
