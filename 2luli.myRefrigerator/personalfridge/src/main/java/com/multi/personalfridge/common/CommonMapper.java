package com.multi.personalfridge.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.personalfridge.dto.EmailSendDTO;

@Mapper
public interface CommonMapper {

	List<EmailSendDTO> getOverLimitProduct();

}
