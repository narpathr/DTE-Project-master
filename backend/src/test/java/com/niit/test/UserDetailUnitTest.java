package com.niit.test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import java.util.List;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.niit.dao.UserDetailDAO;
import com.niit.model.UserDetail;

public class UserDetailUnitTest {
	
	static UserDetailDAO userDetailDAO;
	
	@SuppressWarnings("resource")
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		userDetailDAO=(UserDetailDAO)context.getBean("userDetailDAO");
	}
	@Ignore
	@Test
	public void addUserDetailTest() {
		UserDetail userDetail = new UserDetail();
		userDetail.setUsername("U1002");
		userDetail.setName("Sansa");
		userDetail.setPassword("pass123");
		userDetail.setMobileNo("9943952979");
		userDetail.setEmailId("sansa@home.com");
		userDetail.setAddress("46, Winterfell - HYD12Z");
		userDetail.setEnabled(true);
		userDetail.setRole("admin");
		assertTrue("Problem in Product Insertion",userDetailDAO.addUserDetail(userDetail));
	}
	
	@Ignore
	@Test
	public void deleteUserDetailTest() {
		UserDetail userDetail = userDetailDAO.viewUserDetailByEmail("sansa@winterfell.com");
		assertTrue("Problem in Product Insertion",userDetailDAO.deleteUserDetail(userDetail));
	}
	
	@Ignore
	@Test
	public void viewUserDetailByEmailTest() {
		assertNotNull("Problem in get Product",userDetailDAO.viewUserDetailByEmail("arya@winterfell.com"));
		UserDetail user = userDetailDAO.viewUserDetailByEmail("arya@winterfell.com");
		System.out.println("User Name is "+user.getUsername());
		System.out.println("Name is "+user.getName());
		System.out.println("Password is "+user.getPassword());
		System.out.println("Mobile number is "+user.getMobileNo());
		System.out.println("Address is "+user.getAddress());
	}	
	
	@Ignore
	@Test
	public void viewUserDetailByUsernameTest() {
		assertNotNull("Problem in get Product",userDetailDAO.viewUserDetailByUsername("U1001"));
		UserDetail user = userDetailDAO.viewUserDetailByUsername("U1001");
		System.out.println("User Name is "+user.getUsername());
		System.out.println("Name is "+user.getName());
		System.out.println("Password is "+user.getPassword());
		System.out.println("Mobile number is "+user.getMobileNo());
		System.out.println("Email ID is "+user.getEmailId());
		System.out.println("Address is "+user.getAddress());
	}
	
	
	@Test
	public void updateUserDetailTest() {
		UserDetail user = userDetailDAO.viewUserDetailByUsername("U1002");
		//user.setAddress("22, Hate Hound, Roam Around, Needle - STARK");
		user.setEmailId("sansa@winterfell.com");
		assertTrue("Problem in Product Insertion",userDetailDAO.updateUserDetail(user));
	}
		
	@Test
	public void listUserDetails(){
		assertNotNull("Issue in listing user details..",userDetailDAO.listUserDetails());
		List<UserDetail> listUserDetails = userDetailDAO.listUserDetails();
		System.out.println("User Name\t Name \t\t Mobile Number\t\t Email ID\t\t\t Address");
		for(UserDetail user:listUserDetails) {
			System.out.print(user.getUsername()+"\t\t");
			System.out.print(user.getName()+"\t\t");
			System.out.print(user.getMobileNo()+"\t\t");
			System.out.print(user.getEmailId()+"\t\t");
			System.out.println(user.getAddress());
		}
	}
}