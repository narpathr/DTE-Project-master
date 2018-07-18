package com.niit.dao;

import java.util.List;
import com.niit.model.UserDetail;

public interface UserDetailDAO {
	public boolean addUserDetail(UserDetail userDetail);
	public boolean deleteUserDetail(UserDetail userDetail);
	public boolean updateUserDetail(UserDetail userDetail);
	public UserDetail viewUserDetailByEmail(String emailId);
	public UserDetail viewUserDetailByUsername(String username);
	public List<UserDetail> listUserDetails();
}
