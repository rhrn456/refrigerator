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
	private String user_id;
	private String password;
	private String user_name;
	private String mail;
	private String adress;
	private String phone;
	private int job_num;
	private Timestamp create_user_date;
	private Timestamp delete_user_date;
	private int delete_plug;
	private String delete_content;
	private String diet;
}
