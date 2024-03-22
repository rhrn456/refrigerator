package com.multi.personalfridge.ship;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.ShipDTO;

@Service
public class ShipService {

	@Autowired
	ShipMapper shipMapper;
	
	public ShipDTO getShipByShipCode(String ship_code) {
		
		return shipMapper.getShipByShipCode(ship_code);
	}

	public boolean inserShipInfo(ShipDTO ship) {
		try {
			shipMapper.inserShipInfo(ship);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	public void UpdateShip(ShipDTO ship) {
		shipMapper.UpdateShip(ship);
		
	}

	public void PassShip(int ship_id) {
		shipMapper.PassShip(ship_id);
		
	}

	public void deleteShipByShipCode(String ship_code) {
		shipMapper.deleteShipByShipCode(ship_code);
		
	}

	public List<ShipDTO> getShipByUserId(String userId) {
		
		return shipMapper.getShipByUserId(userId);
	}
}
