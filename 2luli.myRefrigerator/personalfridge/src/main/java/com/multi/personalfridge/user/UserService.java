package com.multi.personalfridge.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.UserDTO;


@Service
public class UserService {
	private final UserMapper userMapper;

    @Autowired
    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
	
	//로그인
	public UserDTO login(String userId, String password) {
        return userMapper.login(userId, password);
    }
	
	// 회원가입
	public int insertUser(UserDTO dto) {
		return userMapper.insertUser(dto);
	}
	
	// 회원탈퇴
	public int deleteUser(String userId, String password) {
		return userMapper.deleteUser(userId, password);
	}

	// 회원정보 수정
	public int updateUser(String userId, UserDTO userDTO) {
		return userMapper.updateUser(userId, userDTO);
		
	}

	public UserDTO getUserById(String userId) {
		return userMapper.getUserById(userId);
	}

	public List<UserDTO> getAlluser() {
		
		return userMapper.getAlluser();
	}

	public List<UserDTO> getAllUserPage(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return userMapper.getAllUserPage(parameters);
	}

	public boolean deleteUserAdmin(String user_id) {
		try {
			userMapper.deleteUserAdmin(user_id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	public boolean userUpdateToManager(String user_id) {
		try {
			userMapper.userUpdateToManager(user_id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	public List<UserDTO> getAlluserByKeyword(String keyword) {
		Map<String, String> parameters = new HashMap<>();
		parameters.put("keyword", keyword);
		return userMapper. getAlluserByKeyword(parameters);
	}

	public List<UserDTO> getAllUserByKewordPage(String keyword, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("keyword", keyword);
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return userMapper.getAllUserByKewordPage(parameters);
	}



	
	
	
	
	
	
	
	
}
