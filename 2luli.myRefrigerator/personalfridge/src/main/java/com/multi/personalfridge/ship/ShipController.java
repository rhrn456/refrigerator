package com.multi.personalfridge.ship;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.multi.personalfridge.common.RandomStringGenerator;
import com.multi.personalfridge.common.ShipScheduler;
import com.multi.personalfridge.dto.ShipDTO;
import com.multi.personalfridge.dto.UserLikeDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ShipController {

	@Autowired
	RandomStringGenerator random;
	@Autowired
	ShipScheduler shipScheduler;
	@Autowired
	ShipService shipService;
	  
	  @GetMapping("/mypage/checkshipload")
	  public String checkshipload(HttpServletRequest request, Model model) {
		  String userId = (String) request.getSession().getAttribute("userId");
	      List<ShipDTO> shipList = shipService.getShipByUserId(userId);
	      // 송장 번호별로 그룹화된 맵 생성
	      Collections.sort(shipList, Comparator.comparing(ShipDTO::getShip_id));
	      Map<String, List<ShipDTO>> groupedShipList = shipList.stream()
	       .collect(Collectors.groupingBy(ShipDTO::getShip_code));
	      
	      groupedShipList.values().forEach(list -> {
	    	    Collections.sort(list, Comparator.comparing(ShipDTO::getShip_id));
	    	});

	    	// 정렬된 첫 번째 ShipDTO를 기준으로 재배치
	    	List<Map.Entry<String, List<ShipDTO>>> sortedGroupedList = new ArrayList<>(groupedShipList.entrySet());
	    	Collections.sort(sortedGroupedList, Comparator.comparing(entry -> entry.getValue().get(0).getShip_id()));

	    	// 정렬된 리스트를 다시 맵으로 변환
	    	LinkedHashMap<String, List<ShipDTO>> sortedGroupedShipList = new LinkedHashMap<>();
	    	sortedGroupedList.forEach(entry -> sortedGroupedShipList.put(entry.getKey(), entry.getValue()));

	      model.addAttribute("sortedGroupedShipList", sortedGroupedShipList); 
	      return "/mypage/checkshipload";
	  }
	  
	  @GetMapping("/checkwheredelivery")
	  @ResponseBody
		public int searchUserLike(@RequestParam String ship_code) {
		  List<ShipDTO> shipList = shipService.getShipALL(ship_code);
		  int result = 1;
		  for (ShipDTO ship : shipList) {
	            if (ship.getGo_on() == 0) {
	                result = 0;
	            } else if (ship.getGo_on() == 3) {
	            	result = 3;
	            }
	        }
		  return result;
	  }
	  
	  @GetMapping("/searchShipList")
	  @ResponseBody
		public Map<String, Object> searchShipListUser(@RequestParam String ship_code) {
			List<ShipDTO> shipList = shipService.getShipALL(ship_code);
			Map<String, List<ShipDTO>> groupedShipList = shipList.stream()
					.collect(Collectors.groupingBy(ShipDTO::getShip_code));
			Map<String, Object> response = new HashMap<>();
			response.put("groupedShipList", groupedShipList); 
			return response;
		}
	 
}
