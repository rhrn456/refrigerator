package com.multi.personalfridge.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	@Autowired
	AdminMapper mapper;

	public List<AdminDTO> getAlluser() {
		
		return mapper.getAlluser();
	}

}