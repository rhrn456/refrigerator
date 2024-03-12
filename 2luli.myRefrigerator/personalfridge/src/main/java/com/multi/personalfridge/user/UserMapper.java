package com.multi.personalfridge.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.UserDTO;

@Mapper
public interface UserMapper {
	
	// 회원가입
	int insertUser(UserDTO dto);

	UserDTO login(String userId, String password);

	int updateUser(String userId, UserDTO userDTO);

	int deleteUser(String userId, String password);

	UserDTO getUserById(String userId);

	List<UserDTO> getAlluser();

	List<UserDTO> getAllUserPage(Map parameters);

	int deleteUserAdmin(String user_id);

	int userUpdateToManager(String user_id);

	List<UserDTO> getAlluserByKeyword(Map parameters);
	
	List<UserDTO> getAllUserByKewordPage(Map parameters);

	
}
