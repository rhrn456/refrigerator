package com.multi.personalfridge.user;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.UserDTO;

@Mapper
public interface UserMapper {
	
	// 회원가입
	int insertUser(UserDTO dto);

	UserDTO login(String userId, String password);

	int updateUser(String userId, UserDTO userDTO);

	int deleteUser(String userId, String password);

	UserDTO getUserById(String userId);
	
}
