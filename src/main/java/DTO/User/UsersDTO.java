package DTO.User;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UsersDTO {
	private Long usersId;
	private String loginId;
	private String nickName;
	private String email;
	private String phone;
	private String userPassword;
	private String gender;
	private String profileFileName;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	

	
    public Long getUsersId() {
		return usersId;
	}

	public void setUsersId(Long usersId) {
		this.usersId = usersId;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfileFileName() {
		return profileFileName;
	}

	public void setProfileFileName(String profileFileName) {
		this.profileFileName = profileFileName;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	// 회원가입용
    public UsersDTO(String loginId, String nickName, String email, 
                   String phone, String userPassword, String gender) {
        this.loginId = loginId;
        this.nickName = nickName;
        this.email = email;
        this.phone = phone;
        this.userPassword = userPassword;
        this.gender = gender;
    }
    
    // 전체
    public UsersDTO(Long usersId, String loginId, String nickName, String email,
                   String phone, String userPassword, String gender, 
                   String profileFileName, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.usersId = usersId;
        this.loginId = loginId;
        this.nickName = nickName;
        this.email = email;
        this.phone = phone;
        this.userPassword = userPassword;
        this.gender = gender;
        this.profileFileName = profileFileName;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
	
    public UsersDTO() {}
}
