package com.multi.personalfridge.ship;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.ShipDTO;
import com.multi.personalfridge.dto.ShipItemDTO;

@Service
public class ShipService {

	@Autowired
	ShipMapper shipMapper;
	
	//송장번호를 통한 이동경로 가져오기
	public ShipDTO getShipByShipCode(String ship_code) {
		
		return shipMapper.getShipByShipCode(ship_code);
	}

	//새로운 이동 스케줄 저장
	public void UpdateShip(ShipDTO ship) {
		shipMapper.UpdateShip(ship);
		
	}
	//목적지 도착시 체크
	public void PassShip(int ship_id) {
		shipMapper.PassShip(ship_id);
		
	}
	//배송 내역 삭제
	public boolean deleteShipByShipCode(String ship_code) {
		try {
			shipMapper.deleteShipByShipCode(ship_code);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//사용자 배송 내역 조회
	public List<ShipDTO> getShipByUserId(String userId) {
		
		return shipMapper.getShipByUserId(userId);
	}
	
	//사용자가 구매한 제품 배송 리스트 전부가져오기 
	public List<ShipDTO> getAllShipInfoAdmin() {
		return shipMapper.getAllShipInfoAdmin();
	}
	//관리자가 승인한 제품 배송
	public boolean UpdateShipAndAdminCheck(String ship_code) {
	
		try {
			shipMapper.UpdateShipAndAdminCheck(ship_code);
			return true;
		} catch (Exception e) {
			return false;		
		}
	}
   //사용자가 구매한 제품 배송 리스트 페이징
	public List<ShipDTO> getAllShipPage(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return shipMapper.getAllShipPage(parameters);
	}
	//송장번호에 해당하는 정보 가져오기
	public List<ShipItemDTO> getAllItemByShipCode(String ship_code) {
		
		return shipMapper.getAllItemByShipCode(ship_code);
	}
	//배송 현황 페이징
	public List<ShipDTO> getAllShipSchedulePage(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return shipMapper.getAllShipSchedulePage(parameters);
	}
	//배송 시작된 목록 전부 가져오기
	public List<ShipDTO> getAllShipSchdule() {
		
		return shipMapper.getAllShipSchdule();
	}
	//송장코드에 해당하는 이동 경로 조회
	public List<ShipDTO> MovingShipSchedule(String ship_code) {
		
		return shipMapper.MovingShipSchedule(ship_code);
	}
	public void VisitShip(Integer ship_id) {
		
		shipMapper.VisitShip(ship_id);
	}

	public List<ShipDTO> getShipALL(String ship_code) {
		// TODO Auto-generated method stub
		return shipMapper.getShipALL(ship_code);
	}
}
