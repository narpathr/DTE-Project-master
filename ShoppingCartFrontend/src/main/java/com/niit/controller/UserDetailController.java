package com.niit.controller;

import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.niit.dao.CategoryDAO;
import com.niit.dao.UserDetailDAO;
import com.niit.model.Category;
import com.niit.model.UserDetail;

@Controller
public class UserDetailController {
	@Autowired
	UserDetailDAO userDetailDAO;
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping("/viewUsersList")
	public String listUsers(Model m) {
		List<UserDetail> userList = userDetailDAO.listUserDetails();
		m.addAttribute("userList", userList);
		return "viewUsersList";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/login_success")
	public String showSuccessPage(HttpSession session, Model m) {
		String page="";
		boolean loggedIn = false;
		
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();
		String username = authentication.getName();
		UserDetail userFromDB;
		
		Collection<GrantedAuthority> rolesList = (Collection<GrantedAuthority>)securityContext.getAuthentication().getAuthorities();
		
		for(GrantedAuthority role: rolesList) {
			session.setAttribute("role", role);
			if(role.getAuthority().equals("ROLE_ADMIN")) {
				loggedIn = true;
				page = "adminHome";
				userFromDB = userDetailDAO.viewUserDetailByUsername(username);
				session.setAttribute("nameOfUser", userFromDB.getName());
				session.setAttribute("username", username);
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("userType", "admin");
			}
			else {
				loggedIn = true;
				page = "index";
				userFromDB = userDetailDAO.viewUserDetailByUsername(username);
				session.setAttribute("nameOfUser", userFromDB.getName());
				session.setAttribute("username", username);
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("userType", "user");
				List<Category> listCategories = categoryDAO.listCategory();
				m.addAttribute("listCategories", listCategories);
			}				
		}		
		return page;
	}
	
	@RequestMapping(value="/editUser/{username}", method=RequestMethod.GET)
	public String showUpdateUserPage(@PathVariable("username")String username,Model m) {
		UserDetail userDetail = userDetailDAO.viewUserDetailByUsername(username);
		m.addAttribute("user", userDetail);
		return "editUserDetails";
	}
	
	@RequestMapping(value="/editUserDetails", method=RequestMethod.POST)
	public String updateUserDetails(@ModelAttribute("user")UserDetail userDetail, Model m, HttpSession session) {
		System.out.println("Inside update User Details method");
		System.out.println("User Name from the form is "+userDetail.getUsername());
		userDetailDAO.updateUserDetail(userDetail);		
		
		List<UserDetail> userList = userDetailDAO.listUserDetails();
		m.addAttribute("userList", userList);
		String userType = (String)session.getAttribute("userType");
		if(userType.equals("admin"))
			return "viewUsersList";
		else {
			List<Category> listCategories = categoryDAO.listCategory();
			m.addAttribute("listCategories", listCategories);
			return "index";
		}
	}
	
	@RequestMapping(value="/addUserDetail",method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user")UserDetail userDetail, Model m) {
		System.out.println("Name of the user from the form: "+userDetail.getName());
		System.out.println("Name of the user from the form: "+userDetail.getUsername());
		String message;
		UserDetail userCheckByUsername, userCheckByEmail = null;
		userCheckByUsername = userDetailDAO.viewUserDetailByUsername(userDetail.getUsername());
		if(userCheckByUsername==null)
			System.out.println("No user returned for username "+userDetail.getUsername());
		userCheckByEmail = userDetailDAO.viewUserDetailByEmail(userDetail.getEmailId());
		if(userCheckByUsername!=null && userCheckByEmail!=null) {
			message = "Both username and email are already registered";
			System.out.println(message);
			m.addAttribute("message", message);
			m.addAttribute("user", userDetail);
			return "Register";			
		} else if(userCheckByUsername==null && userCheckByEmail!=null){
			message = "Email are already registered. Please login";
			System.out.println(message);
			m.addAttribute("message", message);
			m.addAttribute("user", userDetail);
			return "Register";
		}else if(userCheckByUsername!=null && userCheckByEmail==null){
			message = "Username already exists. Please try with a different username";
			System.out.println(message);
			m.addAttribute("message", message);
			m.addAttribute("user", userDetail);
			return "Register";
		} else {
			userDetail.setEnabled(true);
			userDetail.setRole("ROLE_USER");
			userDetailDAO.addUserDetail(userDetail);
			System.out.println("New User Added!");
			m.addAttribute("user", userDetail);
			return "Login";
		}		
	}
	
	@RequestMapping(value="/deleteUser/{username}", method=RequestMethod.GET)
	public String deleteUserDetails(@PathVariable("username")String username, Model m) {
		UserDetail user = userDetailDAO.viewUserDetailByUsername(username);
		userDetailDAO.deleteUserDetail(user);
		List<UserDetail> userList = userDetailDAO.listUserDetails();
		m.addAttribute("userList", userList);
		return "viewUsersList";
	}
}
