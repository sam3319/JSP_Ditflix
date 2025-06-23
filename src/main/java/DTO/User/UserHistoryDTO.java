package DTO.User;

import java.time.LocalDateTime;

public class UserHistoryDTO {
	private Long UserHistoryId;
	private String loginId;
	private String UserIP;
	private LocalDateTime AccessAt;
	private String UserAgent;
	
	public Long getUserHistoryId() {
		return UserHistoryId;
	}
	public void setUserHistoryId(Long userHistoryId) {
		UserHistoryId = userHistoryId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getUserIP() {
		return UserIP;
	}
	public void setUserIP(String userIP) {
		UserIP = userIP;
	}
	public LocalDateTime getAccessAt() {
		return AccessAt;
	}
	public void setAccessAt(LocalDateTime accessAt) {
		AccessAt = accessAt;
	}
	public String getUserAgent() {
		return UserAgent;
	}
	public void setUserAgent(String userAgent) {
		UserAgent = userAgent;
	}
	
	public UserHistoryDTO(String loginId, String userIP, String userAgent) {
		this.loginId = loginId;
		UserIP = userIP;
		UserAgent = userAgent;
	}
}
