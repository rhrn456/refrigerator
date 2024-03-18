package com.multi.personalfridge.socailuser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.SocialUserDTO;
import com.multi.personalfridge.dto.UserDTO;

@Service
public class SocialUserService {

	@Autowired
	SocialUserMapper socialuserMapper;
	

	public boolean SocialSignUp(SocialUserDTO socialuser) {
		try{
			socialuserMapper.SocialSignUp(socialuser);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}


	public String CheckToken(String jwtToken) {
		
		return socialuserMapper.CheckToken(jwtToken);
	}


	public UserDTO getUserInfo(String user_id) {
		
		return socialuserMapper.getUserInfo(user_id);
	}

	//


}
