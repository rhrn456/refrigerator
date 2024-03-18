package com.multi.personalfridge.dto;

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
public class SocialUserDTO {
	private Integer social_user_id;
	private String access_token;
	private String sns_type;
	private String user_id;
	
	
	
}
