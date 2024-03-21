package com.multi.personalfridge.snsapi;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.multi.personalfridge.cart.CartService;
import com.multi.personalfridge.common.RandomStringGenerator;
import com.multi.personalfridge.dto.SocialUserDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.socailuser.SocialUserService;
import com.multi.personalfridge.user.UserService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class SnsController {
	
	@Autowired
	RandomStringGenerator random;
	@Autowired 
	SocialUserService socialService;
	@Autowired
	UserService userService;
	@Autowired
	CartService cartService;
	
	@Value("${google.client.id}")
    private String googleClientId;
    @Value("${google.client.secret}")
    private String googleClientPw;
	    

	

	@GetMapping("/socalLogin")
	public void socalLogin(HttpServletResponse response) {
		String redirectURL;
		redirectURL = loginUrlGoogle();
		try {
			response.sendRedirect(redirectURL);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@PostMapping("/login/oauth2/code/google")
    public String loginUrlGoogle(){
		//Token 받기위한 리다이렉트 url 설정 및 clientId값 주기
        String reqUrl = "https://accounts.google.com/o/oauth2/v2/auth?client_id=" + googleClientId
                + "&redirect_uri=http://localhost:8077/login/oauth2/code/google"
                + "&response_type=code&scope=email%20profile%20openid&access_type=offline";
        return reqUrl;
  
    }
	
	@GetMapping("/login/oauth2/code/google")
    public String loginGoogle(@RequestParam(value = "code") String authCode, HttpSession session, Model model){
        RestTemplate restTemplate = new RestTemplate();
        GoogleRequest googleOAuthRequestParam = GoogleRequest
                .builder()
                .clientId(googleClientId)
                .clientSecret(googleClientPw)
                .code(authCode)
                .redirectUri("http://localhost:8077/login/oauth2/code/google")
                .grantType("authorization_code").build();
        ResponseEntity<GoogleResponse> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token",
                googleOAuthRequestParam, GoogleResponse.class);
        String jwtToken=resultEntity.getBody().getId_token();
        Map<String, String> map=new HashMap<>();
        map.put("id_token",jwtToken);
        ResponseEntity<GoogleInfResponse> resultEntity2 = restTemplate.postForEntity("https://oauth2.googleapis.com/tokeninfo",
                map, GoogleInfResponse.class);
        String mail=resultEntity2.getBody().getEmail();       
        String name = resultEntity2.getBody().getFamily_name() + resultEntity2.getBody().getGiven_name();
        String str = random.generateRandomString();
        String userid = str;
        String password = str;
        String snstype = "google";
        SocialUserDTO socialuser = new SocialUserDTO();
        
        String first50Characters = jwtToken.substring(0, Math.min(jwtToken.length(), 50));
        ModelAndView mv = new ModelAndView();
    	String user_id = socialService.CheckToken(first50Characters);
        if(user_id == null || user_id =="") {
        	mv.setViewName("user/socialplusinfo");
            model.addAttribute("mail", mail);
            model.addAttribute("name", name);
            model.addAttribute("userid", userid);
            model.addAttribute("password", password);
            model.addAttribute("sns_type", snstype);
            model.addAttribute("access_token", first50Characters);
        	return "user/socialplusinfo";
        	
        }

    	UserDTO user = userService.getUserById(user_id);
    	if(user == null) {
    		 mv.setViewName("/loginPage");
    		return "/loginPage";
    	}
    	int cartCount = cartService.getCartCount(user.getUser_id());
    	session.setAttribute("userId", user.getUser_id());
        session.setAttribute("userAdmin", user.getJob_num());
        session.setAttribute("cartCount", cartCount);
        mv.setViewName("redirect:/");
        return "redirect:/";
    }
}
