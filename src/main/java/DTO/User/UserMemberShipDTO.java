package DTO.User;

import java.time.LocalDateTime;

public class UserMemberShipDTO {
	private Long userMemberShipId;
	private Long memberShipId;
	private Long loginId;
	private LocalDateTime startDate;
	private LocalDateTime endDate;

	public UserMemberShipDTO(Long memberShipId, Long loginId, LocalDateTime startDate, LocalDateTime endDate) {
		this.memberShipId = memberShipId;
		this.loginId = loginId;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public Long getUserMemberShipId() {
		return userMemberShipId;
	}
	public void setUserMemberShipId(Long userMemberShipId) {
		this.userMemberShipId = userMemberShipId;
	}
	public Long getMemberShipId() {
		return memberShipId;
	}
	public void setMemberShipId(Long memberShipId) {
		this.memberShipId = memberShipId;
	}
	public Long getLoginId() {
		return loginId;
	}
	public void setLoginId(Long loginId) {
		this.loginId = loginId;
	}
	public LocalDateTime getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}
	public LocalDateTime getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDateTime endDate) {
		this.endDate = endDate;
	}
	
	
	
}
