package com.multi.personalfridge.socailuser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.multi.personalfridge.common.EmailService;
import com.multi.personalfridge.common.RandomStringGenerator;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.dto.SocialUserDTO;
import com.multi.personalfridge.user.UserService;

@Controller
public class SocialUserController {

	
	  private final SocialUserService socialService;
	  private final UserService userService;
	  
	  
	  @Autowired
	    public SocialUserController(UserService userService,
	    						SocialUserService socialService) {
	        this.userService = userService;
	        this.socialService = socialService;
	    }
	  
	  
	 //소셜 계정 정보 추가하기
    @PostMapping("/insertUserInfoBySocial")
    public String InsertUserInfoBySocial(UserDTO user, SocialUserDTO socialuser) {
    	System.out.println(socialuser);
    	socialService.SocialSignUp(socialuser);
    	boolean result = userService.insertUser(user);
    	if(result) {
        	return "redirect:/loginPage";
        }
        
        return "/error";
    }
    
   
}
