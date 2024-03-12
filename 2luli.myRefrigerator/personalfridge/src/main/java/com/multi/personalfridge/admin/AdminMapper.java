package com.multi.personalfridge.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.UserDTO;

@Mapper
public interface AdminMapper {

	public List<UserDTO> getAlluser();

	public List<UserDTO> getAllManager();

	public List<UserDTO> getAllManagerPage(Map parameters);

	public int ManagerUpdateToUser(String user_id);

	public List<UserDTO> getAllManagerByKeywordPage(Map parameters);

	public List<UserDTO> getAllManagerByKeyword(Map parameters);

}
