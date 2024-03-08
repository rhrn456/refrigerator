package com.multi.personalfridge.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
	
	
	
	
	
	
	
	
	
}
