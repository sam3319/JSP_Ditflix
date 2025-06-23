package DTO.FreeBoard;

public class PageDTO {
	private int currentPage;      // 현재 페이지 (1부터 시작)
    private int pageSize;         // 페이지당 게시글 수
    private long totalElements;   // 전체 게시글 수
    private int totalPages;       // 전체 페이지 수
    private int startPage;        // 페이지 네비게이션 시작
    private int endPage;          // 페이지 네비게이션 끝
    private boolean hasPrevious;  // 이전 페이지 존재 여부
    private boolean hasNext;      // 다음 페이지 존재 여부
    private boolean isFirst;      // 첫 번째 페이지 여부
    private boolean isLast;       // 마지막 페이지 여부
    
    // 기본 생성자
    public PageDTO() {}
    
    // 생성자 - 페이징 정보 자동 계산
    public PageDTO(int currentPage, int pageSize, long totalElements) {
        this.currentPage = Math.max(1, currentPage); // 최소 1페이지
        this.pageSize = Math.max(1, pageSize);       // 최소 1개
        this.totalElements = Math.max(0, totalElements);
        
        // 전체 페이지 수 계산
        this.totalPages = (int) Math.ceil((double) totalElements / pageSize);
        
        // 페이지 네비게이션 계산 (1~10, 11~20 형태)
        int pageGroupSize = 10;
        this.startPage = ((currentPage - 1) / pageGroupSize) * pageGroupSize + 1;
        this.endPage = Math.min(startPage + pageGroupSize - 1, totalPages);
        
        // 상태 플래그 설정
        this.hasPrevious = currentPage > 1;
        this.hasNext = currentPage < totalPages;
        this.isFirst = currentPage == 1;
        this.isLast = currentPage == totalPages || totalPages == 0;
    }
    
    // SQL LIMIT용 오프셋 계산
    public int getOffset() {
        return (currentPage - 1) * pageSize;
    }
    
    // 이전 페이지 그룹 존재 여부
    public boolean hasPageGroupPrevious() {
        return startPage > 1;
    }
    
    // 다음 페이지 그룹 존재 여부  
    public boolean hasPageGroupNext() {
        return endPage < totalPages;
    }
    
    // 이전 페이지 그룹의 마지막 페이지
    public int getPageGroupPrevious() {
        return Math.max(1, startPage - 1);
    }
    
    // 다음 페이지 그룹의 첫 페이지
    public int getPageGroupNext() {
        return Math.min(totalPages, endPage + 1);
    }
    
    // Getter 메소드들
    public int getCurrentPage() { return currentPage; }
    public int getPageSize() { return pageSize; }
    public long getTotalElements() { return totalElements; }
    public int getTotalPages() { return totalPages; }
    public int getStartPage() { return startPage; }
    public int getEndPage() { return endPage; }
    public boolean isHasPrevious() { return hasPrevious; }
    public boolean isHasNext() { return hasNext; }
    public boolean isFirst() { return isFirst; }
    public boolean isLast() { return isLast; }
    
}
