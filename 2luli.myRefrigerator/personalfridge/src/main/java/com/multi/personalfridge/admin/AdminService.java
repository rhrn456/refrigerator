package com.multi.personalfridge.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.UserDTO;

@Service
public class AdminService {

	@Autowired
	AdminMapper mapper;

	public List<UserDTO> getAlluser() {
		
		return mapper.getAlluser();
	}

}
