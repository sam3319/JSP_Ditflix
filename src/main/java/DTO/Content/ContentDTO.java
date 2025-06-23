package DTO.Content;

public class ContentDTO {
    private Long contentId;
    private String title;
    private String info;
    private String genre;
    private String releaseDate;
    private String director;
    private String ageRating;
    private String posterFileName;
    private String thumbnailFileName;
    
    // 기본 생성자
    public ContentDTO() {}
    
    // 전체 생성자
    public ContentDTO(Long contentId, String title, String info, String genre, 
                     String releaseDate, String director, String ageRating, 
                     String posterFileName, String thumbnailFileName) {
        this.contentId = contentId;
        this.title = title;
        this.info = info;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.director = director;
        this.ageRating = ageRating;
        this.posterFileName = posterFileName;
        this.thumbnailFileName = thumbnailFileName;
    }
    
    // Getter/Setter
    public Long getContentId() { return contentId; }
    public void setContentId(Long contentId) { this.contentId = contentId; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getInfo() { return info; }
    public void setInfo(String info) { this.info = info; }
    
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    
    public String getReleaseDate() { return releaseDate; }
    public void setReleaseDate(String releaseDate) { this.releaseDate = releaseDate; }
    
    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }
    
    public String getAgeRating() { return ageRating; }
    public void setAgeRating(String ageRating) { this.ageRating = ageRating; }
    
    public String getPosterFileName() { return posterFileName; }
    public void setPosterFileName(String posterFileName) { this.posterFileName = posterFileName; }
    
    public String getThumbnailFileName() { return thumbnailFileName; }
    public void setThumbnailFileName(String thumbnailFileName) { this.thumbnailFileName = thumbnailFileName; }
    
    // 이미지 경로 반환 메소드
    public String getPosterPath() {
        return "/images/posters/" + posterFileName;
    }
    
    public String getThumbnailPath() {
        return "/images/thumbnails/" + thumbnailFileName;
    }
}
