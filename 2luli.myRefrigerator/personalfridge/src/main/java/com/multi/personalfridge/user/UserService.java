package com.multi.personalfridge.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.dto.UserLikeDTO;


@Service
public class UserService {
	private final UserMapper userMapper;
	private final BCryptPasswordEncoder passwordEncoder;
	
    @Autowired
    public UserService(UserMapper userMapper,
    					BCryptPasswordEncoder passwordEncoder) {
        this.userMapper = userMapper;
        this.passwordEncoder = passwordEncoder;
    }
	
	//로그인
	public UserDTO login(String user_id) {
        return userMapper.login(user_id);
    }
	
	// 회원가입
	public boolean insertUser(UserDTO user) {
		String hashedPassword = passwordEncoder.encode(user.getPassword());
    	user.setPassword(hashedPassword);
		try {
			userMapper.insertUser(user);
		return true; 
	
		}catch (Exception e) {
			e.printStackTrace();
		 return false; 
		}
	}
	
	// 회원탈퇴
	public int deleteUser(String userId) {
		return userMapper.deleteUser(userId);
		
	}
	
	// 회원탈퇴 비밀번호
	public int selectPassword(String user_id, String password) {
//		System.out.println("UserService, selectpassword" + userMapper.selectPassword(user_id, password));
		String hashedPassword = passwordEncoder.encode(password);
		System.out.println("hashedPassword : " + hashedPassword);
		return userMapper.selectPassword(user_id, hashedPassword);
	}

	// 회원정보 수정
	public boolean updateUser(UserDTO userDTO) {
//		System.out.println("UserService, updateUser UserDTO:" + userDTO);
		try {
			userMapper.updateUser(userDTO);
		return true; 
	
		}catch (Exception e) {
			e.printStackTrace();
		 return false; 
		}
	}
	
	// 비밀번호 수정
	 public boolean updatePassword(String userId, String encodedNewPassword) {
	        try {
	            // 사용자 ID로 사용자 정보 조회
	            UserDTO user = userMapper.getUserInfo(userId);
	            
	            // 조회된 사용자가 없는 경우
	            if (user == null) {
	                System.out.println("아이디를 못찼겠습니다");
	                return false;
	            }
	            // 비밀번호 업데이트
	            user.setPassword(encodedNewPassword);
	            int updatedRows = userMapper.updatePassword(user);

	            // 업데이트된 행이 없는 경우
	            if (updatedRows == 0) {

	                return false;
	            }
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	public UserDTO getUserById(String userId) {
		return userMapper.getUserById(userId);
	}

	public List<UserDTO> getAlluser() {
		
		return userMapper.getAlluser();
	}

	public List<UserDTO> getAllUserPage(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return userMapper.getAllUserPage(parameters);
	}

	public boolean deleteUserAdmin(String user_id) {
		try {
			userMapper.deleteUserAdmin(user_id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	public boolean userUpdateToManager(String user_id) {
		try {
			userMapper.userUpdateToManager(user_id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	public List<UserDTO> getAlluserByKeyword(String keyword) {
		Map<String, String> parameters = new HashMap<>();
		parameters.put("keyword", keyword);
		return userMapper. getAlluserByKeyword(parameters);
	}

	public List<UserDTO> getAllUserByKewordPage(String keyword, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("keyword", keyword);
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return userMapper.getAllUserByKewordPage(parameters);
	}

	public UserDTO getUserByEmailAndName(String user_name, String mail) {
		
		return userMapper.getUserByEmailAndName(user_name, mail);
		 
	}

	public boolean InsertUserInfoBySocial(UserDTO user) {
		try {
			userMapper.InsertUserInfoBySocial(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	
	// 찜목록 조회
	public List<RecipeDTO> getUserLike(String user_id) {
//		System.out.println("UserService, getuserLike user_id = " + user_id);
		return userMapper.getUserLike(user_id);
	}
	
	// 마이페이지 유저 정보 조회
	public UserDTO getUserInfo(String user_id) {
//		System.out.println("UserService , getUserInfo() user_id :" + user_id);
		return userMapper.getUserInfo(user_id);
		
	}

	public boolean verifyPassword(String userId, String password) {	
		return false;
	}
	
	//좋와요 등록
	public boolean insertUserLike(int recipe_id, String user_id) {
		try {
			userMapper.insertUserLike(recipe_id, user_id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//좋와요 조회 레시피 목록에서
	public UserLikeDTO searchUserLike(int recipe_id, String user_id) {
		 Map<String, Object> parameters = new HashMap<>();
		 parameters.put("recipe_id", recipe_id);
		 parameters.put("user_id", user_id);
		return userMapper.searchUserLike(parameters);
	}

	public boolean deleteUserLike(int recipe_id, String user_id) {
		try {
			 Map<String, Object> parameters = new HashMap<>();
			 parameters.put("recipe_id", recipe_id);
			 parameters.put("user_id", user_id);
			userMapper.deleteUserLike(parameters);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	//------------------------------------------------

	public void paid(Map<String, Object> map) {
		userMapper.paid(map);
	}


	public void rePaid(Map<String, Object> map) {
		userMapper.rePaid(map);		
	}


	public String paidCheck(String ID) {
	    return userMapper.paidCheck(ID);
	}

	public void updateDietByUserId(String userId, String dietOption) {
		userMapper.updateDietByUserId(userId, dietOption);
		
	}

	
}
