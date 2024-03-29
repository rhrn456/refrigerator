package com.multi.personalfridge.user;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.personalfridge.cart.CartService;
import com.multi.personalfridge.common.EmailService;
import com.multi.personalfridge.common.RandomStringGenerator;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.dto.UserLikeDTO;
import com.multi.personalfridge.recipe.RecipeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	

	
    private final UserService userService;
    private final EmailService emailService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final RandomStringGenerator randomPassword;
    private final CartService cartService;
    private final RecipeService recipeService;

    @Autowired
    public UserController(UserService userService,
    					EmailService emailService,
    					BCryptPasswordEncoder passwordEncoder,
    					RandomStringGenerator randomPassword,
    					CartService cartService,
    					RecipeService recipeService) {
        this.userService = userService;
        this.emailService = emailService;
        this.passwordEncoder = passwordEncoder;
        this.randomPassword = randomPassword;
        this.cartService = cartService;
        this.recipeService = recipeService;
    }
    
    
    @GetMapping("/paygo")
    public String paygo() {
    	
    	return "pay_modal";
    }
    //이동 페이지
	@GetMapping("/goPage")
	public String goPage(HttpServletRequest request) {
		 String userId = (String) request.getSession().getAttribute("userId");
		 Integer userAdmin = (Integer) request.getSession().getAttribute("userAdmin");
			 if (userAdmin != null && (userAdmin == 1 || userAdmin == 2)) {
			        return "redirect:/admin/page";
			    } else if (userId != null) {
			        return "redirect:/mypage/info";
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
	   
	   //삭제된 회원인지 확인
   	UserDTO user = userService.login(user_id);
	 int cartCountNormal = cartService.getCartCountNormal(user_id);
	 int cartCountSpecial = cartService.getCartCountSpecial(user_id);
	 int cartCount = cartCountNormal + cartCountSpecial;
	 if (user == null || user.getDelete_plug() == 1) {
		 //여러 시도끝에 그냥 인코드 해서 에러메세지넘겨줌
		    String errorMessage = "해당하는 정보가 없습니다.";
		    return "redirect:/loginPage?errorMessage=" + URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
		}
   	
   	//비크립트로 비밀번호 검증
   	if (user != null && passwordEncoder.matches(password, user.getPassword()) ) {
	    	session.setAttribute("userId", user.getUser_id());
	        session.setAttribute("userAdmin", user.getJob_num());
	        session.setAttribute("cartCount", cartCount);
	        session.setMaxInactiveInterval(300);
	        //관리자/매니저라면 관리자 페이지로 사용자는 메인으로
   	if(user.getJob_num() == 1 || user.getJob_num() == 2){
   		return "redirect:admin/page";  
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
 
    
   
    //아이디 찾기 페이지
    @GetMapping("/findIdPage")
    public String findIdPage() {
        return "user/findaccount"; 
    }
    
    //아이디 찾기
    @PostMapping("/findId")
    public String findId(@RequestParam String user_name, @RequestParam String mail, Model model) {
    	UserDTO user = userService.getUserByEmailAndName(user_name, mail);
    	if (user == null || user.getDelete_plug() == 1) {
   		 //여러 시도끝에 그냥 인코드 해서 에러메세지넘겨줌
   		    String errorMessage = "해당하는 정보가 없습니다.";
   		    return "redirect:/findIdPage?errorMessage=" + URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
   		}
    	String userId = user.getUser_id();
    	model.addAttribute("userId", userId);
    	return "user/getuserid"; 
    }
    //비밀번호 찾기 페이지 이동
    @GetMapping("/findPasswordPage")
    public String findPasswordPage() {
    	return "user/findpassword";
    }

    //암호 넘겨주기
    @PostMapping("/findPassword")
    public String findPassword(@RequestParam String mail, String user_name, Model model) {
    	UserDTO user = userService.getUserByEmailAndName(user_name, mail);
    	if (user == null || user.getDelete_plug() == 1) {
     		 //여러 시도끝에 그냥 인코드 해서 에러메세지넘겨줌
     		    String errorMessage = "해당하는 정보가 없습니다.";
     		    return "redirect:/findPasswordPage?errorMessage=" + URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
     		}
    	//랜덤 비밀번호 생성 후 메일로 보내기
    	String str = randomPassword.generateRandomString();
    	emailService.sendSimpleMessage(mail, "우리집 AI 냉장고 임시 비밀번호 발송해드렸습니다.", (str.toString() + "  " + "임시 비밀번호를 사용해 비밀번호를 변경해주세요."));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user/checkquickpassword");
        model.addAttribute("mail",mail);
        model.addAttribute("user_name",user_name);
        model.addAttribute("str",str);
        
        return "user/checkquickpassword";
    }
    
    //암호 확인후 비번 변경 페이지 이동
    @PostMapping("/loseUserChangePassword")
    public String LosingChangePassword(@RequestParam String user_name,
    									@RequestParam String mail,
    									Model model) {
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("user/makenewpassword");
    	model.addAttribute("mail",mail);
        model.addAttribute("user_name",user_name);
        return "user/makenewpassword";
    }
    
    //비밀번호 변경
    @PostMapping("/makenewpassword")
    public String MakeNewPassword(@RequestParam String user_name,
									@RequestParam String mail,
									@RequestParam String password) {
    	UserDTO user = userService.getUserByEmailAndName(user_name, mail);
    	String hashedPassword = passwordEncoder.encode(password);
    	user.setPassword(hashedPassword);
    	boolean result = userService.updateUser(user);
    	if(result) {
    		return "redirect:/loginPage";
    	}
    	return "error"; 
    	
    }
    //좋와요 누르기
    @GetMapping("/userLikeUP")
    @ResponseBody
    public String userLikeUP(@RequestParam int recipe_id, HttpServletRequest request) {
    	System.out.println(recipe_id);
    	HttpSession session = request.getSession();
	    String user_id = (String) session.getAttribute("userId");
    	boolean result = userService.insertUserLike(recipe_id, user_id);
    	return "success";
    }
    //좋와요 삭제
    @GetMapping("/deleteUserLike")
    @ResponseBody
    public String deleteUserLike(@RequestParam int recipe_id, HttpServletRequest request) {
    	HttpSession session = request.getSession();
	    String user_id = (String) session.getAttribute("userId");
    	boolean result = userService.deleteUserLike(recipe_id, user_id);
    	return "success";
    }

    // 마이페이지 찜 목록 접속
    @GetMapping("/userLikePage")
    public ModelAndView getUserLike(@RequestParam String user_id) {
    	ModelAndView mav = new ModelAndView();
    	List<RecipeDTO> likeList = userService.getUserLike(user_id);
    	mav.setViewName("mypage/userlike");
        mav.addObject("likeList", likeList);      
//        System.out.println(likeList.size());
        return mav;
    }
    
    //마이페이지 접속 및 조회
    @GetMapping("/mypage/info")
    public ModelAndView getUserInfo( HttpServletRequest request) {
    	HttpSession session = request.getSession();
	    String user_id = (String) session.getAttribute("userId");
    	ModelAndView mav = new ModelAndView("mypage/mypage");
    	UserDTO mypage = userService.getUserInfo(user_id);
        mav.addObject("mypage", mypage);
        return mav;
    }
    
 
    // 마이페이지 계정 삭제
    @PostMapping("/deleteUser")
    @ResponseBody
    public int deleteUser(@RequestParam String user_id, String password, HttpSession session, RedirectAttributes redirectAttributes) {
    	int result = 0;
    	UserDTO user = userService.login(user_id);
    	if(passwordEncoder.matches(password, user.getPassword())) {
    		
    		result = userService.deleteUser(user_id);
    	}
    	
    	return result;
    	
    }
    	
    // 비밀번호 비교
    @PostMapping("/selectPassword")
    @ResponseBody
    public int selectPassword(@RequestParam String user_id, String password, HttpSession session, RedirectAttributes redirectAttributes) {
    	int result = 0;
    	UserDTO user = userService.login(user_id);
    	if(passwordEncoder.matches(password, user.getPassword())) {
    		result = 1;
    	} else {
    		result = 0;
    	}
        
        return result;
    }

 // 마이페이지에서 정보수정 페이지로
    @GetMapping("/userEdit")
	public ModelAndView updateUserPage1S(HttpServletRequest request) {
    	String user_id = (String) request.getSession().getAttribute("userId");
    	//select user userId service -> mapper -> mapper.xml 
		//model -> ("/userEdit") -> view  name userEdit.jsp
		//Model, view -> ModelAndView
		//model.addObject("modelName", modelValue);
		//model.setViewName("/mypage/useredit1")
		 
		//${modelName.memberName}
    	ModelAndView mav = new ModelAndView("/mypage/useredit");
    	UserDTO userInfo = userService.getUserInfo(user_id);
        mav.addObject("useredit", userInfo);
		if (user_id != null) {
					return mav;
	            } else {
	            	mav.setViewName("user/login");
	                return mav;
	            }
		}
    
    
 // 마이페이지 정보수정
    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute UserDTO user, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        // 사용자 정보 업데이트 로직 실행
        String user_id = (String) request.getSession().getAttribute("userId");
      
        user.setUser_id(user_id);
        boolean updateResult = userService.updateUser(user);
      
        if (updateResult) {
            redirectAttributes.addFlashAttribute("message", "회원 정보가 성공적으로 업데이트되었습니다.");
            return "redirect:/mypage/info";
        } else {
            redirectAttributes.addFlashAttribute("error", "회원 정보 업데이트에 실패했습니다.");
            return "redirect:/mypage/edit?user_id=" + user.getUser_id(); // 정보 수정 페이지로 리다이렉션
        }
    }
    
    // 마이페이지 비밀번호 변경
    @PostMapping("/updatePassword")
    public String updatePassword(HttpSession session, @RequestParam("newPassword") String newPassword, RedirectAttributes redirectAttributes) {
    	String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login";
        }

        // 새 비밀번호 암호화
        String encodedNewPassword = passwordEncoder.encode(newPassword);
        // 비밀번호 업데이트 서비스 호출
        boolean isPasswordChanged = userService.updatePassword(userId, encodedNewPassword);
        if (isPasswordChanged) {
            redirectAttributes.addFlashAttribute("successMessage", "비밀번호가 성공적으로 변경되었습니다.");
            return "redirect:/mypage/info";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "비밀번호 변경에 실패했습니다.");
        }

        return "redirect:/";
    }

    
    // 환불 및 교환 시 연락처/이메일 페이지 이동
    @GetMapping("/mypage/refundPage")
    public String refundPage() {
        return "mypage/refund"; // 환불/교환 페이지로 이동
    }
    
    //마이페이지 다이어트 수정
    @GetMapping("/mypage/diet")
    public String dietPage(String dietOption, HttpServletRequest request) {
    	String userId = (String) request.getSession().getAttribute("userId");    
    	//다이어트 업데이트
    	if (dietOption != null) {
    		userService.updateDietByUserId(userId, dietOption);
		}
	
    	return "redirect:/mypage/info";
    }
    
    
}

