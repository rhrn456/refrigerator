package com.multi.personalfridge.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.UserDTO;

@Mapper
public interface AdminMapper {

	public List<UserDTO> getAlluser();

}
