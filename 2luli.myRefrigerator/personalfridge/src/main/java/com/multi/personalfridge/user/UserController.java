package com.multi.personalfridge.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.multi.personalfridge.dto.UserDTO;

@Controller
public class UserController {

	private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
	
    // 로그인
	@GetMapping("/loginpage")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
    public UserDTO login(@RequestParam String userId, @RequestParam String password) {
		return userService.login(userId, password);
		
    }
	
	
	//회원가입
	@GetMapping("/join")
	public String join() {
		return "join"; 
	}
	
	//일반 회원가입
	@PostMapping("/signup")
	public String insertUser(UserDTO dto) {
		int result = userService.insertUser(dto);
		
		return "redirect:/";
	}
	
	
 // 사용자 삭제
//    @GetMapping("/{userId}")
//    public String deleteUser(@PathVariable String userId, @PathVariable String password) {
//        userService.deleteUser(userId, password);
//        return "redirect:/";
//    }

    // 사용자 정보 수정
    @PostMapping("/{userId}")
    public String updateUser(@PathVariable String userId, @RequestBody UserDTO userDTO) {
        userService.updateUser(userId, userDTO);
        return "redirect:/{userId}";
    }
	
    
//    // 사용자 상세 정보 조회
//    @GetMapping("/{userId}")
//    public UserDTO getUserById(@PathVariable String userId) {
//    	return userService.getUserById(userId);
//    }
	
 // 마이페이지 조회
    @GetMapping("/mypage")
    public ModelAndView myPage(@RequestParam("userId") String userId) {
        ModelAndView mav = new ModelAndView("mypage");
        UserDTO user = userService.getUserById(userId);
        mav.addObject("user", user);
        return mav;
    }

    // 마이페이지 정보 업데이트
    @PostMapping("/mypage/update")
    public String updateMyPage(@ModelAttribute UserDTO user) {
        userService.updateUser(user.getUser_id(), user);
        return "redirect:/mypage?userId=" + user.getUser_id();
    }

    // 마이페이지 계정 삭제
//    @PostMapping("/mypage/delete")
//    public String deleteAccount(@RequestParam("userId") String userId) {
//        userService.deleteUser(userId, password);
//        return "redirect:/login";
//    }
}
