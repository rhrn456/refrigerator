package com.multi.personalfridge.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.personalfridge.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    //이동 페이지
	@GetMapping("/goPage")
	public String goPage(HttpServletRequest request) {
		 String userId = (String) request.getSession().getAttribute("userId");
	     Integer userAdmin = (Integer) request.getSession().getAttribute("userAdmin");
	     		
	            if (userAdmin != null && (userAdmin == 1 || userAdmin == 2)) {
	                return "redirect:/admin";
	                
	            } else if (userId != null) {
		            return "redirect:/";
		            
		        } else {
	                return "redirect:/loginPage";
		        }
	       }
	    
	
    // 로그인 페이지
    @GetMapping("/loginPage")
    public String loginPage() {
        return "user/login";
    }
    
    //로그인
    @PostMapping("/Login")
    public String login(@RequestParam String user_id, @RequestParam String password, HttpSession session, RedirectAttributes redirectAttributes) {
    	UserDTO user = userService.login(user_id, password);
    	session.setAttribute("userId", user.getUser_id());
        session.setAttribute("userAdmin", user.getJob_num());
    	if(user.getJob_num() == 0) {
    		return "redirect:/";
    	}else if(user.getJob_num() == 1 || user.getJob_num() == 2){
    	return "redirect:/admin";   
    	}
    	return "error";
    }
    
    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
        return "user/login";
    }
    
    
    //회원가입 페이지
    @GetMapping("/signupPage")
    public String signupPage() {
        return "user/signup"; 
    }
    
    //회원가입
    @PostMapping("/signup")
    public String insertUser(UserDTO user) {
        int result = userService.insertUser(user);
        
        return "redirect:/";
    }
    
    //아이디 찾기 페이지
    @GetMapping("/findIdPage")
    public String findIdPage() {
        return "user/findaccount"; 
    }
    
    //아이디 찾기
    @PostMapping("/findId")
    public String findId(@RequestParam String user_name, @RequestParam String mail, Model model) {
    	UserDTO user = userService.getUserByEmailAndName(user_name, mail);
    	System.out.println(user);
    	String userId = user.getUser_id();
    	model.addAttribute("userId", userId);
    	return "user/getuserid"; 
    }
    
    //비밀번호 찾기
    @GetMapping("/findPassword")
    public String findPassword() {
    	return "user/findpassword"; 
    }
    
    // 사용자 정보 수정
    @PostMapping("/{userId}")
    public String updateUser(@PathVariable String userId, @RequestBody UserDTO userDTO) {
        userService.updateUser(userId, userDTO);
        return "redirect:/{userId}";
    }
    
    
    
    //마이페이지 접속
    @GetMapping("/mypagein")
    public String MyPageIn(Model model) {
        String userId = "testuser"; // 유저테스트 정보 주입
         UserDTO user = userService.getUserById(userId);
         System.out.println(user);
         model.addAttribute("user",user);
        return "mypage";
    }
 // 마이페이지 조회
    @GetMapping("/mypage")
    public ModelAndView myPage(@RequestParam("userId") String userId) {
        userId = "usertest"; // 유저테스트 정보 주입
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

