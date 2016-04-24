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
        return userMapper.getAllUsers();
    }

    @Override
    public User createUser(User user) {
        return userMapper.createUser(user);
    }

    @Override
    public User getUserById(Long id) {
        return userMapper.getUserById(id);
    }

    @Override
    public User updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public Long deleteUserById(Long id) {
        return userMapper.deleteUser(id);
    }

}
