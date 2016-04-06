package com.simple.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simple.mvc.domain.User;
import com.simple.mvc.domain.UserMapperWithJpa;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapperWithJpa userMapper;
    
    @Override
    public List<User> getAllUsers() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public User createUser(User user) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public User getUserById(Long id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public User updateUser(User user) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Long deleteUserById(Long id) {
        // TODO Auto-generated method stub
        return null;
    }

}
