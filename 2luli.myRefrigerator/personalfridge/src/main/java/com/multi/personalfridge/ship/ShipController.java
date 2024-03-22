package com.multi.personalfridge.ship;

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
	
	  @GetMapping("ship")
	  public String shippage() {
		  return "/shipping/shipinfo";
	  }
	 
	  @PostMapping("/delevery")
	  @ResponseBody
	  public String delevery(@RequestBody ShipDTO ship, HttpServletRequest request) {
		  HttpSession session = request.getSession();
		  String userId = (String) session.getAttribute("userId");
		  String str = random.generateRandomString();
		  ship.setShip_code(str);
		  ship.setNow_location("이루리");
		  ship.setUser_id(userId);
		  System.out.println(ship);
		  boolean result = shipService.inserShipInfo(ship);
		  System.out.println(shipService.getShipByShipCode(str));
		  if(result) {
			  System.out.println("성공");
			  shipScheduler.startScheduler(ship.getShip_code());
		 return "sucess";
	  }else {
			return "error";
			}
	  }
	  
	  @GetMapping("checkshipload")
	  public String checkshipload(HttpServletRequest request, Model model) {
	      HttpSession session = request.getSession();
	      String userId = (String) session.getAttribute("userId");
	      List<ShipDTO> shipList = shipService.getShipByUserId(userId);
	      System.out.println(shipList);
	      Map<String, List<ShipDTO>> groupedShipList = shipList.stream()
	       .collect(Collectors.groupingBy(ShipDTO::getShip_code));
	      model.addAttribute("groupedShipList", groupedShipList); 
	      return "/mypage/checkshipload";
	  }
	 
}
