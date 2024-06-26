package com.multi.personalfridge.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.dto.UserLikeDTO;

@Mapper
public interface UserMapper {
	
	// 회원가입
	int insertUser(UserDTO dto);

	UserDTO login(String user_id);
	
	UserDTO getUserByEmailAndName(String user_name, String mail);
	
	//마이페이지 수정
	int updateUser(UserDTO user);

	// 마이페이지 회원탈퇴
	int deleteUser(String user_id);
	
	// 마이페이지 비밀번호조회
	int selectPassword(String user_id, String password);
	
	//마이페이지 비밀번호 변경
	int updatePassword(UserDTO user);

	UserDTO getUserById(String user_id);

	List<UserDTO> getAlluser();

	List<UserDTO> getAllUserPage(Map parameters);

	int deleteUserAdmin(String user_id);

	int userUpdateToManager(String user_id);

	List<UserDTO> getAlluserByKeyword(Map parameters);
	
	List<UserDTO> getAllUserByKewordPage(Map parameters);
	
	int InsertUserInfoBySocial(UserDTO user);
		
//	찜목록 조회
	List<RecipeDTO> getUserLike(String user_id);
	
//  마이페이지 유저 정보 조회
	UserDTO getUserInfo(String user_id);

	int insertUserLike(int recipe_id, String user_id);

	UserLikeDTO searchUserLike(Map parameters);

	int deleteUserLike(Map parameters);
	
//------------------------------------------------------
	void paid(Map<String, Object> map);

	void rePaid(Map<String, Object> map);

	String paidCheck(String ID);

	void updateDietByUserId(@Param("userId") String userId,@Param("dietOption") String dietOption);

	
	
	
}
