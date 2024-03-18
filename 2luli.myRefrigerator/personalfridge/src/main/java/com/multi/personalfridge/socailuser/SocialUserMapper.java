package com.multi.personalfridge.socailuser;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.SocialUserDTO;
import com.multi.personalfridge.dto.UserDTO;

@Mapper
public interface SocialUserMapper {

	int SocialSignUp(SocialUserDTO socialuser);

	String CheckToken(String access_token);

	UserDTO getUserInfo(String user_id);


}
