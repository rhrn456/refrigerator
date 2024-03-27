package com.multi.personalfridge.common;

import com.multi.personalfridge.dto.ShipDTO;
import com.multi.personalfridge.ship.ShipService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.Arrays;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.stereotype.Component;

@Component
public class ShipScheduler {

	  private final ShipService shipService;
	  private final Timer timer;

	  
	    public ShipScheduler(ShipService shipService) {
	        this.shipService = shipService;
	        this.timer = new Timer();
	    }

	    public void startScheduler(String ship_code) {
	        timer.scheduleAtFixedRate(new TimerTask() {
	            @Override
	            public void run() {
	                // 스케줄러가 실행될 때마다 주소 변경 처리
	                processAddressChange(ship_code);
	            }
	        }, 0, 60000); // 1분마다 실행
	    }

	    public void processAddressChange(String ship_code) {
	        // 사용자별로 ShipDTO를 가져오고 주소 변경 처리
	        ShipDTO ship = shipService.getShipByShipCode(ship_code);
	        if (ship != null) {
	            String address = ship.getArrive(); // 현재 주소 가져오기
	            String now_location = ship.getNow_location();
	            if (now_location.equals(address)) {
	                // 현재 위치와 목적지가 같으면 스케줄러를 멈추고 해당 ship_code를 가진 데이터를 삭제
	            	shipService.PassShip(ship.getShip_id());
	                timer.cancel();
	        } else {
            // 주소 변경 로직
            switch (address) {
                case "전라북도":
                    changeAddress(ship, "용인");
                    break;
                case "전라남도":
                    changeAddress(ship, "용인", "대전", "광주");
                    break;
                case "충청북도":
                    changeAddress(ship, "용인", "충청북도");
                    break;
                case "충청남도":
                    changeAddress(ship, "용인", "충청남도");
                    break;
                case "경상남도":
                    changeAddress(ship, "용인", "충주", "구미");
                    break;
                case "경상북도":
                    changeAddress(ship, "용인", "원주", "영주");
                    break;
                case "부산":
                    changeAddress(ship, "용인", "구미", "대구","부산");
                    break;
                case "강원도":
                    changeAddress(ship, "양평", "홍천", "강원도");
                    break;
                case "서울":
                    changeAddress(ship, "인천", "서울");
                    break;
                case "경기":
                    changeAddress(ship, "인천", "경기");
                    break;
                default:
                    // 기타 처리
                    break;
            }
        }
	  } else {
	}
}
    


    private void changeAddress(ShipDTO ship, String... addresses) {
        // 다음 도시로 주소 변경
    	shipService.VisitShip(ship.getShip_id());
        int currentIndex = Arrays.asList(addresses).indexOf(ship.getNow_location());
        int nextIndex = (currentIndex + 1) % addresses.length;
        String nextAddress = addresses[nextIndex];
        ship.setNow_location(nextAddress);

        // 변경된 주소를 데이터베이스에 저장
        shipService.UpdateShip(ship);
    }
    
}