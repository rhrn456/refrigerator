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

	UserDTO login(String user_id);
	
	UserDTO getUserByEmailAndName(String user_name, String mail);

	int updateUser(UserDTO user);

	int deleteUser(String user_id, String password);

	UserDTO getUserById(String user_id);

	List<UserDTO> getAlluser();

	List<UserDTO> getAllUserPage(Map parameters);

	int deleteUserAdmin(String user_id);

	int userUpdateToManager(String user_id);

	List<UserDTO> getAlluserByKeyword(Map parameters);
	
	List<UserDTO> getAllUserByKewordPage(Map parameters);

	int InsertUserInfoBySocial(UserDTO user);


	
}
