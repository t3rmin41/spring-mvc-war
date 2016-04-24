package com.simple.mvc.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.simple.mvc.jpa.UserJpa;
import com.simple.mvc.repository.UserRepository;

@Component
public class UserMapperWithJpa {

    @Autowired
    private UserRepository userRepository;
    
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        List<UserJpa> jpaList = userRepository.getAllUsers();
        for (UserJpa jpa : jpaList) {
            users.add(singleMapperToDomain(jpa));
        }
        return users;
    }
    
    public User createUser(User user) {
        UserJpa jpa = singleMapperToJpa(user);
        jpa = userRepository.createUser(jpa);
        return singleMapperToDomain(jpa);
    }
    
    public User getUserById(Long userId) {
        UserJpa jpa = userRepository.getUserJpaById(userId);
        return singleMapperToDomain(jpa);
    }
    
    public User updateUser(User user) {
        UserJpa jpa = editDomainToJpa(user);
        jpa = userRepository.editUser(jpa);
        return singleMapperToDomain(jpa);
    }
    
    public Long deleteUser(Long userId) {
        return userRepository.deleteUserById(userId);
    }
    
    private User singleMapperToDomain(UserJpa jpa) {
        User user = new User();
        user.setId(jpa.getId());
        user.setUsername(jpa.getUsername());
        user.setPassword(jpa.getPassword());
        user.setEmail(jpa.getEmail());
        user.setIsAdmin(jpa.isAdmin());
        user.setCreated(jpa.getCreated());
        user.setUpdated(jpa.getUpdated());
        return user;
    }
    
    private UserJpa singleMapperToJpa(User domain) {
        UserJpa jpa = new UserJpa();
        jpa.setId(domain.getId());
        jpa.setUsername(domain.getUsername());
        jpa.setPassword(domain.getPassword());
        jpa.setEmail(domain.getEmail());
        jpa.setAdmin(domain.getIsAdmin());
        jpa.setCreated(domain.getCreated());
        jpa.setUpdated(domain.getUpdated());
        return jpa;
    }
    
    private UserJpa editDomainToJpa(User domain) {
        UserJpa jpa = userRepository.getUserJpaById(domain.getId());
        jpa.setUsername(domain.getUsername());
        jpa.setEmail(domain.getEmail());
        return jpa;
    }
}
