package com.multi.personalfridge.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class UserDTO {
	private String userId;
	private String password;
	private String userName;
	private String mail;
	private String adress;
	private Integer phone;
	private Boolean adminNum;
	private Boolean managerNum;
	private Timestamp createUserDate;
	private Timestamp deleteUserDate;
	private Boolean deletePlug;
	private String deleteContent;
}
