package com.multi.personalfridge.ship;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.multi.personalfridge.dto.ShipDTO;

@Mapper
public interface ShipMapper {

	public ShipDTO getShipByShipCode(String ship_code);

	public int inserShipInfo(ShipDTO ship);

	public void UpdateShip(ShipDTO ship);

	public void PassShip(int ship_id);

	public void deleteShipByShipCode(String ship_code);

	public List<ShipDTO> getShipByUserId(String user_id);
		
	

}
