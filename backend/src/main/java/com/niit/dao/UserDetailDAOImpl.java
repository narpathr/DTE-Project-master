package com.niit.dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.niit.model.UserDetail;

@Repository("userDetailDAO")
public class UserDetailDAOImpl implements UserDetailDAO {
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public boolean addUserDetail(UserDetail userDetail) {
		try {
			sessionFactory.getCurrentSession().save(userDetail);
			return true;
		}
		catch(Exception e) {
			System.out.println("There is an exception here! The details are: \n =================================");
			System.out.println(e);
			return false;
		}
	}
	
	@Transactional
	@Override
	public boolean deleteUserDetail(UserDetail userDetail) {
		try {
			sessionFactory.getCurrentSession().delete(userDetail);
			return true;
		}
		catch(Exception e) {
			System.out.println("There is an exception here! The details are: \n =================================");
			System.out.println(e);
			return false;
		}
	}
	@Transactional
	@Override
	public boolean updateUserDetail(UserDetail userDetail) {
		try {
			sessionFactory.getCurrentSession().update(userDetail);
			return true;
		}
		catch(Exception e) {
			System.out.println("There is an exception here! The details are: \n =================================");
			System.out.println(e);
			return false;
		}
	}
	
	@Transactional
	@Override
	public UserDetail viewUserDetailByEmail(String emailId) {
		try {
			return (UserDetail) sessionFactory.getCurrentSession().createQuery("from UserDetail where emailID='"+emailId+"'").list();
		}catch(Exception e) {
			System.out.println("There is an exception here! The details are: \n =================================");
			System.out.println(e);
			return null;
		}		
	}

	@Transactional
	@Override
	public UserDetail viewUserDetailByUsername(String username) {
		try {
			return (UserDetail) sessionFactory.getCurrentSession().createQuery("from UserDetail where username='"+username+"'").list().get(0);
		}catch(Exception e) {
			System.out.println("There is an exception here! The details are: \n =================================");
			System.out.println(e);
			return null;
		}		
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<UserDetail> listUserDetails() {
		try {
			return (List<UserDetail>) sessionFactory.getCurrentSession().createQuery("from UserDetail").list();
		}catch(Exception e) {
			System.out.println("There is an exception here! The details are: \n =================================");
			System.out.println(e);
			return null;
		}		
	}	
}