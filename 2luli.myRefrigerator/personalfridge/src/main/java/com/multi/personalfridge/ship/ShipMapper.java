package com.multi.personalfridge.ship;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.multi.personalfridge.dto.ShipDTO;
import com.multi.personalfridge.dto.ShipItemDTO;

@Mapper
public interface ShipMapper {

	public ShipDTO getShipByShipCode(String ship_code);

	public int inserShipInfo(ShipDTO ship);

	public void UpdateShip(ShipDTO ship);

	public void PassShip(int ship_id);

	public int deleteShipByShipCode(String ship_code);

	public List<ShipDTO> getShipByUserId(String user_id);

	public List<ShipDTO> getAllShipInfoAdmin();

	public int UpdateShipAndAdminCheck(String ship_code);

	public List<ShipDTO> getAllShipPage(Map parameters);

	public List<ShipItemDTO> getAllItemByShipCode(String ship_code);

	public List<ShipDTO> getAllShipSchedulePage(Map<String, Object> parameters);

	public List<ShipDTO> getAllShipSchdule();

	public List<ShipDTO> MovingShipSchedule(String ship_code);

		
	

}
