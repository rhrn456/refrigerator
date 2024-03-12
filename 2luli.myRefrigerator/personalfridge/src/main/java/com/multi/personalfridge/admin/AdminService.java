package com.multi.personalfridge.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.UserDTO;

@Service
public class AdminService {

	@Autowired
	AdminMapper adminmapper;

	public List<UserDTO> getAlluser() {
		
		return adminmapper.getAlluser();
	}

	public List<UserDTO> getAllManager() {
	
		return adminmapper.getAllManager();
	}

	public List<UserDTO> getAllManagerPage(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return adminmapper.getAllManagerPage(parameters);
	}

	public boolean ManagerUpdateToUser(String user_id) {
		try {
			adminmapper.ManagerUpdateToUser(user_id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}
	
	public List<UserDTO> getAllManagerByKeywordPage(String keyword, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("keyword", keyword);
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return adminmapper.getAllManagerByKeywordPage(parameters);
	}

	public List<UserDTO> getAllManagerByKeyword(String keyword) {
		Map<String, String> parameters = new HashMap<>();
		parameters.put("keyword", keyword);
		return adminmapper.getAllManagerByKeyword(parameters);
	}
}
