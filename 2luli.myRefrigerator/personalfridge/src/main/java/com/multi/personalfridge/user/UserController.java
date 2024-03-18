package com.multi.personalfridge.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.personalfridge.common.EmailService;
import com.multi.personalfridge.common.RandomStringGenerator;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.dto.UserLikeDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	

	
    private final UserService userService;
    private final EmailService emailService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final RandomStringGenerator randomPassword;

    @Autowired
    public UserController(UserService userService,
    					EmailService emailService,
    					BCryptPasswordEncoder passwordEncoder,
    					RandomStringGenerator randomPassword) {
        this.userService = userService;
        this.emailService = emailService;
        this.passwordEncoder = passwordEncoder;
        this.randomPassword = randomPassword;
    }
    //이동 페이지
	@GetMapping("/goPage")
	public String goPage(HttpServletRequest request) {
		 String userId = (String) request.getSession().getAttribute("userId");
	     Integer userAdmin = (Integer) request.getSession().getAttribute("userAdmin");
	            if (userAdmin != null && (userAdmin == 1 || userAdmin == 2)) {
	                return "redirect:/admin";
	                
	            } else if (userId != null) {
		            return "redirect:/mypage?user_id=" + userId;
		            
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
	   
   	UserDTO user = userService.login(user_id);

   	//비크립트로 비밀번호 검증
   	if (user != null && passwordEncoder.matches(password, user.getPassword()) ) {
	    	session.setAttribute("userId", user.getUser_id());
	        session.setAttribute("userAdmin", user.getJob_num());
	        session.setMaxInactiveInterval(300);
	        //관리자/매니저라면 관리자 페이지로 사용자는 메인으로
   	if(user.getJob_num() == 1 || user.getJob_num() == 2){
   		return "redirect:/admin";  
	   	} else {
	   		return "redirect:/";
	   	}
		} else {
		   	return "error";
	 }
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
    public String insertUser(UserDTO user, HttpSession session) {
        boolean result = userService.insertUser(user);        
        if(result) {
        	return "redirect:/loginPage";
        }
        
        return "redirect:/signupPage";
    }
    @GetMapping("/test")
    public String test() {
    	return "user/socialplusinfo";
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
    	String userId = user.getUser_id();
    	model.addAttribute("userId", userId);
    	return "user/getuserid"; 
    }
    //비밀번호 찾기 페이지 이동
    @GetMapping("/findPasswordPage")
    public String findPasswordPage() {
    	return "user/findpassword";
    }
    //비밀번호 찾기
    @PostMapping("/findPassword")
    public String findPassword(@RequestParam String mail, String user_name) {
    	UserDTO user = userService.getUserByEmailAndName(user_name, mail);
    	
    	//랜덤 비밀번호 생성 후 메일로 보내기
    	String str = randomPassword.generateRandomString();
    	emailService.sendSimpleMessage(mail, "우리집 AI 냉장고 임시 비밀번호 발송해드렸습니다.", str.toString());
    	
    	//생성된 랜덤 비밀번호로 사용자 비밀번호 면경 변경
    	user.setPassword(str);
    	String hashedPassword = passwordEncoder.encode(user.getPassword());
    	user.setPassword(hashedPassword);
    	boolean result = userService.updateUser(user);
    	if(result) {
    		return "redirect:/loginPage";
    	}
    	return "error"; 
    }
    
  //마이페이지 접속 및 조회
    @GetMapping("/mypage")
    public ModelAndView getUserInfo(@RequestParam String user_id) {
    	System.out.println(user_id);
    	ModelAndView mav = new ModelAndView("mypage/mypage");
    	UserDTO mypage = userService.getUserInfo(user_id);
        mav.addObject("mypage", mypage);
//        System.out.println("UserController" + mypage);
        return mav;
    }
     
//    // 마이페이지 정보 업데이트
//    @PostMapping("/mypage/update")
//    public String updateMyPage(@ModelAttribute UserDTO user) {
//        userService.updateUser(user);
//        return "redirect:/mypage?userId=" + user.getUser_id();
//    }

////     마이페이지 계정 삭제
//    @PostMapping("/mypage/delete")
//    public String deleteAccount(@RequestParam("user_id") String userId, HttpSession session, RedirectAttributes redirectAttributes) {
//        // 세션에서 사용자 ID 가져오기 (로그인한 사용자와 일치하는지 확인)
//        String loggedInUserId = (String) session.getAttribute("userId");
//        if (loggedInUserId == null || !loggedInUserId.equals(userId)) {
//            return "redirect:/loginPage"; // 로그인 페이지로 리디렉션
//        }
//        
//        // 회원 탈퇴 처리
//        int deleteResult = userService.deleteUser(userId);
//        if (deleteResult > 0) {
//            // 탈퇴 성공, 세션 무효화
//            session.invalidate();
//            redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 성공적으로 처리되었습니다.");
//            return "redirect:/loginPage";
//        } else {
//            // 탈퇴 실패 처리
//            redirectAttributes.addFlashAttribute("error", "회원 탈퇴 처리 중 오류가 발생했습니다.");
//            return "redirect:/mypage?user_id=" + userId;
//        }
//    }
    
    // 환불 및 교환 시 연락처/이메일 페이지 이동
    @GetMapping("/refundPage")
    public String refundPage() {
        return "mypage/refund"; // 환불/교환 페이지로 이동
    }
    
    // 마이페이지 찜 목록
    @GetMapping("/mypage/userlike")
    public ModelAndView getUserLike(@RequestParam String user_id) {
    	ModelAndView mav = new ModelAndView("mypage/userlike");
    	List<UserLikeDTO> likeList = userService.getUserLike(user_id);
        mav.addObject("likeList", likeList);      
//        System.out.println(likeList.size());
        return mav;
    }
    

    
    
}

