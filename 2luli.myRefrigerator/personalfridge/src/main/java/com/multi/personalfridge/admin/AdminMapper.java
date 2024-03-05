package com.multi.personalfridge.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

	public List<AdminDTO> getAlluser();

}
