package ch20.oracle.sec09.exam01;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userName;
	private String userPassword;
	private int userAge;
	private String userEmail;

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
