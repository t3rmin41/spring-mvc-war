package com.simple.mvc.service;

import java.util.List;

import com.simple.mvc.domain.User;

public interface UserService {

    List<User> getAllUsers();
    User createUser(User user);
    User getUserById(Long id);
    User updateUser(User user);
    Long deleteUserById(Long id);
}
